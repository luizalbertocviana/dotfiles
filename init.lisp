;; this makes asdf look fur systems also in the current working directory
(push (uiop:getcwd) asdf:*central-registry*)
