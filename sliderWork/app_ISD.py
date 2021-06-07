# import model functions
from pycaret.classification import load_model, predict_model
import pandas as pd

saved_final_rf = load_model('Final WHites RF Project-3 June2021')

from flask import Flask, request, render_template, jsonify

app = Flask(__name__)


@app.route('/')
def home(): 
    predict_list = []
    return render_template('predict_ISD.html' , predict_list=predict_list)
  


@app.route('/resources')
def resources(): 
    return render_template('resources.html')

#@app.route('/prediction')
#def prediction(): 
#    predict_list = []
#    return render_template('predict_ISD.html' , predict_list=predict_list)

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

    predict_list.append(float(fixed_acidity))
    predict_list.append(float(volatile_acidity))
    predict_list.append(float(citric_acid))
    predict_list.append(float(residual_sugar))
    predict_list.append(float(chlorides))
    predict_list.append(float(free_sulfur_dioxide))
    predict_list.append(float(total_sulfur_dioxide))
    predict_list.append(float(density))
    predict_list.append(float(pH))
    predict_list.append(float(sulphates))
    predict_list.append(float(alcohol))
    columns = ['fixed_acidity', 'volatile_acidity', 'citric_acid', 'residual_sugar',
       'chlorides', 'free_sulfur_dioxide', 'total_sulfur_dioxide', 'density',
       'ph', 'sulphates', 'alchohol']

    print(f"=======================")
    print(f"{predict_list}")
    print(f"=======================")
    selection_df =  pd.DataFrame([predict_list], columns= columns )
    print(selection_df)
    new_prediction = predict_model(saved_final_rf, data= selection_df, raw_score= True)
    print(new_prediction)
    # can pass one variable for reds and one for whites
    # in the return pass for prediction "table_red" or "table_white"
    table = new_prediction.to_html()
    return render_template('predict_ISD.html', predict_list=predict_list, prediction = table)


if __name__ == "__main__":
    app.run(debug=True)


