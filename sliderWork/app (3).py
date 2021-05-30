from flask import Flask, request, render_template, jsonify

app = Flask(__name__)


@app.route('/')
def home():
    return render_template('predict.html')


@app.route('/predict', methods=['POST'])
def predict():
    predict_list = []
    fixed_acidity = request.form['fixed_acidity']
    volatile_acidity = request.form['volatile_acidity']
    citric_acid = request.form['citric_acid']
    residual_sugar = request.form['residual_sugar']
    chlorides = request.form['chlorides']
    free_sulfur_dioxide = request.form['free_sulfur_dioxide']
    total_sulfur_dioxide = request.form['total_sulfur_dioxide']
    density = request.form['density']
    pH = request.form['pH']
    sulphates = request.form['sulphates']
    alcohol = request.form['alcohol']

    predict_list.append(fixed_acidity)
    predict_list.append(volatile_acidity)
    predict_list.append(citric_acid)
    predict_list.append(residual_sugar)
    predict_list.append(chlorides)
    predict_list.append(free_sulfur_dioxide)
    predict_list.append(total_sulfur_dioxide)
    predict_list.append(density)
    predict_list.append(pH)
    predict_list.append(sulphates)
    predict_list.append(alcohol)

    print(f"=======================")
    print(f"{predict_list}")
    print(f"=======================")

    return render_template('predict.html', predict_list=predict_list)


if __name__ == "__main__":
    app.run(debug=True)
