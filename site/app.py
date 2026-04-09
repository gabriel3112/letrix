from flask import Flask, jsonify, render_template
from flask_cors import CORS
import random
import mysql.connector

app = Flask(__name__)
CORS(app)

conexao = mysql.connector.connect(
    host="localhost",
    user="root",
    password="123456",
    database="LETRIX",
)

@app.route('/')
def home():
    return render_template("intro.html")

@app.route('/jogo')
def jogo():
    return render_template("main.html")

@app.route('/letrix')
def letrix():
    cursor = conexao.cursor(dictionary=True)
    cursor.execute("SELECT palavra, imagem FROM palavras")
    jogos = cursor.fetchall()
    cursor.close()
    jogo_selecionado = random.choice(jogos)
    return jsonify(jogo_selecionado)

if __name__ == '__main__':
    app.run(debug=True)

