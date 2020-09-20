# Definition of Submission container

FROM duckietown/challenge-aido_lf-template-pytorch:daffy


# let's create our workspace, we don't want to clutter the container
RUN rm -r /workspace; mkdir /workspace

# here, we install the requirements, some requirements come by default
# you can add more if you need to in requirements.txt
COPY requirements.txt /workspace
RUN pip install --use-feature=2020-resolver -r /workspace/requirements.txt

# let's copy all our solution files to our workspace
# if you have more file use the COPY command to move them to the workspace
COPY solution.py /workspace
COPY models /workspace/models
COPY model.py /workspace
COPY wrappers.py /workspace

# we make the workspace our working directory
WORKDIR /workspace


# let's see what you've got there...
CMD python solution.py
