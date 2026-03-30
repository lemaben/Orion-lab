# Orion Logistics - Recovery and Hardening Phase

The investigation already identified the root cause:
the service fails because `tracking.key` is missing from its expected location.

Your job now is to:
- restore the service
- automate one check with Bash
- harden the environment before closing the incident

## Important path
`/opt/orion-system`

## Guidance
Do not stop once the service comes back online.

Recovery without hardening is unfinished work.