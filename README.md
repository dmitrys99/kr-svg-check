# kr-svg-check

Утилита проверки SVG-файла на наличие определенного вложенного xml текста.

Собирается с помощью ECL:

```
$ $ECL/bin/ecl --load build.lsp
```

После этого можно вызывать утилиту

```bash
# Проверяем наличие xml-поддерева, заданного строкой
$ kr-svg-check -i file.svg -t '<g id="foo"/>'

# Проверяем наличие xml-поддерева, заданного в файле 
$ kr-svg-check -i file.svg -t file.test

```

Если поддерево обнаружено, печатает OK и код возврата 0, в противном случае печатает FAIL и код возврата 1.
