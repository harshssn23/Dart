from flask import Flask, render_template, jsonify
import time

app = Flask(__name__)

# Function to generate dynamic content
def generate_dynamic_content():
    return f"Dynamic content updated at {time.strftime('%H:%M:%S')}"

@app.route('/dynamic-content')
def dynamic_content():
    content = generate_dynamic_content()
    return jsonify({'content': content})

@app.route('/')
def index():
    return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True)
