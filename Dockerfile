# Use the official Python 3.6.5 image
FROM python:3.6.5

# Problems? Contact:
LABEL maintainer="Christoph Casimir Odermatt"

# Set the working directory to /app
WORKDIR /app

# Get the 
COPY requirements.txt /app
RUN pip3 install --no-cache-dir -r requirements.txt

# Configuring access to Jupyter
RUN mkdir /notebooks
RUN jupyter notebook --generate-config --allow-root
RUN echo "c.NotebookApp.password = u'sha1:a45dbbcd7fc2:c45f335151914df6f054ae9f5ee0021e03ea07d0'" >> /root/.jupyter/jupyter_notebook_config.py

# Jupyter listens port: 8888
EXPOSE 8888

# Run Jupytewr notebook as Docker main process
CMD ["jupyter", "notebook", "--allow-root", "--notebook-dir=/notebooks", "--ip='*'", "--port=8888", "--no-browser"]