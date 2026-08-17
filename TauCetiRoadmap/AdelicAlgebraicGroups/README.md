# Roadmap: adelic algebraic groups, approximation, and Tamagawa measures

This roadmap develops the reusable local and adelic infrastructure for affine algebraic groups
over number fields. It topologizes local point groups, forms restricted products relative to
compatible compact opens, constructs rational diagonal maps, builds Haar and Tamagawa measures,
proves finite covolume by reduction theory, and establishes strong approximation for connected
simply connected semisimple groups.

The roadmap is deliberately not about orthogonal groups. `OrthogonalSpinGroups` consumes the
generic objects here, verifies the strong-approximation hypotheses for `Spin`, and computes the
orthogonal-specific Tamagawa number. Other reductive groups can use this roadmap without importing
quadratic forms or Clifford algebras.

Suggested home: `TauCeti/NumberTheory/AlgebraicGroup/Adeles/`, with the restricted-product
equivalence API in `TauCeti/Topology/Algebra/RestrictedProduct/`.

---

## Scope and ownership

### Owned here

- canonical topologies and locally compact group structures on `G(K_v)` for an affine algebraic
  group of finite type over a local field;
- compact-open integral models at almost every finite place and independence of the chosen model;
- finite, away-`S`, and full adelic point groups as restricted products;
- functoriality, products, kernels, quotients, and change of compact-open family;
- rational diagonal maps, discreteness in the full adeles, and density statements away from `S`;
- invariant differential forms and local Haar normalizations;
- the global Tamagawa product measure and its independence of auxiliary choices;
- reduction theory, measurable fundamental domains, and finite covolume;
- general strong approximation for connected simply connected semisimple groups;
- general Tamagawa-number functoriality and product formulas.

### Consumed

- `GlobalNumberFields` for places, completions, adeles of fields, finite adeles, normalized absolute
  values, product formula, and compactness of the norm-one idele class group;
- `LocalFieldsRamification` for nonarchimedean local fields, rings of integers, unit filtrations,
  normalized valuations, and unramified models;
- the accepted Reductive Groups roadmap for affine group schemes, functors of points, connected
  reductive and semisimple groups, simply connected covers, roots, parabolics, and almost-simple
  factors;
- Mathlib `RestrictedProduct`, Haar measure, quotient measure, and fundamental-domain machinery.

### Not owned here

- adeles and ideles of the base field (`GlobalNumberFields`);
- a classification of reductive groups or construction of their root data (Reductive Groups);
- orthogonal, special orthogonal, Pin, Spin, spinor norm, or transvections
  (`OrthogonalSpinGroups`);
- a proof that a particular `Spin(Q)` satisfies the noncompact-factor hypothesis
  (`OrthogonalSpinGroups`);
- the calculation `τ(SO_Q) = 2` and its low-dimensional exceptions (`OrthogonalSpinGroups`);
- lattice stabilizers, genera, masses, and theta series (`IntegralLattices`).

---

## Pinned conventions

| Subject | Convention |
|---|---|
| local points | `G(K_v)` is the functor-of-points group with the topology induced by any closed affine embedding; independence of the embedding is proved. |
| integral points | A compact open at an unramified finite place comes from a smooth affine integral model. A user-supplied family is allowed only with compactness, openness, and eventual agreement with such models. |
| finite adeles | `G(𝔸_{K,f})` is a restricted product of `G(K_v)` over finite places, not `G` evaluated on the finite adele ring unless a comparison theorem proves those objects equivalent. |
| away-`S` adeles | `S` is finite and contains all archimedean places. `G(𝔸_K^S)` is the restricted product over places outside `S`. |
| full adeles | Archimedean point groups are an explicit finite product with the finite restricted product. |
| diagonal | `rationalDiagonal` is defined only after proving every rational point is integral at almost every finite place. |
| density | Strong approximation means density of the rational diagonal in the away-`S` adelic group. It does not mean density in the full adeles, where the diagonal is discrete. |
| Haar measure | Local measures come from invariant top differential forms and the normalized additive measures on local fields. Arbitrary independent Haar scalars are not Tamagawa data. |
| Tamagawa number | The quotient covolume is `ℝ≥0∞`-valued first; finiteness and positivity are theorems before conversion to a real number. |

The change-of-family equivalence is canonical and coordinatewise the identity. A bare existence of
an isomorphism is insufficient because every later comparison of measures and diagonal maps needs
its evaluation formula.

---

## Export contract

| Export | Layer | Mathematical contract |
|---|---:|---|
| `LocalPointGroup` | 0 | topological group `G(K_v)` with embedding-independent topology |
| `CompatibleCompactOpens` | 1 | compact-open family with an integral-model proof away from finitely many places |
| `FiniteAdelicPoints` | 2 | restricted product over finite places |
| `AdelicPointsAway` | 2 | restricted product outside a finite `S` containing the archimedean places |
| `AdelicPoints` | 2 | archimedean product times `FiniteAdelicPoints` |
| `rationalDiagonal` | 3 | homomorphism `G(K) → G(𝔸)` or `G(𝔸^S)`, characterized coordinatewise |
| `tamagawaMeasure` | 6 | product of normalized local measures, independent of the form and integral model |
| `strongApproximation` | 5 | density for connected simply connected semisimple `G` when each `K`-almost-simple factor is noncompact at a place of `S` |
| `tamagawaNumber` | 7 | covolume of `G(K)` in `G(𝔸_K)`, with finiteness and functoriality |

