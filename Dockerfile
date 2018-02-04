FROM gcr.io/google-appengine/python
LABEL python_version=python3.6
RUN virtualenv --no-download /env -p python3.6

# Set virtualenv environment variables. This is equivalent to running
# source /env/bin/activate
ENV VIRTUAL_ENV /env
ENV PATH /env/bin:$PATH

ADD requirements.txt /app/
ADD requirements2.txt /app/

RUN apt-get update
RUN apt-get -y install redis-server supervisor

RUN pip2 install numpy scipy
RUN pip2 install --upgrade pip
RUN pip2 install -r requirements2.txt
RUN pip install -r requirements.txt
RUN pip install --upgrade setuptools
RUN pip2 install --upgrade setuptools

CMD /bin/bash

