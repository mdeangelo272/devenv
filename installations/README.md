# Installation Notes

## Python Package Dependencies

jupyterlab
```
Installing collected packages: webencodings, wcwidth, pure-eval, ptyprocess, pickleshare, mistune, json5, fastjsonschema, executing, backcall, appnope, websocket-client, webcolors, urllib3, uri-template, typing-extensions, traitlets, tornado, tinycss2, soupsieve, sniffio, six, send2trash, rfc3986-validator, pyzmq, pyyaml, python-json-logger, pyrsistent, pygments, pycparser, psutil, prompt-toolkit, prometheus-client, platformdirs, pexpect, parso, pandocfilters, packaging, overrides, nest-asyncio, MarkupSafe, jupyterlab-pygments, jsonpointer, idna, fqdn, defusedxml, decorator, debugpy, charset-normalizer, certifi, babel, attrs, terminado, rfc3339-validator, requests, python-dateutil, matplotlib-inline, jupyter-core, jsonschema, jinja2, jedi, comm, cffi, bleach, beautifulsoup4, async-lru, asttokens, anyio, stack-data, nbformat, jupyter-server-terminals, jupyter-client, arrow, argon2-cffi-bindings, nbclient, isoduration, ipython, argon2-cffi, nbconvert, ipykernel, jupyter-events, jupyter-server, notebook-shim, jupyterlab-server, jupyter-lsp, jupyterlab
```

torch (additional)
```
mpmath, sympy, networkx, filelock, torch
```

tensorflow (additional)
```
libclang, flatbuffers, wrapt, wheel, werkzeug, urllib3, termcolor, tensorflow-io-gcs-filesystem, tensorflow-estimator, tensorboard-data-server, pyasn1, protobuf, oauthlib, numpy, markdown, keras, grpcio, google-pasta, gast, cachetools, a  py, scipy, rsa, pyasn1-modules, opt-einsum, ml-dtypes, h5py, astunparse, requests-oauthlib, jax, google-auth, google-auth-oauthlib, tensorboard, tensorflow
```

```
Successfully installed absl-py-1.4.0 astunparse-1.6.3 cachetools-5.3.1 flatbuffers-23.5.26 gast-0.4.0 google-auth-2.19.1 google-auth-oauthlib-1.0.0 google-pasta-0.2.0 grpcio-1.54.2 h5py-3.8.0 jax-0.4.11 keras-2.12.0 libclang-16.0.0 markdown-3.4.3 ml-dtypes-0.1.0 numpy  3.5 oauthlib-3.2.2 opt-einsum-3.3.0 protobuf-4.23.2 pyasn1-0.5.0 pyasn1-modules-0.3.0 requests-oauthlib-1.3.1 rsa-4.9 scipy-1.10.1 tensorboard-2.12.3 tensorboard-data-server-0.7.0 tensorflow-2.12.0 tensorflow-estimator-2.12.0 tensorflow-io-gcs-filesystem-0.32.0 termco 2.3.0 urllib3-1.26.16 werkzeug-2.3.4 wheel-0.40.0 wrapt-1.14.1
```

# Known Issues

It appears that the latest versions of scipy and tensor flow are incompatible

```
The conflict is caused by:
    The user requested numpy>=1.24.3
    scipy 1.10.1 depends on      numpy<1.27.0 and >=1.19.5
    pandas 2.0.2 depends on      numpy            >=1.21.0; python_version >= "3.10"
    pandas 2.0.2 depends on      numpy            >=1.23.2; python_version >= "3.11"
    matplotlib 3.7.1 depends on  numpy            >=1.20
    tensorflow 2.12.0 depends on numpy<1.24 and   >=1.22

To fix this you could try to:
1. loosen the range of package versions you've specified
2. remove package versions to allow pip attempt to solve the dependency conflict

```
