FROM manimcommunity/manim:stable

USER root
RUN tlmgr update --self && \
    tlmgr install \
        luatex85 luatexja ipaex

USER ${NB_USER}
