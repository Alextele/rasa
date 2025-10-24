from rasa_sdk import Action, Tracker
from rasa_sdk.executor import CollectingDispatcher
from rasa_sdk.types import DomainDict

class ActionGetWeather(Action):
    def name(self) -> str:
        return "action_get_weather"

    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: DomainDict):
        city = tracker.get_slot("city") or "Москва"
        dispatcher.utter_message(text=f"В городе {city} +15°C и солнечно ☀️")
        return []