`OrthogonalSpinGroups` consumes all nine names. `IntegralLattices` consumes the adelic groups,
diagonal, quotient measure, and finite-covolume API, but obtains spinor norms and `τ(SO)` from the
orthogonal roadmap.

---

## The build, in layers

### Layer 0: local point groups

**0.1 Affine topology.** For an affine finite-type `K_v`-group `G`, choose a closed embedding in
affine space and give `G(K_v)` the subspace topology. Prove that two embeddings induce the same
topology by comparing their coordinate rings. Package the resulting group as `LocalPointGroup`.

**0.2 Group operations.** Prove multiplication and inversion continuous, functorial maps of
algebraic groups continuous, closed immersions give closed embeddings, and open immersions give
open embeddings on points where appropriate.

**0.3 Local compactness.** If `K_v` is a local field, prove `G(K_v)` locally compact, Hausdorff,
and second countable. Establish compatibility with products, kernels, base change, and Weil
restriction.

**0.4 Archimedean comparison.** At real and complex places, compare the affine topology with the
finite-dimensional manifold topology. This is the interface used by invariant differential forms.

### Layer 1: integral models and compact opens

**1.1 Good models.** Spread an affine group of finite type over the ring of integers away from a
finite set. For a smooth affine model `𝒢`, prove `𝒢(𝒪_v)` is a compact open subgroup of `G(K_v)`.

**1.2 Compatible families.** `CompatibleCompactOpens` contains one compact open at each finite
place and evidence that it agrees with integral points of one global model at almost every place.
Give constructors from a global model, a faithful representation and lattice, and finite
modification.

**1.3 Independence.** Two compatible families agree at almost every place. Build the canonical
coordinatewise identity equivalence of their restricted products, prove it is a homeomorphism,
and prove cocycle, symmetry, and naturality laws.

**1.4 Functoriality.** A morphism of group schemes that carries one family into another at almost
every place induces a continuous adelic homomorphism. Prove identities and composition before
specializing to isogenies, embeddings, or quotient maps.

### Layer 2: adelic point groups

**2.1 Restricted-product API.** Complete Mathlib's generic API with compact integral subgroups,
componentwise equivalences, induced homeomorphisms, products, reindexing, and exact evaluation
lemmas.

**2.2 Finite points.** Define `FiniteAdelicPoints G U` and prove local compactness, openness and
compactness of the everywhere-integral subgroup, and independence from finite changes of `U`.

**2.3 Away-`S` points.** For finite `S` containing every archimedean place, define
`AdelicPointsAway G S U`. Compare nested sets `S ⊆ T`, including the product decomposition into
the removed local factors.

**2.4 Full points.** Define `AdelicPoints G U` as the finite product of archimedean point groups
times `FiniteAdelicPoints`. Prove local compactness and the expected product and base-change laws.

**2.5 Evaluation on adelic rings.** When the functor of points commutes with the required limits,
construct comparison maps between the restricted-product definition and `G(𝔸_K)`. State the
hypotheses; do not use evaluation on the adele ring as the definition.

### Layer 3: rational diagonals and quotients

**3.1 Almost-everywhere integrality.** For `g ∈ G(K)`, clear denominators in affine coordinates
and prove `g` belongs to the chosen compact open at all but finitely many finite places.

**3.2 The diagonal.** Define `rationalDiagonal` into finite, away-`S`, and full adelic points.
Prove the coordinate formula, injectivity, functoriality, and compatibility with change of family.

**3.3 Discreteness.** Prove the full adelic diagonal is discrete and closed. Give an identity
neighborhood meeting it only at `1`; do not infer this from the away-`S` density theorem.

**3.4 Adelic quotients.** Construct the quotient topological space/group when the rational image
is normal, and otherwise the homogeneous quotient used for covolumes. Establish Borel and local
compactness properties needed by quotient Haar measure.

### Layer 4: elementary and unipotent approximation

**4.1 Additive approximation.** Prove density of `K` in `𝔸_K^S` and simultaneous approximation
with prescribed integral conditions. Consume `GlobalNumberFields.weakApproximation_denseRange`
for the finite-place input rather than restating field approximation.

**4.2 Vector groups.** Extend the additive result to finite-dimensional vector groups and their
successive extensions.

**4.3 Split unipotent groups.** Use a central series with vector-group quotients to prove strong
approximation. Track the chosen rational lift at each induction step.

**4.4 Root subgroups.** Identify the root subgroups of a split simply connected semisimple group
with additive groups and prove density of the subgroup they generate at isotropic local places.

