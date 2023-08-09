cwlVersion: v1.0
steps:
  read-potential-cases-omop:
    run: read-potential-cases-omop.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  myelodysplastic-syndromes-myelodysplasia---primary:
    run: myelodysplastic-syndromes-myelodysplasia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-omop/output
  myelodysplastic-syndromes-blast---primary:
    run: myelodysplastic-syndromes-blast---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: myelodysplastic-syndromes-myelodysplasia---primary/output
  myelodysplastic-syndromes-transformation---primary:
    run: myelodysplastic-syndromes-transformation---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: myelodysplastic-syndromes-blast---primary/output
  myelodysplastic-syndromes-minus---primary:
    run: myelodysplastic-syndromes-minus---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: myelodysplastic-syndromes-transformation---primary/output
  myelodysplastic-syndromes-unspecified---primary:
    run: myelodysplastic-syndromes-unspecified---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: myelodysplastic-syndromes-minus---primary/output
  myelodysplastic-syndromes-[m]myelodysplastic---primary:
    run: myelodysplastic-syndromes-[m]myelodysplastic---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: myelodysplastic-syndromes-unspecified---primary/output
  myelodysplastic-syndromes-refractory---primary:
    run: myelodysplastic-syndromes-refractory---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: myelodysplastic-syndromes-[m]myelodysplastic---primary/output
  myelodysplastic-syndromes---primary:
    run: myelodysplastic-syndromes---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: myelodysplastic-syndromes-refractory---primary/output
  myelodysplastic-syndromes---secondary:
    run: myelodysplastic-syndromes---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: myelodysplastic-syndromes---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: myelodysplastic-syndromes---secondary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
