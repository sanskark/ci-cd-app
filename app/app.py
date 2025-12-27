import os

from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return 'CI/CD pipeline is working!'

@app.route('/health')
def health_check():
    return {'status': 'UP', 'version': os.getenv('APP_VERSION', 'v1')}


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
