# MyNotes

MyNotes ist die Notizen-App der MyDigital-Familie. Sie nutzt denselben Supabase-Login wie MyDigital, MyKalender und MyTasks.

## Aktueller Stand

- Anmeldung und Registrierung über Supabase Auth
- Notizen erstellen, bearbeiten und löschen
- Titel und Inhalt
- Ordner und Ordnerfilter
- Anpinnen wichtiger Notizen
- Suche über Titel, Inhalt und Ordner
- Sortierung nach letzter Änderung, Erstellungsdatum oder Titel
- Responsive Oberfläche für Desktop, Tablet und Smartphone
- PWA-Manifest und einfacher App-Shell-Cache

## Technik

- HTML, CSS und JavaScript ohne Build-Schritt
- Supabase Auth und PostgreSQL
- GitHub Pages

## Daten und Datenschutz

Notizen werden in `public.notes` gespeichert. Jede Notiz besitzt eine `owner`-ID. Row Level Security beschränkt Lesen, Erstellen, Ändern und Löschen auf den angemeldeten Eigentümer. Im Browser wird nur der öffentliche Supabase Publishable Key verwendet; ein Service-Role-Key gehört niemals in den Client.

## PWA-Hinweis

Der Service Worker cached die App-Oberfläche. Das bedeutet nicht, dass Notizen ohne Internet bereits vollständig offline bearbeitet und synchronisiert werden können. Offline-Bearbeitung ist ein späterer Entwicklungsschritt.

## Veröffentlichung

GitHub Actions veröffentlicht den Inhalt des Repositorys über GitHub Pages. Die App-Adresse ist:

https://kotzschfelix-sudo.github.io/MyNotes/
