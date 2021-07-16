<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Laravel</title>

    <link href="/css/app.css" rel="stylesheet">
    @livewireStyles
</head>
<body class="antialiased">
{{ $slot }}
</div>
@livewireScripts
</body>
</html>
