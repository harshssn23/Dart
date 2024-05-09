from flask import Flask, render_template, request, jsonify

app = Flask(__name__)

# Dictionary containing details about each fruit
fruit_details = {
    'apple': {'color': 'red', 'taste': 'sweet'},
    'banana': {'color': 'yellow', 'taste': 'sweet'},
    'orange': {'color': 'orange', 'taste': 'sweet and tangy'},
    'grape': {'color': 'green, purple', 'taste': 'sweet'},
    'kiwi': {'color': 'brown', 'taste': 'tangy'},
    'pineapple': {'color': 'yellow', 'taste': 'tangy and sweet'},
    'strawberry': {'color': 'red', 'taste': 'sweet'},
    'watermelon': {'color': 'green', 'taste': 'sweet and juicy'}
}

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/search')
def search():
    query = request.args.get('query')
    # Perform search logic
    results = []
    for fruit, details in fruit_details.items():
        if query.lower() in fruit.lower():
            result = {'name': fruit, 'details': details}
            results.append(result)
    if query=="":
        return jsonify({'results':[]})
    else:
        return jsonify({'results': results})

if __name__ == '__main__':
    app.run(debug=True)
