We build OCI compliant containers using Docker.
The containers also need to be compatible with Apptainer.
We will push the containers to GitHub container registry.
The structure of the container files consists of a directory with the container name, the container file (Dockerfile) and the additional files need to build the container.

```text
<name>
├── Dockerfile
└── <files>
```

Todo

- We should reduce image sizes and remove unnecessary files after builds.
- We should manage external dependencies and move or mirror them under @permedcode GitHub team.
- Containers should load specific dependencies from the @permedcoe GitHub team.
- We should install R packages with a script file rather than with inline commands.
- We will move the contents of this repository to @permedcode team when they are finished.
- We should avoid having to build dependencies more than once (e.g. MaBoSS, R dependencies).
    * Can we use precompiled binaries?
- Can we make one container available from another container to avoid having to place the build the same software in multiple containers and to decouple dependencies.

