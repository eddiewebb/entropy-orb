# Entropy Orb a.k.a. `secret_scan`

Scans latest commit for potential secrets.

## Example

Eddie is trying to be helpful, and adds a "test" key to the project readme.
![README.md file continaing a secret](/assets/secret_readme.png)

CircleCI detects the secret, warns that the README contains high entropy (but does not log the value)
![Job output warning about high entropy](/assets/failed_job.png)


## More Info
Orbs are self-documenting! See https://circleci.com/orbs/registry/orb/eddiewebb/secret_scan for use and info