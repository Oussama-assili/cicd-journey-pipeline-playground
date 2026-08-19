# CI/CD Learning Project

A deliberately tiny FastAPI app used as a vehicle to learn CI/CD from scratch,
stage by stage, up to production-grade GitOps.

## Stage 1 (current): CI basics
GitHub Actions runs lint + tests on every push and PR to `main`.

## Run locally
```bash
pip install -r requirements.txt
python -m pytest -v          # run tests
uvicorn app.main:app --reload  # run the API at http://127.0.0.1:8000
```

## Roadmap
- [x] Stage 1: CI (lint + test on push/PR)
- [ ] Stage 2: CD (build container + deploy)
- [ ] Stage 3: Branch protection, environments, gates, caching
- [ ] Stage 4: Containerize + push to registry
- [ ] Stage 5: Terraform in the pipeline (plan on PR, apply on merge)
- [ ] Stage 6: GitOps with Argo CD
