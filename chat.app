from flask import Flask, request, jsonify, render_template
import requests
import markdown
from pygments import highlight
from pygments.lexers import get_lexer_by_name
from pygments.formatters import HtmlFormatter

app = Flask(__name__)

# 配置信息
BASE_TRANSLATE_URL = "http://localhost:8989/language/translate/v2"
AUTH_TOKEN = "********"  # 替换为你的实际token

def translate_text(text, source_lang, target_lang):
    """调用翻译API进行翻译"""
    headers = {
        "Authorization": AUTH_TOKEN,
        "Content-Type": "application/json"
    }
    
    payload = {
        "q": text,
        "source": source_lang,
        "target": target_lang,
        "format": "text"
    }
    
    try:
        response = requests.post(BASE_TRANSLATE_URL, json=payload, headers=headers)
        response.raise_for_status()
        data = response.json()
        return data["data"]["translations"][0]["translatedText"]
    except Exception as e:
        print(f"翻译错误: {e}")
        return None

def detect_language(text):
    """简单检测输入文本的语言"""
    # 这里使用简单的规则检测，实际应用中可以使用更复杂的检测方法
    if any('\u4e00' <= char <= '\u9fff' for char in text):
        return "zh"
    else:
        return "en"

def markdown_to_html(text):
    """将Markdown转换为HTML，并添加语法高亮"""
    # 扩展Markdown支持
    extensions = ['fenced_code', 'codehilite', 'tables', 'footnotes']
    
    # 转换Markdown
    html = markdown.markdown(text, extensions=extensions)
    
    # 添加CSS样式
    style = HtmlFormatter().get_style_defs('.codehilite')
    html = f"<style>{style}</style>{html}"
    
    return html

@app.route('/')
def index():
    """渲染主页面"""
    return render_template('index.html')

@app.route('/translate', methods=['POST'])
def translate():
    """处理翻译请求"""
    data = request.get_json()
    text = data.get('text', '').strip()
    
    if not text:
        return jsonify({'error': '请输入要翻译的内容'}), 400
    
    # 检测输入语言
    source_lang = detect_language(text)
    target_lang = "en" if source_lang == "zh" else "zh"
    
    # 翻译文本
    translated_text = translate_text(text, source_lang, target_lang)
    
    if translated_text is None:
        return jsonify({'error': '翻译服务暂时不可用'}), 500
    
    # 转换Markdown为HTML
    original_html = markdown_to_html(text)
    translated_html = markdown_to_html(translated_text)
    
    return jsonify({
        'original_text': text,
        'translated_text': translated_text,
        'original_html': original_html,
        'translated_html': translated_html,
        'source_lang': source_lang,
        'target_lang': target_lang
    })

if __name__ == '__main__':
    app.run(debug=True, host="0.0.0.0",port=5000)