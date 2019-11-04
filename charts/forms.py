from django import forms

from .models import Assets


class DateInput(forms.DateInput):
    input_type = 'date'

class ReportDateForm(forms.ModelForm):

    class Meta:
        model = Assets
    start_date = forms.DateField()
    end_date = forms