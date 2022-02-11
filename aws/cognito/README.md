# Resend cognito otp

Hvis man får temp passord til cognito, men bruker for lang tid å logge inn, så vil innlogging feile. For å generere en ny epost fra cognito med temp passord:

```
aws cognito-idp list-user-pools --max-results 5
aws cognito-idp admin-create-user --user-pool-id id_fra_kommando_over --username yngvar.kristiansen@origo.oslo.kommune.no --message-action RESEND
```

Pro tip: I venv funker automatisk aws kommandoer mot korrekt cluster