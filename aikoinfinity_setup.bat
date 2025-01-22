@echo on
REM AikoInfinity 2.0 Setup Script
REM Author: Gazi Pollob Hussain (জী পল্লব)

REM Define project-specific variables
set ROOT=AikoInfinity-2.0
set OPENAI_API_KEY=sk-5k98H4I4kx3m234Lf1VfJ8wETc5RrTu5KlW
set MODEL=gpt-o1:gpt-aikoinfinity
set FRONTEND_PORT=3000
set BACKEND_PORT=5000

echo ==========================================
echo Initializing AikoInfinity 2.0 Environment
echo ==========================================

REM Create project directories
echo Creating project directories...
mkdir %ROOT%
mkdir %ROOT%\frontend
mkdir %ROOT%\frontend\src
mkdir %ROOT%\frontend\public
mkdir %ROOT%\frontend\components
mkdir %ROOT%\frontend\pages
mkdir %ROOT%\frontend\styles
mkdir %ROOT%\backend
mkdir %ROOT%\backend\src
mkdir %ROOT%\backend\src\bff
mkdir %ROOT%\backend\src\services
mkdir %ROOT%\backend\src\middleware
mkdir %ROOT%\backend\src\api
mkdir %ROOT%\backend\tests
mkdir %ROOT%\config
mkdir %ROOT%\logs
mkdir %ROOT%\scripts
mkdir %ROOT%\docs

REM Generate Frontend Files
echo Creating frontend files...
echo "<!DOCTYPE html>" > %ROOT%\frontend\public\index.html
echo "<html lang='en'><head><meta charset='UTF-8'><title>AikoInfinity 2.0</title></head>" >> %ROOT%\frontend\public\index.html
echo "<body><div id='root'></div><script src='./bundle.js'></script></body></html>" >> %ROOT%\frontend\public\index.html

echo "import React from 'react';" > %ROOT%\frontend\components\Navbar.jsx
echo "const Navbar = () => <nav><h1>AikoInfinity 2.0</h1></nav>;" >> %ROOT%\frontend\components\Navbar.jsx
echo "export default Navbar;" >> %ROOT%\frontend\components\Navbar.jsx

echo "import React from 'react';" > %ROOT%\frontend\pages\Home.jsx
echo "const Home = () => <div>Welcome to AikoInfinity 2.0!</div>;" >> %ROOT%\frontend\pages\Home.jsx
echo "export default Home;" >> %ROOT%\frontend\pages\Home.jsx

echo "body { margin: 0; font-family: Arial, sans-serif; }" > %ROOT%\frontend\styles\global.css

REM Generate Backend Files
echo Creating backend files...
echo "from flask import Flask, jsonify" > %ROOT%\backend\src\app.py
echo "from middleware.cors_middleware import configure_cors" >> %ROOT%\backend\src\app.py
echo "from api.feedback_endpoints import feedback_api" >> %ROOT%\backend\src\app.py
echo "app = Flask(__name__)" >> %ROOT%\backend\src\app.py
echo "configure_cors(app)" >> %ROOT%\backend\src\app.py
echo "app.register_blueprint(feedback_api, url_prefix='/api/feedback')" >> %ROOT%\backend\src\app.py
echo "@app.route('/health', methods=['GET'])\ndef health(): return jsonify({'status': 'OK'}), 200" >> %ROOT%\backend\src\app.py
echo "if __name__ == '__main__': app.run(port=%BACKEND_PORT%, debug=True)" >> %ROOT%\backend\src\app.py

echo "def configure_cors(app):\n    from flask_cors import CORS\n    CORS(app, resources={r'/*': {'origins': '*'}})" > %ROOT%\backend\src\middleware\cors_middleware.py

echo "from flask import Blueprint, request, jsonify\nfeedback_api = Blueprint('feedback', __name__)" > %ROOT%\backend\src\api\feedback_endpoints.py
echo "@feedback_api.route('/', methods=['POST'])\ndef submit_feedback():\n    data = request.json\n    return jsonify({'status': 'success', 'data': data})" >> %ROOT%\backend\src\api\feedback_endpoints.py

REM Generate Config and Logs
echo Configuring environment variables...
echo "OPENAI_API_KEY=%OPENAI_API_KEY%" > %ROOT%\config\.env
echo "MODEL=%MODEL%" >> %ROOT%\config\.env

echo Creating logging files...
echo "INFO: AikoInfinity backend initialized successfully." > %ROOT%\logs\app.log
echo "ERROR: Placeholder for error logging." > %ROOT%\logs\error.log

REM Generate README
echo Creating README.md...
echo "# AikoInfinity 2.0 Ecosystem" > %ROOT%\README.md
echo "## Overview" >> %ROOT%\README.md
echo "AikoInfinity 2.0 integrates OpenAI APIs with advanced frontend and backend support." >> %ROOT%\README.md
echo "## Backend\n- Flask with CORS\n- Feedback API\n- OpenAI GPT integration" >> %ROOT%\README.md
echo "## Frontend\n- React with modular components\n- Global styling support" >> %ROOT%\README.md
echo "## How to Run\n1. Install dependencies\n2. Run the backend and frontend scripts" >> %ROOT%\README.md

REM Dependencies
echo Installing backend dependencies...
echo "Flask==2.1.1" > %ROOT%\requirements.txt
echo "Flask-CORS==3.0.10" >> %ROOT%\requirements.txt
echo "requests==2.27.1" >> %ROOT%\requirements.txt

REM Scripts
echo Creating run scripts...
echo "REM Run Backend\npython backend\src\app.py" > %ROOT%\scripts\run_backend.bat
echo "REM Run Frontend\nnpm start" > %ROOT%\scripts\run_frontend.bat

REM Finalization
echo ==========================================
echo AikoInfinity 2.0 Setup Complete
echo ==========================================
pause
