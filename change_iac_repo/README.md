1. In `cluster.yaml`, set `integrations.argocd`: false and run `okctl apply cluster -f cluster.yaml`
2. `okctl maintenance state-download`, then use `boltbrowser state.db` to delete the github entry completely, then reupload the edited state with `okctl maintenance state-upload state.db`
3. In `cluster.yaml`, configure github to the new repo
4. In `cluster.yaml`, set integrations.argocd: true  and run okctl apply cluster -f cluster.yaml
5. Change `spec.source.repoURL` to the new repo for all `argocd-application.yaml` files in `infrastructure/applications/*/overlays/<cluster>/`
6. Commit, push and watch success