# sha256:ba3311e2e2e9b6d81996f997871a4e1f579107f7bfeced05eb88cd2d9edfe5aa
FROM quay.io/jupyter/pytorch-notebook:cuda12-hub-4.0.2

COPY --chown=${NB_UID}:${NB_GID} requirements.txt /tmp/

RUN conda run -n base pip install --no-cache-dir -r /tmp/requirements.txt && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}" && \
    rm /tmp/requirements.txt \