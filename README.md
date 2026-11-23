# Mathius — prototipo educativo

Prototipo inicial de Mathius, una experiencia de matemáticas para niños de 7 a 12 años.

## Requisitos
- Node.js 20 o superior (en Android puede instalarse con Termux: `pkg install nodejs`)
- npm

## Ejecutar
Desde la carpeta `mathius-app`:

```bash
npm install
npm run dev -- --host 127.0.0.1
```

Abre `http://127.0.0.1:5173` en el navegador del mismo dispositivo.

## Supabase
1. Crea un proyecto en Supabase.
2. Copia `.env.example` como `.env.local`.
3. Completa `VITE_SUPABASE_URL` y `VITE_SUPABASE_ANON_KEY`.
4. Ejecuta `supabase/schema.sql` en el SQL Editor de Supabase.

El prototipo funciona sin Supabase usando datos locales de demostración. No recopila datos personales ni implementa todavía autenticación parental, verificación de consentimiento ni límites de uso protegidos en servidor. Esas funciones deben desarrollarse y probarse antes de usarlo con menores en producción.
