"""Application module."""

from fastapi import FastAPI
from prometheus_fastapi_instrumentator import Instrumentator

from webapp.containers import Container
from webapp import endpoints


def create_app() -> FastAPI:
    container = Container()

    db = container.db()
    db.create_database()

    app = FastAPI()
    app.container = container
    app.include_router(endpoints.router)
    Instrumentator().instrument(app).expose(app)
    return app


app = create_app()
