FROM python:3.10-slim

WORKDIR /app/fellow-aiden

RUN pip install --upgrade pip && \
    pip install streamlit openai

# Lokalen Repo-Stand ins Image kopieren statt von GitHub zu klonen
COPY . /app/fellow-aiden
RUN pip install /app/fellow-aiden

WORKDIR /app/fellow-aiden/brew_studio

CMD ["sh", "-c", "exec streamlit run brew_studio.py --server.port=${PORT:-8501} --server.address=0.0.0.0"]