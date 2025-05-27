# Module 2: Using Red Hat Dev Spaces

## Git Repositories

- **Python:**  
  [https://github.com/na-launch/developer-experience-workshop/tree/module2-python](https://github.com/na-launch/developer-experience-workshop/tree/module2-python)

- **Dotnet:**  
  [https://github.com/na-launch/developer-experience-workshop/tree/module2-dotnet](https://github.com/na-launch/developer-experience-workshop/tree/module2-dotnet)

---

## Objectives

Inside your workspace is a simple Python application built using Flask. The application returns a “hello world” message based on the language selected:

- The country is specified using a 2-letter country code.  
  Example: `countryCode=IT` returns `ciao mondo` (Italy).
- Mappings are defined in the `translate.json` file.
- A timestamp is included after the message.

---

## Guided Exercise

The application has some issues to fix:

1. **Install dependencies**:

   ```sh
   pip install -r requirements.txt
   ```

2. **Set required environment variables**:

   ```sh
   FLASK_APP=app.py
   FLASK_ENV=development
   PYTHONPATH=.
   ```

3. **Format the timestamp** to Eastern Standard Time (New York time).

4. **Change the timestamp format** to `{HH:MM MM/DD/YYYY}`.

5. **Write a test case** for timezone and date format correctness.

6. **Create a new route** in `/routes/main.py` that responds to `/api/query`:
   - Accepts `GET` requests.
   - Uses a query string argument `countryCode` (e.g. `/api/query?countryCode=en`).
   - Returns the correct greeting based on the country code.

---

## Final Compilation

1. **Run the application** using Flask:

   ```sh
   flask run --host=0.0.0.0 --port=8080
   ```

2. **Run tests**:

   ```sh
   ./pytest
   ```

---

## Bonus Tasks

- Add an `/api/magic8` endpoint that returns a random country code and greeting.
- Write tests for `/api/query` and `/api/magic8`.
- Create a `POST` variant of `/api/query` and test it with `curl`.
- Add a stylesheet to change the background color to blue.
- Wrap the greeting in an HTML `<blockquote>` and style it.
  - Use `render_template`.
  - Place your CSS in `/static/styles.css`.
  - Place your HTML in `/templates/`.

---

## Easter Eggs

- There is a hidden feature ("Golden Egg") in the code.
- It requires a two-step process to find and solve.
- Review the code thoroughly.

---

## Takeaways

- Explored Red Hat Dev Spaces
- Deployed a Python app in a Dev Spaces container
- Used environment variables
- Built and tested an OpenShift service and route
