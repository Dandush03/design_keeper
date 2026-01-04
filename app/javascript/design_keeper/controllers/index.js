import { application } from "design_keeper/controllers/application"
import { StimulusLazyLoader } from "design_keeper/utils/stimulus_lazy_loading"

new StimulusLazyLoader("design_keeper/controllers", application).startObserving()
