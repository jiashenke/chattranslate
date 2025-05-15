# chattranslate
chattranslate is a Markdown translation tool and chat.You can talk to the translation server.When you enter it into Chinese it is translated into English, when you enter it back to Chinese.
![Image](https://github.com/user-attachments/assets/f863f888-7afd-419b-85a6-f32a44f2b107)

# Markdown Translation Tool - Introduction and User Guide  

## Software Introduction  

The Markdown Translation Tool is a web application developed based on Flask, specifically designed for technical writers and Markdown users. It offers the following features:  

1. **Intelligent Translation Functionality**:  
   - Automatically detects the language of the input text (supports Chinese-English bidirectional translation)  
   - Calls professional translation services via API  
   - Preserves original text formatting and structure  

2. **Markdown Support**:  
   - Full Markdown syntax rendering  
   - Syntax highlighting for code blocks  
   - Supports extended syntax such as tables and footnotes  

3. **User-Friendly Interface**:  
   - Clean and simple web interface  
   - Real-time translation results  
   - Displays both original and translated text with HTML preview  

4. **Technical Features**:  
   - Built on the Python Flask framework  
   - Uses Pygments for code highlighting  
   - Responsive design, compatible with different devices  

## User Guide  

### System Requirements  

- Modern browsers (Chrome, Firefox, Edge, etc.)  
- Internet connection (for translation API calls)  

### Installation and Setup  

1. Ensure Python 3.6+ is installed.  
2. Install required dependencies:  
   ```  
   pip install flask requests markdown pygments  
   ```  
3. Run the application:  
   ```  
   python app.py  
   ```  
4. Access the tool in your browser at: `http://localhost:5000`  

### Basic Usage  

1. **Access the Homepage**:  
   - Open your browser and enter the application URL.  
   - You will see the main interface of the translation tool.  

2. **Input Text**:  
   - Paste or type the Markdown text to be translated in the input box.  
   - Can include special formatting such as code blocks and tables.  

3. **Execute Translation**:  
   - Click the "Translate" button.  
   - The system will automatically detect the language and translate it (Chinese ⇄ English).  

4. **View Results**:  
   - Both the original and translated text will be displayed.  
   - You can toggle between plain text and rendered HTML preview.  
   - Code blocks will be highlighted with syntax colors.  

### Advanced Features  

1. **Syntax Highlighting**:  
   - Code blocks are automatically highlighted based on language.  
   - Supports recognition of multiple programming languages.  

2. **Format Preservation**:  
   - Markdown elements such as headers, lists, and links remain intact after translation.  
   - Table structures are preserved.  

3. **HTML Preview**:  
   - View the converted HTML output.  
   - Convenient for checking the final rendered result.  

### Notes  

1. The translation API requires a valid authentication token (AUTH_TOKEN).  
2. Translating large texts may take longer.  
3. Complex Markdown structures may require minor adjustments after translation.  
4. Ensure the translation server (`http://localhost:8989`) is running properly.  

## Technical Support  

For any questions or suggestions, please contact the development team. We are continuously improving the product to provide a better Markdown document translation experience.