### Layer 5: general strong approximation

**5.1 The hypothesis.** Let `G` be connected, simply connected, and semisimple. Require that each
`K`-almost-simple factor has noncompact `G(K_v)` for at least one `v ∈ S`. State equivalent
isotropy/rank formulations only when their equivalence is proved.

**5.2 Almost-simple case.** Combine root-subgroup generation at an isotropic place, weak
approximation on big cells, and the open-subgroup argument to prove density in `G(𝔸_K^S)`.

**5.3 Products and restriction of scalars.** Pass from absolutely almost simple factors to
`K`-almost-simple factors and then to semisimple products. Record central isogeny caveats rather
than silently treating an isogeny as surjective on every local point group.

**5.4 `strongApproximation`.** Publish the final theorem with exact dependencies and its closure
form. Prove stability under finite enlargement of `S` and compatibility with field extension.

**5.5 Failure tests.** The theorem fails for anisotropic tori and for a simply connected
almost-simple factor compact at every place in `S`. Include examples so noncompactness is not
lost from later specializations.

### Layer 6: local and global measures

**6.1 Invariant top forms.** Construct the one-dimensional space of left-invariant top
differential forms on a smooth connected group and compare left and right invariance through the
modular character. Prove semisimple and unipotent groups unimodular.

**6.2 Local measure.** A nonzero invariant top form and the normalized absolute value on `K_v`
give a Haar measure on `G(K_v)`. Prove scaling, change of coordinates, functoriality under
isomorphism, and the volume of good integral points at almost every finite place.

**6.3 Convergence factors.** Introduce the canonical local convergence factors needed when the
naive product of volumes does not converge. Prove the normalized local measures give restricted
product measure data.

**6.4 `tamagawaMeasure`.** Form the product measure on `G(𝔸_K)` and prove independence from the
global invariant form, the finite set of bad places, the integral model, and compatible compact
opens. Establish left and right invariance for unimodular groups.

**6.5 Exact sequences.** For exact sequences with the required cohomological and local
surjectivity hypotheses, compare quotient measures and record the defect factors. These hypotheses
are mandatory; an fppf exact sequence need not be exact on local points.

### Layer 7: reduction theory and Tamagawa numbers

**7.1 Reduction data.** For connected reductive groups, construct Siegel sets from minimal
parabolics, split tori, compact factors, and bounded unipotent pieces. Prove finitely many rational
translates cover the adelic quotient.

**7.2 Fundamental domains.** Produce measurable finite-volume fundamental data adequate for
Mathlib's quotient-Haar API. Prove the rational subgroup countable and the quotient measure
well-defined.

**7.3 Finite covolume.** Show the quotient has finite nonzero Tamagawa measure for connected
semisimple groups. Keep the `ℝ≥0∞` statement primary.

**7.4 `tamagawaNumber`.** Define the covolume and prove invariance under group isomorphism, field
isomorphism, direct products, and restriction of scalars. Develop the simply connected and central
isogeny comparison formulas needed by applications.

**7.5 Poisson and volume induction.** Establish the adelic Poisson-summation input and the generic
volume induction used in classical Tamagawa-number calculations. Specific evaluation for `SO_Q`
belongs downstream.

---

## Worked examples and rejection tests

1. `𝔾_a`: finite and away-`S` points recover the additive finite adeles and `𝔸_K^S`; strong
   approximation is ordinary simultaneous approximation.
2. `GL_n`: compact opens from `GL_n(𝒪_v)` and the coordinatewise comparison with invertible
   matrices over the finite adeles.
3. `SL_n`, `n ≥ 2`: strong approximation outside any nonempty `S`, derived from elementary root
   subgroups.
4. A finite change of integral model gives canonically homeomorphic adelic groups and the same
   Tamagawa measure.
5. An anisotropic torus supplies the failure test for the simply-connected semisimple theorem.
6. The full rational diagonal is discrete while the away-`S` diagonal can be dense; no theorem
   conflates the two topologies.

## Ordering

```text
0 → 1 → 2 → 3
        │    ├→ 4 → 5
        └────┴→ 6 → 7
```

Layers 4–5 and 6–7 can proceed in parallel after the adelic point groups and rational diagonal
exist. The final applications consume both strong approximation and measure theory, but neither
generic theorem depends on the other.

## References

- A. Borel, *Linear Algebraic Groups*, for local point topologies and structure theory.
- V. Platonov and A. Rapinchuk, *Algebraic Groups and Number Theory*, Chapters 5 and 7, for strong
  approximation and adelic quotients.
- G. Harder, reduction theory for arithmetic groups and finite covolume.
- A. Weil, *Adeles and Algebraic Groups*, for invariant forms and Tamagawa measures.
- T. Ono, *On the Tamagawa number of algebraic tori*, for isogeny defects and measure formulas.
- J. Oesterlé, *Nombres de Tamagawa et groupes unipotents*, for unipotent volume induction.

The extraction history and audited source status are maintained privately and are not normative.
