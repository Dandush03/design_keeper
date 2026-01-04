export class StimulusLazyLoader {
  #under
  #application
  #element
  #controllerAttribute = "data-controller"
  #observer

  constructor(under, application, element = document) {
    this.#under = under
    this.#application = application
    this.#element = element
  }

  startObserving() {
    this.#lazyLoadExistingControllers()
    this.#lazyLoadNewControllers()
  }

  destroy() {
    this.#observer?.disconnect()
  }

  #lazyLoadExistingControllers() {
    this.#queryControllerNamesWithin(this.#element).forEach(controllerName =>
      this.#loadController(controllerName)
    )
  }

  #lazyLoadNewControllers() {
    this.#observer = new MutationObserver((mutationsList) => {
      for (const { attributeName, target, type } of mutationsList) {
        switch (type) {
          case "attributes": {
            if (attributeName == this.#controllerAttribute && target.getAttribute(this.#controllerAttribute)) {
              this.#extractControllerNamesFrom(target).forEach(controllerName =>
                this.#loadController(controllerName)
              )
            }
            break
          }

          case "childList": {
            this.#lazyLoadExistingControllers(target)
            break
          }
        }
      }
    })

    this.#observer.observe(this.#element, {
      attributeFilter: [this.#controllerAttribute],
      subtree: true,
      childList: true
    })
  }

  #queryControllerNamesWithin(element) {
    return Array.from(element.querySelectorAll(`[${this.#controllerAttribute}]`))
      .map(el => this.#extractControllerNamesFrom(el))
      .flat()
  }

  #extractControllerNamesFrom(element) {
    return element.getAttribute(this.#controllerAttribute)
      .split(/\s+/)
      .filter(content => content.length)
  }

  #loadController(name) {
    if (!name.startsWith("design-keeper--")) return;

    if (this.#canRegisterController(name)) {
      import(this.#controllerFilename(name))
        .then(module => this.#registerController(name, module))
        .catch(error => console.error(`Failed to autoload controller: ${name}`, error))
    }
  }

  #controllerFilename(name) {
    return `${this.#under}/${name.replace(/design-keeper--/g, "").replace(/--/g, "/").replace(/-/g, "_")}_controller`
  }

  #registerController(name, module) {
    if (this.#canRegisterController(name)) {
      this.#application.register(name, module.default)
    }
  }

  #canRegisterController(name){
    return !this.#application.router.modulesByIdentifier.has(name)
  }
}
