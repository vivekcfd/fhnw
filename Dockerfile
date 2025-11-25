FROM python:3.10-slim
WORKDIR /app
COPY . /app
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 7860
CMD ["voila", "--port=7860", "--no-browser", "--Voila.ip=0.0.0.0", "your_notebook.ipynb"]
