# Roadmap: rigid analytic geometry

**Summary.** Develop classical affinoid algebra and its comparison with rigid
and adic geometry over a complete nontrivially valued nonarchimedean field. The
algebraic milestones are Noether normalisation, the maximum modulus principle,
integral reduction and the Banach function algebra theorem. The geometric
milestones construct the classical G-site, rigid spaces and analytification,
and compare them with the shared adic-space programme. Coherent cohomology and
proper GAGA are transported from their named suppliers. Applications include
proper cohomology, analytic families and the geometry underlying
eigenvarieties.

This README is the roadmap; every target and Check is required.
[Suggested.lean](Suggested.lean) is the acceptance test: it states the
headline theorems against the pinned Mathlib and Tau Ceti, each admitted, and
its module docstring names the headlines that no pinned carrier can state.
Production modules import library mathematics, not a roadmap's acceptance
file.

## Scope and ownership

This roadmap owns classical affinoid algebra, subdomains, the classical
G-site and rigid category, rigid analytification and the rigid–adic comparison.
Results labelled **supplier contracts** are implemented once in the named
roadmap and transported through explicit maps. Dependencies are between theorem
groups: the affinoid algebra and classical category do not depend on the later
cohomology theorems which consume them.

Below, Part II, Part III and Part IV name AdicSpacesPartII, AdicSpacesPartIII
and AdicSpacesPartIV. The interfaces consumed by Part II are
`TauCeti.IsAffinoidAlgebra`, the affinoid norm and reduction theorems, the
affinoid space `Sp A` of Layers 3–4, affinoid subdomains, classical Tate
acyclicity, the rigid category of §6.2, rigid analytification and the
rigid–adic functor `r` of §8.3. Part II's R0.9 transports the algebraic
predicate to its topological presentation; its R1 names refer to these
objects, not independent definitions. Part III supplies coherent and
proper-cohomology theorems after the classical category and comparison
functor. Its algebraic targets *affinoid-completed-field-extension* and
*almost-noetherian-integral-affinoid-modules* use only the Tate, Banach and
affinoid algebra floor, not their later geometric applications.

Kiehl's almost noetherianity of presentation rings (for a finite module `M`
over `A₀=π(Tₙ°)`, a submodule `N` and `0<ε<1`, one finitely generated
`N'⊆N` contains `cN` for every `c∈K` with `|c|≤ε`) and its noetherian
corollary for discretely valued `K` are stated by AdicSpacesPartIII R3.6
(*almost-noetherian-integral-affinoid-modules*), which consumes §2.3's
presentation-ring integrality; no target of this roadmap uses them, and they
are not restated here.

Part III's affinoid complete-continuity condition agrees with
CompactOperators' `IsCompletelyContinuous`: over a noetherian affinoid,
containment in a finite submodule is equivalent to finitely generated image.
Use PadicFunctionalAnalysis' gauges, model spaces and countable-type APIs under
those comparisons. Part III retains the strict lattice condition, perturbation
corollaries and Kiehl applications; they do not create a second operator
library.

Formal models, Raynaud's theorem, admissible blow-ups, dagger geometry,
eigenvariety gluing, automorphic forms and curve uniformisation are outside
this roadmap. Dagger algebras, weak completion, étale and pro-étale geometry
and their site comparisons belong to AdicSpacesPartIV and AdicEtaleGeometry;
the comparison of the numerical slope predicate of §7.2 with geometric slope
criteria belongs to LocallyAnalyticDistributions §4.16. The geometric
contracts below fix the required scope rather than inviting an independent
implementation of those subjects. Part IV and LocallyAnalyticDistributions
consume this roadmap and supply nothing to it; their interfaces are listed
under **Downstream consumers**.

## Exact supplier contracts

| Supplier | Interface used here | Boundary |
| --- | --- | --- |
| Tau Ceti at the pin: `TauCeti/RingTheory/Affinoid/`, `TauCeti/AlgebraicGeometry/Rigid/Affinoid/`, `TauCeti/Topology/GTopology/`, `TauCeti/Analysis/Normed/Field/WeaklyStable.lean`, `TauCeti/AlgebraicGeometry/AdicSpace/Spa/MaximalIdealPoint.lean`, `TauCeti/RingTheory/Japanese.lean`, `TauCeti/Analysis/Normed/Operator/SlopeDecomposition.lean` | The affinoid predicate `TauCeti.IsAffinoidAlgebra`, the supremum seminorm `TauCeti.supSeminorm` and the Layer 0–4 theorems cited by their pinned names below; weak stability of complete and perfect fields; affinoid subdomains, their presheaf of coordinate algebras and the weak affinoid site; the Japanese-ring predicate; the classical points of `Spa(A,A°)`; G-topologies and their sites; the numerical slope predicates, decompositions and projector of §7.2 | Consumed by name where the text cites them; the remaining targets of Layers 0–4, the Banach function algebra theorem, finiteness of normalisation for affinoid domains, the sheaf condition of Layer 5 and everything after it are this roadmap's |
| [RestrictedPowerSeries](../RestrictedPowerSeries/README.md) §§2.4, 4–6 | Native Tate algebras, Gauss norms, reduction, evaluation, Weierstrass theory, distinguished charts, Rückert theory, closed ideals and finite Tate modules; positive-polyradius algebra | Those constructions and proofs are not repeated here. Weak stability of the Gauss fraction field, general affinoids and the converse strict-radius criterion are below |
| [PadicFunctionalAnalysis](../PadicFunctionalAnalysis/README.md) Layers 0–2 | Gauges, bounded maps, open mapping, finite-module topology, `c₀` presentations, countable type and bounded lifting | General Banach-module analysis stays there; §7.1 specifies the additional prerequisite contracts precisely |
| [CompactOperators](../CompactOperators/README.md) Layers 0–3 | Finite-image approximation, complete continuity, Fredholm series and Riesz projectors | No new complete-continuity or determinant definition here |
| [SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md) §§0.20–0.21 | Japanese/Nagata ring vocabulary, permanence criteria, excellence and algebraic completion criteria | Apply the shared algebraic criteria; the Japanese predicate is the pinned `TauCeti.Ring.IsJapanese` |
| [AdicSpaces](../../Completed/AdicSpaces/README.md) Layers 1–5 and [AdicSpacesPartII](../AdicSpacesPartII/README.md) R0.3–R0.5 and R1.7 | Huber pairs, topological localisation, completed tensors, spectral theory, adic morphisms and adic analytification | Part II owns the adic constructions and the additional morphism comparisons; the classical theory it takes from here is listed under Downstream consumers |
| [AdicSpacesPartIII](../AdicSpacesPartIII/README.md) R3.1–R3.7 | Coherence, Kiehl's Banach lemmas, almost noetherianity, complete field extension, quasi-Stein and proper cohomology, proper GAGA | §§1.3 and 7 record classical specialisations; R3.6's algebraic inputs precede its geometric applications |

### From Mathlib

Mathlib supplies restricted-series predicates and Gauss norms
(`MvPowerSeries.IsRestricted`, `MvPowerSeries.gaussNorm`), polynomial and
fraction-ring algebra (`FractionRing`, `integralClosure`, `IsIntegral`),
noetherian and Jacobson rings (`IsNoetherianRing`, `IsJacobsonRing`), maximal
spectra (`MaximalSpectrum`), heights and Krull dimension (`Ideal.height`,
`ringKrullDim`), the spectral norm on finite extensions (`spectralNorm`),
normed quotients, finite-dimensional topology, topological nilpotence
(`IsTopologicallyNilpotent`), flat modules and localisations (`Module.Flat`,
`IsLocalization`), tensor products, the Artin–Rees lemma
(`Ideal.exists_pow_inf_eq_pow_smul`) and adic completion (`AdicCompletion`),
schemes with their finite-type morphisms (`AlgebraicGeometry.Scheme`,
`LocallyOfFiniteType`), and categorical sites and sheaves
(`CategoryTheory.GrothendieckTopology`, `CategoryTheory.Presheaf.IsSheaf`,
sheafification). The series, functional-analysis and adic suppliers extend
this floor. The geometric objects assigned here are construction targets on
native sheaf and site carriers, not opaque constants or structures with the
desired theorems as fields.

### From Tau Ceti

The homes are `TauCeti/RingTheory/Affinoid/` for the algebra and
`TauCeti/AlgebraicGeometry/Rigid/` for rigid spaces and comparisons, with
general G-site lemmas under `TauCeti/Topology/GTopology/`, sharing the adic
geometry's carriers. Production modules import proved mathematics, never a
roadmap's `Suggested.lean`. What these trees already hold at the pin:

`TauCeti.RingTheory.MvPowerSeries.TateAlgebra.Basic`: the native restricted
subring already has its coefficient algebra, Gauss norm and completeness. Use
`MvPowerSeries.norm_eq_gaussNorm`, `NormMulClass` and the native coefficient
embedding rather than defining another normed Tate algebra. Its Gauss unit
ball is `Subring.unitClosedBall`.

`TauCeti/Analysis/Normed/Field/WeaklyStable.lean`: the bounded-functional form
of weak stability `TauCeti.IsWeaklyStable` (every linear functional on a
finite extension `L` of `K` is bounded by a multiple of the spectral norm of
`L`), with the perfect case `TauCeti.isWeaklyStable_of_perfectField` and the
complete case `TauCeti.isWeaklyStable_of_completeSpace`.

`TauCeti/RingTheory/Japanese.lean`: the Japanese-ring predicate
`TauCeti.Ring.IsJapanese` for a domain (finite integral closure in every finite
extension of the fraction field, inseparable extensions included) with its
permanence under finite extensions (`TauCeti.Ring.IsJapanese.of_finite`) and
its field case.

`TauCeti/RingTheory/Affinoid/` supplies the affinoid predicate
`TauCeti.IsAffinoidAlgebra` (a surjection from a Tate algebra, choosing no
norm), the evaluation norm `TauCeti.pointNorm` (Mathlib's `spectralNorm` on the
actual maximal-ideal quotient) and the supremum seminorm `TauCeti.supSeminorm`,
together with the residue norm of a presentation, quotients and finite
extensions of affinoids, restricted series over an affinoid with their
universal property, quotient topologies, independence of presentation and
equivalence of complete algebra norms, noetherianity, the Jacobson property,
Noether normalisation in the Krull dimension, finite maximal residue fields,
finite quotients by ideals with maximal radical, contraction of maximal
ideals, the height formula for affinoid domains and its componentwise form,
universal catenarity, automatic continuity and contractive renorming, the
closed-embedding theorem for finite injective maps, the strict-polyradius
criterion, boundedness and maximum modulus of the supremum seminorm, its
power multiplicativity, nilradical kernel, minimal-prime description and
spectral-radius formula, its agreement with a complete multiplicative algebra
norm, the uniform value-group exponent, the power-bounded and topologically
nilpotent characterisations, the reduced-quotient criterion for a ring of
definition, presentation-ring integrality, integral equations attaining the
spectral value, canonical reduction maps, rational and Laurent fractions,
affinoid pushouts with their completed-tensor identification, affinoid
subdomains (`TauCeti.IsAffinoidSubdomainMap`) with flatness, inverse images,
intersections, kernels and standard rational covers, the identification of
complete ultrametric normed affinoid algebras with the algebras topologically
of finite type over `K`, and the classical-point test for numerical slopes.
Where a target of Layers 0–4 below is one of these theorems, the text cites it
by its pinned name; the rest of those layers are targets.

`TauCeti/AlgebraicGeometry/Rigid/Affinoid/` supplies the poset
`TauCeti.AffinoidSubdomain` of affinoid subdomains of `Sp A=MaximalSpectrum A`,
its presheaf of coordinate algebras `TauCeti.AffinoidSubdomain.presheaf` and
the weak affinoid G-topology `TauCeti.AffinoidSubdomain.weakGTopology`
generated by finite affinoid covers, with no sheaf condition.
`TauCeti/Topology/GTopology/` supplies G-topologies with their sites
(`TauCeti.GTopology.grothendieckTopology`), the identification of their
sheaves with admissible-cover gluing (`TauCeti.GTopology.isSheaf_iff`),
continuous maps, induced G-topologies, pasting, finite-cover G-topologies,
site points with neighbourhood stalks, stalk maps and the slightly finer
relation.

`TauCeti/AlgebraicGeometry/AdicSpace/Spa/MaximalIdealPoint.lean` supplies the
classical points of `Spa(A,A°)`: for `A` topologically of finite type over
`K`, the map `TauCeti.ValuationSpectrum.maximalSpectrumToSpa` from
`MaximalSpectrum A`, its injectivity
`TauCeti.ValuationSpectrum.maximalSpectrumToSpa_injective` and the description
of its image as the points with maximal support
(`TauCeti.ValuationSpectrum.range_maximalSpectrumToSpa`). For boundedness,
Huber rings and `Spa`, use the native Tau Ceti interfaces
(`TauCeti.Huber.IsPowerBounded`, `TauCeti.Huber.powerBoundedSubring` and the
Huber-pair carriers of AdicSpaces). Valuations are considered up to
equivalence; a chosen representative is not a replacement for `Spv`.

`TauCeti/Analysis/Normed/Operator/SlopeDecomposition.lean` and
`TauCeti/Analysis/Normed/Unbundled/Slope.lean` supply `Polynomial.IsSlopeLE`,
`ContinuousLinearMap.IsSlopeDecomposition` and its projector. Missing results
are required in Tau Ceti in these interfaces.

### From TauCetiRoadmap.RestrictedPowerSeries

§§2.4 and 5: the complete multiplicative Gauss norm, polynomial density,
coefficient reduction, bounded evaluation and substitution, maximum modulus,
the Zariski-dense maximum locus, Weierstrass division and preparation,
distinguished charts, noetherianity, factoriality, integral closedness, the
Jacobson property, `dim Tₙ=n`, finite maximal residue fields, closed ideals
and strictness for finite Tate modules; Layer 4: restricted series over Banach
rings; §5.4: weighted Tate algebras, their multiplicative norm and the finite
monomial extension; §6.2: normed and completed comparisons.

### From TauCetiRoadmap.PadicFunctionalAnalysis

§1.2: open mapping and closed graph; Layer 1: the finite-module topology;
§2.1: the model spaces `c₀(I,A)` with bounded families as operators; §2.2:
bases and bounded lifting; §2.4: complete countable-type Banach spaces and
strict splitting.

### From TauCetiRoadmap.CompactOperators

§0.1: finite-image approximation and `IsCompletelyContinuous`; Layer 3: Riesz
projectors at good zeros of a Fredholm determinant (§3.1) and the
Riesz–Coleman decomposition (§3.4), used only for the comparison in §7.2.

### From TauCetiRoadmap.SchemeAndStackFoundations

§0.20: Japanese and Nagata rings and their permanence criteria; §0.21:
excellent rings, G-rings, J-2 rings and the completion criteria for
reducedness and normality.

### From TauCetiRoadmap.AdicSpaces

Layers 1–2: `Spv`, `Spa`, rational subsets and pro-constructible subspaces;
§3.1: rational localisation of a Huber pair; Layer 4: Tate acyclicity for
rational covers of `Spa(A,A°)`; Layer 5: gluing and morphisms locally of
finite type.

### Contracts with AdicSpacesPartII and AdicSpacesPartIII

Part II R0.3 (*completed-tensor-banach-module*), R0.4 (spectral seminorm and
smoothing) and R0.5 supply the completed tensor product and spectral
comparisons with which §§1.3–1.4 and §2.2 compare the classical
constructions; R1.7 is the classical-point contract of §8.2. Part III R3.2–R3.4
(coherence, quasi-Stein spaces), R3.6 (*affinoid-completed-field-extension*,
strict complete continuity, Schwartz's theorem, relatively compact
restriction, Kiehl's proper mapping theorem) and R3.7 (proper GAGA) are
implemented there and transported through the classical carriers of this
roadmap as §§1.3 and 7–8 specify. Both roadmaps consume the classical algebra,
category and comparison functor built here (see **Downstream consumers**); the
dependency is between theorem groups, never from a classical construction to
the cohomology theorem that uses it.

## Conventions

1. Use `[NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]`.
   Characteristic zero, discrete valuation and spherical completeness are
   additional hypotheses only where stated. Put
   `√|K×| = {r>0 : ∃ n≥1, ∃ c∈K×, r^n=|c|}`.
2. `Tₙ=K⟨X₁,…,Xₙ⟩` is the shared native restricted-series algebra at unit
   polyradius. Use coefficient-preserving equivalences for alternative
   presentations. Distinguished-variable conventions must agree with the
   supplier's iteration map, including the choice of first or last variable.
3. `TauCeti.IsAffinoidAlgebra K A` is the pinned proposition: there is a
   surjective algebra map `Tₙ→A`. It does not select a norm or a topology. Quotient Gauss norms
   give complete algebra norms; §1 proves independence of their topology.
   Equivalent norms need not be equal or isometric.
4. Classical points are `MaximalSpectrum A`. The value `|f(x)|` uses the
   unique extension of `|·|` to the finite residue field `A/x`; no embedding
   into a chosen algebraic closure enters its definition. Define
   `|f|sup = sup_x |f(x)|`, with value zero for the zero algebra. Prove
   boundedness before using a real supremum.
5. Use `TauCeti.Huber.powerBoundedSubring` for `A°`, its native
   `topologicallyNilpotentIdeal` for `A°°`, and `Ã=A°/A°°`. Keep a presentation
   ring `A₀=π(Tₙ°)` separate from `A°`.
   Nilpotents remain in all algebra and sheaf carriers. Reduced affinoids
   are uniform; nonreduced affinoids use strong noetherianness for sheafiness.
6. Rational fractions are `A⟨f/g⟩=A⟨T⟩/(gTᵢ−fᵢ)` with `(g,f₁,…,fₘ)=A`.
   Rational domains require `|g(x)|≠0` and `|fᵢ(x)|≤|g(x)|`.
   All localisation and tensor comparisons commute with structure maps.
7. Use native `Ideal`, `Submodule`, `Module.Finite`, `Module.Projective`,
   tensor products, continuous linear maps, schemes, sites, sheaves and
   sheaf cohomology. An arbitrary module has an algebraic Čech complex;
   Banach topologies and strictness are asserted for finite modules.
8. Classical points and adic points are different carriers. The comparison
   preserves rational traces and ringed sites, not all underlying points.
   In particular, a higher-rank condition `v(T)<1` is not by itself a
   description of the adic image of the rigid open unit disc.

## How to read the build

Layer 0 imports the Tate package and proves weak stability of the Gauss
fraction field and finiteness of normalisation. Layer 1 consumes the pinned
affinoid algebra (presentations, topology, normalisation, dimension) and adds
tensor products, fraction algebras and the strict-radius identification.
Layer 2 consumes the pinned supremum seminorm and proves the Banach function
algebra theorem, the reduction functor and the presentation-ring theory.
Layers 3–4 construct classical affinoid spaces and subdomains on the pinned
carriers; Layer 5 proves Tate acyclicity, the sheaf condition of the weak
affinoid site; Layer 6 builds general G-topologies, rigid spaces and the
classical properness predicates; Layer 7 records the Banach contracts for
Kiehl's theorem, the numerical slope interface, coherence, proper cohomology
and formal functions; Layer 8 constructs analytification and the rigid–adic
comparison. Each layer ends with its examples and its dependencies; a
`*Needs:*` line lists what each target's statement and route use.

## Layer 0: shared Tate inputs and weak stability

### 0.1 The imported Tate package

Use RestrictedPowerSeries §§2.4 and 5 for the complete multiplicative Gauss
norm, polynomial density, coefficient reduction `T̃ₙ≃K̃[X₁,…,Xₙ]`, bounded
evaluation and substitution, maximum modulus at a finite-residue-field point,
and the Zariski-dense maximum locus of a nonzero Tate series. Its Weierstrass
polynomials are monic of Gauss norm one; nonleading coefficients may have
norm one. Consume division, preparation, simultaneous distinguished charts
and the finite free quotient on `1,X,…,X^(s−1)` for degree `s`.

The same supplier owns noetherianity, factoriality, integral closedness,
the Jacobson property, `dim Tₙ=n`, finite maximal residue fields, polynomial
generation of maximal ideals, nearest-point results for Tate ideals and
strictness for finite Tate modules. The last property is specific input;
nearest points are not assumed to exist in every Banach subspace.
*Needs:* RestrictedPowerSeries §§2.4 and 5 (Gauss norm, polynomial density,
reduction, evaluation, maximum modulus, Weierstrass theory, noetherianity,
dimension, closed ideals and strictness for finite Tate modules); Mathlib
`MvPowerSeries.IsRestricted` and `MvPowerSeries.gaussNorm`; Tau Ceti
`MvPowerSeries.norm_eq_gaussNorm`.

**Checks.**

- Transport constants, variables, products and coefficients through the
  carrier comparison.
- Over `ℚ_p`, `p+T²` has maximum one at `T=1`, whereas its value at zero is
  `|p|`; a definition reading the value at the origin gets the Gauss norm
  wrong.
- The reduction of `p+T+pT²` is `T`; a reduction that keeps the coefficient
  `p` is wrong.
- For `n=0` recover `K`, including its norm and residue field.

### 0.2 Weak stability and finite normalisation

The bounded-functional form of weak stability is the pinned
`TauCeti.IsWeaklyStable`: every `K`-linear functional on a finite extension
`L/K` is bounded by a multiple of the spectral norm of `L`. Its complete case
is the pinned `TauCeti.isWeaklyStable_of_completeSpace` and its perfect case
the pinned `TauCeti.isWeaklyStable_of_perfectField`, which applies to
incomplete fields. Develop the remaining valued-field API of [BGR]
§§3.5.1–3.5.3 on this predicate: the weakly Cartesian finite-extension
criterion and the comparison of finite-extension norms. Coordinate the
complete countable-type Banach-space results with PadicFunctionalAnalysis
§2.4. The bounded-functional separation and weakly Cartesian results for the
possibly incomplete Gauss fraction field are targets here, following [BGR]
2.3.2/7 and §§3.5.1–3.5.3; they are not obtained by dropping the completeness
hypothesis of a Banach-space theorem.

Equip `Frac(Tₙ)` with the extended Gauss norm and prove it weakly stable in
every characteristic, using [BGR] 5.3.1/1 and 3.5.3/1–2. In characteristic
zero this is the pinned perfect case; in characteristic `p` the field is
imperfect and incomplete, and the statement is a target. Apply the
Japanese-ring criteria of SchemeAndStackFoundations §0.20 to prove that the
integral closure of `Tₙ` in every finite extension of its fraction field is
finite, that is, `Tₙ` is `TauCeti.Ring.IsJapanese`. The inseparable step uses
[BGR] 4.1/3–4 and 4.4/2 and is part of the theorem. Neither separability nor
a discrete valuation may replace that step. §1.2 extends this to every
affinoid domain.
*Needs:* §0.1 (noetherianity, factoriality and integral closedness of `Tₙ`,
from RestrictedPowerSeries §5); Tau Ceti `TauCeti.IsWeaklyStable`,
`TauCeti.isWeaklyStable_of_perfectField`,
`TauCeti.isWeaklyStable_of_completeSpace` and `TauCeti.Ring.IsJapanese`;
PadicFunctionalAnalysis §2.4 (complete countable-type Banach spaces);
SchemeAndStackFoundations §0.20 (Japanese rings and their permanence
criteria); Mathlib `spectralNorm`, `integralClosure`, `FractionRing` and
`Module.Finite`.

**Checks.**

- The zero-variable case agrees with finite extensions of `K`, where weak
  stability is the pinned complete case.
- Test both a separable extension and a characteristic-`p` purely inseparable
  extension of `Frac(T₁)`: a separable-only argument does not reach the
  second.
- Keep the normed fraction field distinct from its completion; completeness
  of `Tₙ` does not imply completeness of `Frac(Tₙ)`, and the pinned complete
  case does not apply to `Frac(Tₙ)` for `n≥1`.

### Examples

Over `ℚ_p`, `p+T²` has Gauss norm one and supremum one, attained at `T=1`
and not at zero; `T₀=K` recovers the field with its norm. In characteristic
not two, the integral closure of `T₁` in `Frac(T₁)(√T)` is `T₁[√T]`, free
of rank two; in characteristic `p` the purely inseparable extension
`Frac(T₁)(T^(1/p))` has integral closure `T₁[T^(1/p)]=K⟨T^(1/p)⟩`, free of
rank `p`, which the separable-only argument does not reach.

### Dependencies

RestrictedPowerSeries §§2.4, 4–6; PadicFunctionalAnalysis §2.4;
SchemeAndStackFoundations §0.20; Tau Ceti weak stability and the Japanese
predicate; Mathlib restricted series, Gauss norms, integral closure and
fraction fields. Nothing of Layers 1–8 is used.

## Layer 1: affinoid algebras and their topology

### 1.1 Presentations and complete topology

The residue norm of a Tate presentation is the pinned
`TauCeti.IsAffinoidAlgebra.residueNormedCommRing`: a complete ultrametric
`K`-algebra norm on the affinoid algebra, transported from the quotient Gauss
norm of a chosen presentation and depending on it. Closure under quotients
and under finite algebra extensions is the pinned
`TauCeti.IsAffinoidAlgebra.quotient` and `TauCeti.IsAffinoidAlgebra.of_finite`;
noetherianity and the Jacobson property are the pinned
`TauCeti.IsAffinoidAlgebra.isNoetherianRing` and
`TauCeti.IsAffinoidAlgebra.isJacobsonRing`. Prove closedness of ideals of an
affinoid algebra for every complete algebra norm. For an affinoid `A` with a
complete ultrametric algebra norm, `A⟨X₁,…,Xₖ⟩` is the shared relative-series
carrier, affinoid by the pinned `TauCeti.IsAffinoidAlgebra.isRestricted_subring`,
with the continuous universal property for power-bounded variable images
(`TauCeti.IsAffinoidAlgebra.restrictedLift` and
`TauCeti.IsAffinoidAlgebra.existsUnique_algHom_isRestricted_subring`, for
affinoid source and target with complete ultrametric algebra norms); prove
the iteration law `A⟨X⟩⟨Y⟩≃A⟨X,Y⟩`. A surjection from a noetherian
ultrametric Banach `K`-algebra onto an affinoid algebra is an open quotient
map and induces a homeomorphic first isomorphism theorem: the pinned
`TauCeti.IsAffinoidAlgebra.isOpenQuotientMap` and
`TauCeti.IsAffinoidAlgebra.quotientKerContinuousAlgEquiv`.

Automatic continuity of algebra maps from a noetherian Banach `K`-algebra to
an affinoid, by the closed-graph argument of [BGR] 3.7.5 and 6.1.3, is the
pinned `TauCeti.IsAffinoidAlgebra.continuous_algHom`. Its algebraic inputs include finite-dimensionality of `A/𝔪^n` for
`n≥1` and
`⋂_{𝔪 maximal} ⋂_{n≥1} 𝔪^n=0`.
This is not the assertion `⋂_n 𝔪^n=0` for each fixed maximal ideal in an
arbitrary nonlocal ring. Independence of presentation and the equivalence of
complete algebra norms are the pinned
`TauCeti.IsAffinoidAlgebra.presentationContinuousAlgEquiv` and
`TauCeti.IsAffinoidAlgebra.toContinuousAlgEquiv` (an algebra isomorphism of
completely normed affinoid algebras is a homeomorphism). Deduce invariance of
boundedness and of integral elements under change of complete norm.
Contractive renorming for an affinoid homomorphism is pinned under
`TauCeti/RingTheory/Affinoid/ContractiveRenorming.lean`.

The closed-embedding theorem is the pinned
`TauCeti.IsAffinoidAlgebra.isClosedEmbedding_of_finite_injective`: every
finite injective algebra map from a noetherian complete ultrametric
`K`-algebra, in particular from an affinoid algebra, into an affinoid
algebra, each with a complete algebra norm, is a closed topological
embedding. Continuity is a conclusion. Norm-one equality is not.
*Needs:* §0.1 (Weierstrass theory, closed ideals and strictness for finite
Tate modules); RestrictedPowerSeries Layer 4 (restricted series over Banach
rings) and §§5.2–5.3; PadicFunctionalAnalysis §1.2 (open mapping and closed
graph) and Layer 1 (finite-module topology); the pinned names of this
section; Mathlib `IsNoetherianRing`, `IsJacobsonRing`, quotient norms and
`Topology.IsClosedEmbedding`.

**Checks.**

- Quotient by zero and by the unit ideal: the zero algebra is affinoid and
  its residue norm is zero.
- Dual numbers `K⟨T⟩/(T²)`: a complete algebra norm in which `T` has norm one
  although `T²=0`; the norm is not power multiplicative.
- An equivalent but differently scaled module norm defines the same
  topology and the same bounded sets; isometry is not asserted.
- In `K×K`, powers of a fixed maximal ideal have nonzero intersection, while
  the intersection over both maximal ideals is zero.

### 1.2 Normalisation, points and dimension

For `A≠0`, a finite injective map `T_d→A` is the pinned
`TauCeti.IsAffinoidAlgebra.exists_finite_injective`, and the pinned
`TauCeti.IsAffinoidAlgebra.exists_ringKrullDim_eq_finite_injective` gives it
with `d=dim A`. Establish finiteness in towers and the torsion-free
consequences when the target is a domain. Quotients by ideals with maximal
radical are finite-dimensional over `K`: the pinned
`TauCeti.IsAffinoidAlgebra.finite_quotient_of_isMaximal_radical`. Maximal
ideals contract to maximal ideals under algebra maps into an affinoid
algebra (the pinned `TauCeti.IsAffinoidAlgebra.comap_isMaximal`, whose source
need not be affinoid), and every maximal residue field is finite (the pinned
`TauCeti.IsAffinoidAlgebra.finite_quotient_of_isMaximal`). Prove that
affinoid domains are Japanese (`isJapanese_of_isAffinoidAlgebra`): an
affinoid domain is finite over a Tate algebra, which is Japanese by §0.2, and
the pinned `TauCeti.Ring.IsJapanese.of_finite` transfers the property along a
finite extension of domains. This holds in every characteristic.

For an affinoid **domain**, every maximal ideal has height `dim A`: the pinned
`TauCeti.IsAffinoidAlgebra.height_eq_ringKrullDim_of_isDomain` ([Conrad],
Lemma 2.1.5). For a general affinoid the componentwise statements are the
pinned `TauCeti.IsAffinoidAlgebra.height_map_quotientMk_eq_ringKrullDim_quotient`
(the image of a maximal ideal `𝔪⊇P` in the domain `A/P` has height
`dim A/P`) and
`TauCeti.IsAffinoidAlgebra.exists_mem_minimalPrimes_height_eq_ringKrullDim_quotient`
(the height of `𝔪` is the dimension of some irreducible component through
it), without asserting that all components have the same dimension.
*Needs:* §0.1 (distinguished charts, `dim Tₙ=n`, finite residue fields of
`Tₙ`); §0.2 (`Tₙ` is Japanese); §1.1 (finite extensions and quotients of
affinoids are affinoid); SchemeAndStackFoundations §§0.20–0.21 (Japanese and
excellent rings, permanence and completion criteria); Tau Ceti
`TauCeti.Ring.IsJapanese.of_finite` and the pinned names of this section;
Mathlib `MaximalSpectrum`, `Ideal.height` and `ringKrullDim`.

**Checks.**

- The cusp `K⟨X,Y⟩/(Y²−X³)` is finite over `K⟨X⟩` and has dimension one.
- `(T²−p)` in `ℚ_p⟨T⟩` has quadratic residue field and `|T(x)|=p^(−1/2)`.
- In `K⟨T⟩×K`, the maximal ideal `K⟨T⟩×0` has height zero although the
  ring has dimension one: the domain hypothesis of the height formula cannot
  be dropped.
- The zero algebra has no normalisation injection from a Tate algebra.
- `K⟨T⟩` is Japanese in characteristic `p` through the purely inseparable
  extension `Frac(T₁)(T^(1/p))`; `K⟨T⟩×K` is not a domain and the Japanese
  statement is not made for it.

Prove excellence of affinoid algebras in every characteristic, using the
shared excellent-ring criteria and [Conrad] §1.1's regularity arguments.
The supporting targets are regularity of Tate algebras, universal catenarity
(pinned under `TauCeti/RingTheory/Affinoid/UniversallyCatenary.lean`),
a nonempty regular locus in every affinoid domain, and geometrically regular
formal fibres at maximal ideals. Include the differential-rank regularity
criterion of [Conrad] Theorem 1.1.1 used in positive characteristic; finite
imperfection degree is not assumed. General excellent-ring permanence
stays in SchemeAndStackFoundations.
*Needs:* §1.2's normalisation; SchemeAndStackFoundations §0.21 (excellent
rings and their permanence); Tau Ceti universal catenarity; [Conrad]
Theorem 1.1.1.

### 1.3 Tensor products and complete field extension

For `B=A⟨X⟩/I`, `C=A⟨Y⟩/J`, the affinoid pushout `A⟨X,Y⟩/(I,J)` is the
pinned `TauCeti.AffinoidPushout`, with its continuous universal property,
its quotient law and its identification with the completed tensor product
`TauCeti.Huber.CompletedTensor` under `TauCeti/RingTheory/Affinoid/Pushout/`.
Prove presentation independence, density of the algebraic tensor image and
preservation of surjections. Compare this construction with Part II R0.3's
completed tensor product. Density alone is not the completion theorem.

**Supplier contract: Part III R3.6, *affinoid-completed-field-extension*.**
Transport its algebraic theorem through the presentation comparison above.
For a complete isometric extension `L/K`, set `A_L=A⊗̂_K L`. Identify
it as affinoid over `L`, identify `Tₙ(K)_L` with `Tₙ(L)`, and transport
the faithful flatness of `A→A_L`. For finite `A`-modules with their
canonical topologies supply the topological `A_L`-linear isomorphism

`A_L ⊗_A M ≃ M ⊗̂_K L`,

sending `(a⊗l)⊗m` to `(am)⊗l` on elementary tensors. The left tensor is
algebraic and finite, with its finite-module topology. The right uses the
shared nonarchimedean completed tensor. State naturality and compatibility
with exact sequences and repeated field extension. No algebraicity or
spherical completeness of `L/K` is assumed. For finite `L/K`, compare to
the algebraic tensor model with its complete finite-module topology.
Source: [BGR] 6.1.1 and [Conrad], Lemma 1.1.5; tensor construction from Part
II R0.5, *completed-tensor-banach-module*.
*Needs:* §1.1 (`A⟨X⟩`, presentations and quotient topologies);
PadicFunctionalAnalysis Layer 1 (finite-module topology); Tau Ceti
`TauCeti.AffinoidPushout` and `TauCeti.Huber.CompletedTensor`; AdicSpacesPartII
R0.3 and R0.5 (*completed-tensor-banach-module*); AdicSpacesPartIII R3.6
(*affinoid-completed-field-extension*); Mathlib `TensorProduct` and
`Module.Finite`.

**Checks.**

- `M=A`: both sides are `A_L`, and the map is the identity.
- `L=K`: both sides are `M`.
- Zero modules on either side give zero.
- `A=K⟨T⟩`, `M=A/(T)`: both sides are `L`, and the algebraic tensor
  `A_L⊗_A M=L⟨T⟩/(T)` already is complete.

### 1.4 Fraction algebras

The rational and Laurent fraction algebras, the invertibility of `g`, the
power-bounded ratios and their universal properties in terms of classical
points are pinned under `TauCeti/RingTheory/Affinoid/` (`RationalFraction.lean`,
`LaurentFraction.lean`, `Subdomain/Rational.lean`, `Subdomain/Laurent.lean`).
Construct Weierstrass fractions and the iterated presentations, and prove
density of `A[g⁻¹]` in `A⟨f/g⟩`. Construct the appropriate quotient seminorm on that localisation
and identify its separated completion with `A⟨f/g⟩`. Identify it naturally
with the shared adic rational localisation. Specify the compared norms
before asserting an isometry. Sources: [BGR] 6.1.4–6.1.5, 7.2; Part II R0.3.
*Needs:* §1.1 (`A⟨X⟩`, its continuous universal property and quotient
topologies); §1.3 (affinoid pushouts); the pinned rational and Laurent
fractions; AdicSpaces §3.1 (rational localisation of a Huber pair) and
AdicSpacesPartII R0.3; Mathlib `IsLocalization`.

**Checks.**

- One-variable Weierstrass and Laurent presentations of the disc
  `|T|≤|ϖ|` and the annulus `|ϖ|≤|T|≤1`.
- Denominator one gives back `A`; the zero algebra gives zero.
- Without `(g,f)=A`, taking all entries zero does not invert the
  denominator: the condition is part of the definition.
- Verify compatibility with restrictions and iterated rational
  localisations, not just an abstract algebra equivalence.

### 1.5 Strictness of arbitrary positive polyradii

For `ρᵢ>0`, consume the weighted Tate algebra, its multiplicative norm and
the finite monomial extension of RestrictedPowerSeries §5.4. The criterion

`T_{n,ρ} is strictly K-affinoid ↔ ∀ i, ρᵢ∈√|K×|`

is the pinned `TauCeti.isAffinoidAlgebra_isRestricted_iff_pow_eq_norm`, on
the native weighted algebra `MvPowerSeries.IsRestricted.subring`, with
`ρᵢ∈√|K×|` spelled as a positive power of `ρᵢ` equal to the norm of a unit
of `K`. Its reverse direction scales a power of each variable to norm one
and applies the finite monomial extension
(`TauCeti.isAffinoidAlgebra_isRestricted_of_pow_eq_norm`); its forward
direction applies the value-group theorem of §2.2 to the variables, whose
supremum norms are their weighted Gauss norms
(`TauCeti.exists_pow_eq_norm_of_isAffinoidAlgebra_isRestricted`, with one
exponent for all variables). In the strict case the weighted Gauss norm,
being a complete multiplicative algebra norm, is the supremum norm: the
pinned `TauCeti.IsAffinoidAlgebra.supSeminorm_eq_norm_of_normMulClass`.
This is the interface for Part IV F1.1, not a replacement of the broader
non-strict affinoid terminology. Source: [BGR] 6.1.5.
*Needs:* RestrictedPowerSeries §5.4 (weighted Tate algebras, their
multiplicative norm and the finite monomial extension); §2.2 (the uniform
value-group exponent, used by the forward direction, which is therefore
proved after Layer 2); the pinned names of this section; Mathlib
`MvPowerSeries.IsRestricted`.

**Checks.**

- Radius `p^(−1/2)` over `ℚ_p`: the reverse direction takes `n=2`, `c=p`,
  and `T²/p` has weighted Gauss norm `ρ²/|p|=1`; the forward direction reads
  `|T|sup²=|p|` off the value-group theorem.
- A positive radius outside `p^ℚ` over `ℚ_p` is excluded by the forward
  direction.
- Zero variables: the criterion is vacuous and `K` is affinoid.
- A function on an open disc is not in general a restricted series on its
  closed boundary; test `Σ T^n`.

### Examples

`K⟨T⟩/(T²−p)` over `ℚ_p` is a two-dimensional field extension, so its
unique maximal ideal is zero and its residue field is `ℚ_p(√p)`. The cusp
`K⟨X,Y⟩/(Y²−X³)` is finite free of rank two over `K⟨X⟩` on `1,Y`, so its
dimension is one. The weighted algebra of radius `p^(−1/2)` over `ℚ_p` is
affinoid: `T²/p` has weighted norm one, and `S ↦ T²/p`, `T ↦ T` gives
`T_{1,p^(−1/2)} ≅ ℚ_p⟨S,T⟩/(T²−pS)`, whereas a radius outside `p^ℚ` is
excluded by the value-group theorem.

### Dependencies

Layer 0; RestrictedPowerSeries Layer 4 and §§5.2–5.4; PadicFunctionalAnalysis
§1.2 and Layer 1; SchemeAndStackFoundations §§0.20–0.21; AdicSpaces §3.1;
AdicSpacesPartII R0.3 and R0.5; AdicSpacesPartIII R3.6; the pinned affinoid
algebra under `TauCeti/RingTheory/Affinoid/`; the forward direction of §1.5
uses §2.2.

## Layer 2: supremum seminorm, reduction and integral models

### 2.1 Pointwise and spectral descriptions

The evaluation norms `TauCeti.pointNorm` at the finite residue fields and the
supremum seminorm `TauCeti.supSeminorm` are pinned, with boundedness
(`TauCeti.IsAffinoidAlgebra.bddAbove_range_pointNorm`), ultrametricity, scalar
compatibility and submultiplicativity of `|·|sup`, the identity
`|f^n|sup=|f|sup^n` for `n≥1` including the zero algebra
(`TauCeti.IsAffinoidAlgebra.supSeminorm_pow`; exponent zero requires a nonzero
algebra), the nilradical kernel
(`TauCeti.IsAffinoidAlgebra.supSeminorm_eq_zero_iff`) and the maximum of its
values on the finitely many minimal-prime quotients
(`TauCeti.IsAffinoidAlgebra.supSeminorm_eq_iSup_minimalPrimes`). It is
unchanged by reduction.

Algebra homomorphisms contract these seminorms
(`TauCeti.IsAffinoidAlgebra.supSeminorm_map_le`); integral injective ones
preserve them (`TauCeti.IsAffinoidAlgebra.supSeminorm_map_of_isIntegral`). For a monic equation
`f^d+Σ_{i<d} aᵢf^i=0`, `d>0`, prove the bound by
`max_{i<d}|aᵢ|sup^(1/(d−i))`. Retain the equality for a minimal monic
equation for an integral torsion-free algebra monomorphism from an
integrally closed domain, as in [BGR] 3.8.1/7, including a non-domain
target. For the general algebraic formulation use the finite-residue-field
maximal points and explicit boundedness hypotheses of that section.
For an integral affinoid map, an equation attaining the spectral value as in
[BGR] 6.2.2/4 is pinned under `TauCeti/RingTheory/Affinoid/Integral/Equation.lean`,
and the minimal-equation equality under
`TauCeti/RingTheory/Affinoid/MinimalPolynomial.lean`; their scope is not
restricted to a chosen finite presentation of the map.
*Needs:* §1.2 (finite residue fields, normalisation, minimal primes and
maximal ideals of affinoids); §0.1 (maximum modulus on `Tₙ`); §0.2 (weak
stability for the minimal-equation equality); the pinned names of this
section; Mathlib `spectralNorm`, `MaximalSpectrum` and the real supremum.

**Checks.**

- On `K⟨T⟩` the supremum seminorm is the Gauss norm, so over `ℚ_p` the
  series `p+T²` has supremum one although its value at `T=0` is `|p|`; a
  definition reading a single point, or an infimum, gets this wrong.
- On `K×K` the element `(1,0)` has supremum one and is not nilpotent, and
  `|(1,0)·(0,1)|sup=0` while `|(1,0)|sup·|(0,1)|sup=1`: the seminorm is
  submultiplicative, not multiplicative.
- The algebra `ℚ_p⟨T⟩/(T²−p)` is a field with one classical point and
  residue field `ℚ_p(√p)`, and `|T|sup=p^(−1/2)` lies outside `|ℚ_p×|`; a
  definition that evaluates only at `K`-rational points misses it. The monic
  bound with `d=2`, `a₀=−p` gives `|T|sup≤|p|^(1/2)`, attained; replacing
  the exponent `1/(d−i)` by `1` would give the wrong bound `|p|`.
- On the zero algebra every supremum is zero, so `|1|sup=0` there and the
  exponent-zero identity fails.

### 2.2 Maximum modulus and Banach function algebras

For `A≠0`, every `|f|sup` is attained at a classical point: the pinned
`TauCeti.IsAffinoidAlgebra.exists_pointNorm_eq_supSeminorm`. The value-group
assertion holds uniformly, by the pinned
`TauCeti.IsAffinoidAlgebra.exists_supSeminorm_pow_eq_norm`: some `m≥1`,
depending only on `A`, satisfies `|f|sup^m∈|K|` for every `f`. In particular,
if `|f|sup>0` there is `c∈K×` with `|cf^m|sup=1`.

`A°={f:|f|sup≤1}` and `A°°={f:|f|sup<1}`, with their pointwise versions, are
the pinned `TauCeti.IsAffinoidAlgebra.isPowerBounded_iff_supSeminorm_le_one`
and `TauCeti.IsAffinoidAlgebra.isTopologicallyNilpotent_iff_supSeminorm_lt_one`;
the spectral-radius identity `|f|sup=inf_{n≥1}‖f^n‖^(1/n)`, agreeing with the
shared smoothing API, is pinned under
`TauCeti/RingTheory/Affinoid/SpectralRadius.lean`. Prove the
integral-equation criterion for a residue norm. For every reduced affinoid
and complete algebra norm prove `‖f‖≤C|f|sup` for some `C>0`
(`banachFunctionAlgebra`); the bound `|f|sup≤‖f‖` holds for every affinoid
and is the pinned `TauCeti.IsAffinoidAlgebra.supSeminorm_le_norm`.
Construct the complete supremum-norm model and its continuous algebra
equivalence with the original model. Include [BGR] 3.8.3/7: if `B→A`
is finite, injective and torsion-free, `A` is a reduced Banach algebra,
and `B` is a valued integrally closed noetherian Banach algebra with
weakly stable fraction field, then `A` is a Banach function algebra.
Identify its supremum norm with the spectral norm on
`A⊗_B Frac(B)`, a finite product of fields. The domain special case alone
is insufficient. The field characteristic
is arbitrary, using §0.2. Deduce uniformity and automatic continuity from
an arbitrary Banach `K`-algebra into a reduced affinoid.

For nonzero `A`, the supremum seminorm is a multiplicative **norm** precisely
when `A` is reduced and `Ã` is a domain (pinned under
`TauCeti/RingTheory/Affinoid/Multiplicative.lean`). A reduced domain by itself
does not suffice. Sources: [BGR] 3.8, 6.2.1–6.2.4; general spectral comparisons
from Part II R0.4.
*Needs:* §2.1; §1.2 (normalisation, minimal primes); §0.2 (weak stability
of `Frac(Tₙ)` and finite normalisation); §1.1 (automatic continuity,
equivalence of complete norms); the pinned names of this section; Tau Ceti
`TauCeti.Huber.powerBoundedSubring` and `topologicallyNilpotentIdeal`;
Mathlib `IsTopologicallyNilpotent`; AdicSpacesPartII R0.4 (spectral seminorm
and smoothing) for the comparison only.

**Checks.**

- A nonzero nilpotent in `K⟨T⟩/(T²)` has supremum zero while its quotient
  norm is one: reducedness in the Banach function algebra theorem cannot be
  dropped.
- For `0<|c|<1`, prove that the annulus algebra `K⟨X,Y⟩/(XY−c)` is a domain
  and has `|X|sup=|Y|sup=1`, `|XY|sup=|c|`. The domain assertion and norm
  computations are separate checks.
- On `K×K`, the maximum locus of `(1,0)` is not Zariski dense; do not extend
  the Tate maximum-locus theorem to every affinoid.
- Check the zero algebra separately in every power formula.

### 2.3 Reduction functor and presentation rings

The reduction map `φ̃:Ã→B̃` of an affinoid homomorphism, with its identity and
composition laws, its kernel and the equivalence of injectivity on reductions
with preservation of the supremum seminorm, is pinned under
`TauCeti/RingTheory/Affinoid/Reduction.lean`. Prove the radical statements of
[BGR] 6.3.1/4–5, and 6.3.1/6: for reduced source, injective strictness,
supremum isometry and injectivity on reductions are equivalent. Here strictness means that the map from the quotient by
the kernel to its image is a homeomorphism, using the induced topology
on the image. Supremum isometry is a consequence, not a claim that the
original presentation norms are equal. Include examples where a
surjective affinoid map does not induce a surjection on reductions.

For a presentation ring `A₀=π(Tₙ°)`, the image under `π` of the Gauss unit
ball `Subring.unitClosedBall` of the Tate algebra, the identity
`{a∈A : a is integral over A₀}={a:|a|sup≤1}` is the pinned
`AlgHom.isIntegral_map_unitClosedBall_iff_supSeminorm_le_one`, including
nonreduced algebras; with §2.2 the right-hand side is `A°`.
No finiteness of `A°` as an `A₀`-module is asserted. A finite affinoid
map induces a finite map on canonical reductions; deduce that `Ã` is a
finite-type `K̃`-algebra. Sources: [BGR] 6.3.1, 6.3.4–6.3.5.

Kiehl's almost noetherianity of `A₀` and its finite modules, with the
noetherian corollary for discretely valued `K`, is AdicSpacesPartIII R3.6's
*almost-noetherian-integral-affinoid-modules*, stated there for a ring of
definition which is a quotient of `K°⟨X₁,…,Xₙ⟩`; R3.6 identifies that
integral presentation with `A₀=π(Tₙ°)`, the image of the Gauss unit ball,
and consumes the integrality identity above. Nothing in this roadmap uses
the almost-noetherian estimate.

**Reduced quotient of a ring of definition.** For an open bounded subring `B⊆A`
and `ϖ∈B` which is topologically nilpotent and left regular in `A`, for
instance a topologically nilpotent unit of `A`, if `B/ϖB` is reduced then
`B=A°={f:|f|sup≤1}`: the pinned
`TauCeti.IsAffinoidAlgebra.mem_iff_supSeminorm_le_one_of_isReduced_quotient`,
proved by [FK] B.1.3(1)'s boundedness argument and §2.2's supremum
identification. The element `ϖ` need not be a scalar. Part II R0.9 consumes
this theorem. The sufficient hypothesis is not asserted to be necessary.
*Needs:* §2.2 (`A°`, `A°°` and the supremum theorems); §1.1 (presentations
and quotient norms); §1.2 (finite maps and residue fields); the pinned
reduction maps, presentation-ring integrality and reduced-quotient criterion;
Tau Ceti `Subring.unitClosedBall`; [FK] B.1.3(1); Mathlib `IsIntegral`,
`integralClosure` and `Ideal.Quotient`. AdicSpacesPartII R0.9 and
AdicSpacesPartIII R3.6 consume this section and are not inputs to it.

**Checks.**

- `T₀` gives `A₀=K°`, and `ℤ_p⟨T⟩/p=𝔽_p[T]` gives the positive
  reduced-quotient example.
- In `A=ℚ_p⟨T,S⟩/(S²−p²T)`, let `B` be the image of the integral Tate
  algebra: `S/p` is power-bounded but not in `B`, and `B/pB` is nonreduced;
  `B` is a presentation ring strictly smaller than `A°`, whose integral
  closure is `A°`.
- Conversely, `ℤ_p/p²` and `𝒪_{ℂ_p}/p` are nonreduced although their
  original rings are the power-bounded rings: the criterion is sufficient,
  not necessary.
- A surjective affinoid map whose reduction is not surjective (pinned under
  `TauCeti/RingTheory/Affinoid/NonsurjectiveReduction.lean`) shows that
  surjectivity does not pass to canonical reductions.

### Examples

On `K⟨T⟩/(T²)` the class of `T` has every point norm zero, so `|T|sup=0`
while `T≠0`; on the annulus `K⟨X,Y⟩/(XY−c)` with `0<|c|<1`,
`|X|sup=|Y|sup=1` and `|XY|sup=|c|`. On `ℚ_p⟨T⟩`, `A°=ℤ_p⟨T⟩`,
`A°°=pℤ_p⟨T⟩` and the reduction is `𝔽_p[T]`; in `ℚ_p⟨T,S⟩/(S²−p²T)`
the element `S/p` is power-bounded but outside the presentation ring, so the
presentation ring is strictly smaller than `A°` and `A°` is its integral
closure.

### Dependencies

Layers 0–1; AdicSpacesPartII R0.4 (comparison only); the pinned supremum
seminorm, power-bounded and topologically nilpotent characterisations,
reduction maps and presentation-ring integrality; [FK] B.1.3(1); Mathlib
spectral norms, integral closure and quotients. AdicSpacesPartII R0.9 and
AdicSpacesPartIII R3.6 consume this layer.

## Layers 3–4: affinoid spaces and subdomains

Classical `Sp A=MaximalSpectrum A`, the poset `TauCeti.AffinoidSubdomain` of
its affinoid subdomains, their presheaf of coordinate algebras
`TauCeti.AffinoidSubdomain.presheaf` and the weak affinoid G-topology
`TauCeti.AffinoidSubdomain.weakGTopology` are pinned under
`TauCeti/AlgebraicGeometry/Rigid/Affinoid/`; Layer 5 proves the sheaf
condition (`isSheaf_affinoidSubdomain_presheaf`). These are the classical
inputs consumed by Part II R0.9 and R1. Construct closed subspaces,
components, finite morphisms and affinoid fibre products. Identify classical points with maximal ideals, sections
with `A`, and algebraic tensors from §1.3 with fibre-product coordinates.
Retain nonreduced structure sheaves.

An affinoid subdomain is the pinned `TauCeti.IsAffinoidSubdomainMap`: a
representing algebra, map and universal property, with uniqueness of the
representing map, intersections, inverse images, flatness of restrictions
and the rational and Laurent cases pinned under
`TauCeti/RingTheory/Affinoid/Subdomain/`. Prove transitivity and identify
Weierstrass subdomains with §1.4. Gerritzen–Grauert supplies finite rational
decompositions and the ambient-cover refinement used in descent. Include
open, closed and locally closed immersions and the local-ring comparison
`A_𝔪/𝔪^n ≃ 𝒪_{Sp A,x}/𝔪_x^n` and its completion, for every `n`.
The germ map is local and faithfully flat after localisation. Prove
excellence of the analytic local rings ([Conrad], Theorem 1.1.3), using
§1.2's affinoid theorem. Construct these stalks after Layer 5 establishes
the sheaf condition.

For a domain `A`, restriction to a nonempty affinoid subdomain is injective,
and for a finite affinoid cover `Uᵢ`, `A→∏ᵢ𝒪(Uᵢ)` is faithfully flat; both
are pinned under `TauCeti/RingTheory/Affinoid/Subdomain/`.
Prove reducedness is local for a rational cover: `A` is reduced iff every
member algebra is reduced. The reverse implication uses faithful flatness;
the forward implication uses the affinoid-localisation theorem, not just
flatness of an arbitrary ring map. This supplies Part IV R5.7.
Sources: [BGR] Chapters 7–8; Part II consumes these subdomain interfaces.
*Needs:* §§1.1–1.4 (algebras, tensor products and fraction algebras); §2.2
(supremum norms for the rational-domain conditions and the maximum modulus);
§1.2 (excellence of affinoids, for the analytic local rings);
SchemeAndStackFoundations §0.21 (excellence permanence and completion
criteria); Layer 5 (the sheaf condition, used only for the stalk statements,
which are therefore proved after it); the pinned `TauCeti.AffinoidSubdomain`,
`TauCeti.AffinoidSubdomain.presheaf`, `TauCeti.IsAffinoidSubdomainMap` and
the subdomain theorems under `TauCeti/RingTheory/Affinoid/Subdomain/`;
Mathlib `Module.Flat`, `IsLocalization` and `IsLocalHom`.

**Checks.**

- Empty subdomains and zero rings, with an empty cover only of `Sp 0`.
- A rational cover of the unit disc by `|T|≤|ϖ|` and `|ϖ|≤|T|≤1`, whose
  intersection is the circle `|T|=|ϖ|`.
- Products with a nilpotent thickening: `Sp K⟨T⟩/(T²)` has the classical
  points of a point and a two-dimensional coordinate ring.
- For a tuple `(g₀,…,gₘ)` generating the unit ideal, the standard rational
  domains `{|gⱼ|≤|gᵢ|≠0 for every j}` cover; conversely such a cover forces
  the unit-ideal condition by Jacobsonness.
- Arbitrary rational domains do not cover merely because their denominators
  generate the unit ideal.

### Examples

The unit disc `Sp K⟨T⟩` is covered by the rational domains `|T|≤|ϖ|` and
`|ϖ|≤|T|≤1`, whose intersection is the circle `|T|=|ϖ|`; the empty
subdomain is `Sp 0`. A nilpotent thickening `Sp K⟨T⟩/(T²)` has the same
classical points as a point and a two-dimensional coordinate ring. For
`A=K⟨T⟩` and `𝔪=(T)`, `A_𝔪/𝔪^n` is `K[T]/(T^n)`, the quotient of the
analytic local ring at the origin by the `n`th power of its maximal ideal.

### Dependencies

Layers 1–2; Layer 5 for the stalk statements; SchemeAndStackFoundations
§0.21; the pinned affinoid subdomains and weak affinoid site; Mathlib
presheaves, flatness and localisation. AdicSpacesPartII R0.9 and R1 and
AdicSpacesPartIV R5.7 consume these layers.

## Layer 5: Čech comparison and acyclicity

Prove classical Tate acyclicity using the rational-localisation comparison
with foundational AdicSpaces and the affinoid-cover refinement of Layers 3–4.
Compare the finite-intersection algebras, restriction maps and augmented Čech
complexes. In degree zero this is the sheaf condition of the pinned weak
affinoid site: the presheaf `TauCeti.AffinoidSubdomain.presheaf` of
coordinate algebras is a sheaf for the Grothendieck topology of
`TauCeti.AffinoidSubdomain.weakGTopology` (`isSheaf_affinoidSubdomain_presheaf`,
[BGR] 8.2.1/1). This supplies the classical acyclicity consumed by Parts II
and III; Part III's coherent-sheaf theorem is not a prerequisite. For the
two-piece Laurent cover use `d(u,v)=v|intersection−u|intersection`.
Transport Tate acyclicity and refinement through this chain map.

Retain augmented Čech exactness for **every algebraic `A`-module**, by
tensoring the bounded exact alternating Čech complex for `A` with the
module. Its terms are flat by affinoid-localisation flatness; bounded
exactness then makes this tensoring exact. Intersection algebras are
completed affinoid tensor products, not automatically ordinary algebraic
tensor products. For finite modules, supply the canonical Banach topologies
and strict exactness as a separate theorem. Construct the natural
Čech-to-derived-cohomology comparison for covers
whose finite intersections are acyclic, using native sheaf categories.
Apply it to Part III R3.1's finite-module sheaves. The general comparison
is independent of the quasi-Stein theorem which uses it. No arbitrary
module receives a fictitious Banach norm. The higher Čech vanishing and the
module form are README targets; the sheaf form is the stated headline.
Sources: [BGR] 8.2; [Kiehl-AB] §1; Part III R3.1.
*Needs:* Layers 3–4 (rational covers, the Gerritzen–Grauert refinement, flat
restrictions); §1.4 (rational localisations and their identification with
AdicSpaces §3.1); AdicSpaces Layer 4 (Tate acyclicity for rational covers of
`Spa(A,A°)`); PadicFunctionalAnalysis Layer 1 (strictness for finite
modules); the pinned `TauCeti.AffinoidSubdomain.weakGTopology`,
`TauCeti.AffinoidSubdomain.presheaf`, `TauCeti.GTopology.grothendieckTopology`
and `TauCeti.GTopology.isSheaf_iff`; Mathlib `Module.Flat`,
`HomologicalComplex`, `CategoryTheory.Presheaf.IsSheaf` and sheaf
cohomology.

**Checks.**

- The Laurent sequence `0→K⟨T⟩→K⟨T/ϖ⟩×K⟨ϖ/T⟩→K⟨T/ϖ,ϖ/T⟩→0` with
  `d(u,v)=v−u` on the circle is exact; a sign convention `u−v` changes the
  differential but not exactness, and the augmentation is the diagonal.
- A one-member identity cover gives the complex `0→A→A→0`, exact.
- Zero modules and an infinitely generated direct sum of copies of `A` keep
  exactness; the strict version is asserted only for finite modules.
- Verify both the augmentation and differential under the comparison.
  Exactness alone does not certify closed images.
- For `A=0` the empty cover of `Sp 0` is admissible and the sheaf condition
  forces the coordinate algebra of the empty subdomain to be the zero ring.

### Examples

For the Laurent cover of the unit disc by `|T|≤|ϖ|` and `|ϖ|≤|T|≤1`, the
augmented Čech complex is `0→K⟨T⟩→K⟨T/ϖ⟩×K⟨ϖ/T⟩→K⟨T/ϖ,ϖ/T⟩→0`
with `d(u,v)=v−u` on the circle, and it is exact; the one-member identity
cover gives the complex `0→A→A→0`. Tensoring with an infinite direct sum of
copies of `A` keeps exactness; the strict version is asserted only for finite
modules.

### Dependencies

Layers 1–4; AdicSpaces Layers 3–4; PadicFunctionalAnalysis Layer 1; the
pinned weak affinoid site and G-topology sites; [Kiehl-AB]. AdicSpacesPartII
R1 and AdicSpacesPartIII R3.1 consume the acyclicity theorem.

## Layer 6: general G-topologies and rigid gluing

### 6.1 G-sites and sheaves

Admissible opens and covers with [BGR] 9.1's identity, restriction,
intersection and composition axioms, continuous maps, induced G-topologies,
their site on the preorder of admissible opens
(`TauCeti.GTopology.grothendieckTopology`), the identification of the sheaf
condition with the admissible-cover equaliser condition
(`TauCeti.GTopology.isSheaf_iff`), the ordinary open-set site of a
topological space, the G0–G2 conditions, pasting of §9.1.3 and the slightly
finer relation are pinned under `TauCeti/Topology/GTopology/`. Prove bases
and refinement, and the completeness and enhancement results of §9.1.2,
including the universal property.

Use Mathlib's sheaves and sheafification. Compare classical neighbourhood
stalks with site points, and BGR's plus construction with that sheafification.
Prove extension across a slightly finer G-topology by the dense-subsite
comparison, without constructing another category of sheaves.
*Needs:* the pinned G-topologies, sites and `TauCeti.GTopology.isSheaf_iff`;
Mathlib `CategoryTheory.GrothendieckTopology`,
`CategoryTheory.Presheaf.IsSheaf`, sheafification and
`TopologicalSpace.Opens`; nothing from Layers 0–5.

**Checks.**

- A topological space with every open set admissible and every open cover
  admissible is a G-topology whose site and sheaf condition are the ordinary
  ones; a definition admitting only finite covers does not recover it.
- On the discrete space `ℕ` with every subset admissible and only the finite
  covers admissible, the presheaf of bounded `K`-valued functions is a
  G-sheaf, although for the ordinary topology it fails the gluing condition
  for the cover by singletons: the sheaf condition depends on the admissible
  covers, not only on the admissible opens.
- The G2-enhancement of that finite-cover G-topology makes every open cover
  of a compact space admissible, since it has a finite refinement, while on
  `ℕ` the cover by singletons has none and stays inadmissible.
- The constant presheaf with value `ℤ` on a two-point discrete space is not
  a sheaf, and its sheafification has sections `ℤ×ℤ` over the whole space;
  the plus construction and Mathlib's sheafification must agree on it.
- For the empty admissible open and its empty cover the sheaf condition
  forces `F(∅)` to be a point; a presheaf with `F(∅)≠0` is not a sheaf,
  while the one-member cover `{U}` of `U` imposes nothing.

### 6.2 The classical presentation of the common geometry

The weak affinoid basis uses finite affinoid covers (the pinned weak affinoid
site `TauCeti.AffinoidSubdomain.weakGTopology`, whose sheaf condition is
Layer 5's `isSheaf_affinoidSubdomain_presheaf`); the strong topology is
detected by finite affinoid refinements after affinoid test maps. Prove
enhancement, restriction, admissibility of Zariski covers and the
idempotent/connectedness criterion. Construct the strong classical affinoid
site and structure sheaf used by Part II. General G-topology must be available below
both presentations, so this comparison does not define its own prerequisite.

Construct the category of rigid `K`-spaces as locally G-ringed spaces
locally isomorphic to these affinoids, with morphisms local on stalks. Prove the category laws,
the fully faithful contravariant affinoid-algebra embedding, admissible
restrictions, gluing and its universal property, and fibre products.
Construct affine and projective space, discs and annuli. Part II uses this
category and Layer 8's comparison; there is no second rigid carrier.
For quasi-separated rigid spaces, construct complete isometric field
extension using §1.3, compatibly with affinoid subdomains, gluing and
affinoid-coordinate faithful flatness. Carry the quasi-separated hypothesis
in these global base-extension statements. Sources: [BGR] §9.3 (weak and
strong G-topologies on affinoids, rigid analytic varieties, gluing and fibre
products; the complete field extension of quasi-separated spaces is its
9.3.6, as [Conrad] §3.1 records); [Bosch] §5.3; [Conrad] §3.1.
*Needs:* §6.1; Layers 3–4 (affinoid subdomains and finite affinoid covers);
Layer 5 (acyclicity, for the structure sheaf); §1.3 (complete field extension
of affinoids and of finite modules); Mathlib locally ringed spaces and sites.

**Checks.**

- The covering of the closed unit disc by its open disc and unit circle is
  set-theoretic but not admissible: a G-topology admitting it would force
  the structure presheaf to glue the function which is `0` on the open disc
  and `1` on the circle, against the identity principle.
- For `0<|ϖ|<1`, the domains `|T|^n≤|ϖ|`, `n≥1`, give an admissible
  exhaustion of the open disc: radii `|ϖ|^(1/n)` approach one even for
  discretely valued `K`.
- The punctured disc `{0<|T|≤1}` is the union of the affinoids
  `|ϖ|^n≤|T|≤1`, so it is an admissible open of the strong G-topology but
  not of the weak one; a construction that stopped at the weak G-topology
  would not make Zariski-open subsets admissible.
- Glue `ℙ¹` from two closed discs and identify the intersection annulus.

### 6.3 Relative compactness and properness

Define quasi-compact and quasi-separated morphisms by admissible affinoid
tests and finite covers, and separatedness by the diagonal closed immersion.
For an affinoid subdomain `U⊆Sp B` over `Sp A`, define `U⋐_A Sp B` by a
presentation `A⟨X₁,…,Xₙ⟩↠B` whose generator restrictions have supremum
norm `<1` on `U`. Prove equivalence with a single bound
`ε∈√|K×|`, `ε<1`, and the relative-polydisc closed-immersion criterion.
Establish restriction, separated-intersection, product and affinoid-base-change
laws. Finite affinoids are inner in themselves over the base.

Define Kiehl properness by separatedness and inner affinoid covers: over
each admissible affinoid of the base, the inverse image has two finite
affinoid covers `(Uᵢ)` and `(Vᵢ)` with `Vᵢ⋐Uᵢ`. Prove its local nature
on the base, the base-change law, and properness of finite morphisms. Prove
the composition law: a composite of Kiehl-proper morphisms is Kiehl-proper.
It does not follow from the inner-cover definition alone. For discretely
valued `K` it is proved through formal models ([Lütkebohmert] Corollary 3.2,
under that paper's standing complete discrete valuation ring); for general
`K` it is proved through the comparison of Kiehl properness with Berkovich
properness of Hausdorff strictly analytic spaces and the interior formula
([Temkin] Corollaries 4.5–4.6). Formal models and Berkovich spaces are
outside this roadmap, so those routes are inputs the composition law needs
from outside it, not constructions here. These classical predicates are
supplied to Part II's properness comparison and Part III's Kiehl theorems;
adic properness is not their definition. Sources: [Bosch] §6.3; [Kiehl-E]
§2; [Lütkebohmert] Corollary 3.2 (discretely valued `K`); [Temkin]
Corollaries 4.5–4.6 (general `K`, through the comparison with Berkovich
properness).
*Needs:* §6.2 (rigid spaces, fibre products, affinoid covers); §2.2
(supremum norms of generator restrictions); §1.1 (presentations); Layers
3–4 (closed immersions and the relative polydisc); for the composition law,
[Lütkebohmert] Corollary 3.2 or [Temkin] Corollaries 4.5–4.6 as inputs from
outside this roadmap.

**Checks.**

- A smaller closed disc is inner in the unit disc, whereas the unit disc is
  not inner in itself over `K`: the generators of a witnessing presentation
  would all have supremum below one, so by §2.3 `K̃[T]` would be integral
  over a subfield of `K̃`, which `T` is not.
- A closed point is not an affinoid open subdomain.
- For `ℙ¹`, the unit chart discs lie inside chart discs of radius `|ϖ|⁻¹`;
  both pairs cover and exhibit properness.
- The pair of unit discs used for gluing need not itself be an inner-cover
  pair.

### Examples

The disc `|T|≤|ϖ|` is inner in the unit disc over `K` through the
presentation `K⟨X⟩↠K⟨T⟩`, `X↦T`, whose generator has supremum `|ϖ|<1`
on it. The unit disc is not inner in itself over `K`: the generators of a
witnessing presentation would all have supremum below one, so the
presentation ring would reduce to constants and, by §2.3, `K̃[T]` would be
integral over a subfield of `K̃`, which `T` is not.
`ℙ¹` is proper: its unit chart discs lie inside the chart discs of radius
`|ϖ|⁻¹`. The punctured disc is an admissible open which is not
quasi-compact.

### Dependencies

Layers 1–5; the pinned G-topology sites and the weak affinoid site; Mathlib
sites, sheaves and locally ringed spaces; [BGR] §9; [Bosch] §§5.3, 6.3;
[Kiehl-E] §2; [Lütkebohmert]; [Temkin]. AdicSpacesPartII R1 and
AdicSpacesPartIII R3.6 consume the rigid category and the properness
predicates.

## Layer 7: coherent sheaves and proper cohomology

### 7.1 Banach prerequisites for Kiehl's theorem

These are supplier contracts, not duplicate operator definitions. Banach
`A`-modules are also compatible Banach `K`-spaces; scalar towers and complete
ultrametric norms are explicit. For lattice statements choose a presentation
ring `A₀` and compatible norms/lattices. For Part III's closed-target and
restriction theorems, require the coefficient unit ball to be exactly the
image of the Gauss unit ball under that presentation and preserve this
condition in the norm comparisons. An arbitrary norm unit ball or `A°`
is not a substitute.

1. **PadicFunctionalAnalysis §§1.2 and 2.1–2.2; Part III R3.3 and R3.6:** use
   model-space quotients and bounded lifting; every Banach `A`-module is a
   continuous quotient of `c₀(I,A)` for some discrete index set, not
   necessarily countable. If `f:M→N` is surjective and continuous, there is
   `δ>0` such that `‖e‖<δ` implies `f−e` surjective. Deduce stability of a
   finite generating family under sufficiently small perturbations. This
   corollary is Part III R3.3's *surjection-small-perturbation*. Use bounded
   lifting and successive correction; an `A`-linear right inverse is not
   assumed.
2. **Part III R3.6, strict complete continuity:** for `u:M→N`, require a
   scalar `c`, `0<|c|≤1`, such that for every `ε>0` there is a continuous
   finite-image approximant `v`, `‖u−v‖<ε`, and finitely many vectors of
   the target unit ball whose `A₀`-span contains `c·v(M₀)`. The scalar is
   uniform; the finite family may change with `ε`. Prove independence under
   the allowed equivalent lattice models, implication to CompactOperators'
   complete continuity, and descent into a closed target submodule for
   source `c₀(I,A)`. No complemented-submodule hypothesis is added.
3. **Part III R3.6, Schwartz's theorem:** for affinoid `A`, surjective
   continuous `f` and completely continuous `g`, `f+g` has closed image
   and finite `A`-module cokernel. No finite-kernel conclusion is asserted.
4. **Part III R3.6, relatively compact restriction:** transport §6.3's
   classical inner relation through the rigid–adic functor `r` of §8.3. For finite `B`-module `M`, compose the
   actual restriction `M→𝒪(U)⊗_B M`, `m↦1⊗m`, with any continuous
   surjection `c₀(I,A)↠M`. This composite is strictly completely
   continuous over `A`. The closed-target step uses R3.6's almost
   noetherianity of `A₀`; do not replace the restriction by an arbitrary
   map.

Sources: [Kiehl-E] §1, Sätze 1.2 and 1.4, Lemma 1.3, §2; [Bosch] §§6.3–6.4.
*Needs:* PadicFunctionalAnalysis §§1.2 and 2.1–2.2 (open mapping, `c₀`
model spaces, bounded lifting); CompactOperators §0.1
(`IsCompletelyContinuous`); AdicSpacesPartIII R3.3 and R3.6; §2.3
(presentation rings); §6.3 (the inner relation) and §8.3 (the functor `r`)
for the restriction contract, which is therefore stated after Layer 8.

**Checks.**

- Zero, the identity on `K`, and the noncompact identity on `c₀(ℕ,K)`
  distinguish the definitions.
- The map `h:Σa_nT^n↦Σa_nϖ^nT^n` has truncation error at most `|ϖ|^N`,
  strict approximation with `c=1`, and infinite-dimensional image; it fixes
  constants and has norm one.
- `id−h` has image `T K⟨T⟩` and cokernel `K`. Descent to this closed
  subspace is a required test.
- Taking `g=−id` violates Schwartz's compactness hypothesis on an infinite
  model space.
- In `K²`, `(1,δ),(δ',1)` generate when `|δ|,|δ'|<1`; for `f=e=id_K` the
  perturbation is not surjective, so the permissible bound cannot exceed
  one.

### 7.2 Numerical slopes as a shared analysis interface

The classical module-level interfaces on which LocallyAnalyticDistributions
§4.16 builds its finite-slope theory are the pinned `Polynomial.IsSlopeLE`,
`ContinuousLinearMap.IsSlopeDecomposition` and
`ContinuousLinearMap.IsSlopeDecomposition.exists_projection`, on native
polynomials, submodules, continuous linear maps and finite projective
modules. For `r>0`, the
affinoid root condition on `Q∈A[X]` is that every root
of `χ(Q)` has absolute value **at least** `r`, for every algebra map
`χ:A→L` with `L/K` algebraic, using the unique extended absolute value. Include
`r>0` in the predicate. For affinoid `A`, the equivalence with testing in
finite extensions, over all finite residue fields and their finite splitting
extensions, is the pinned `TauCeti.IsAffinoidAlgebra.isSlopeLE_iff_splittingField`. A decomposition is continuously split and
operator-stable; its first summand is finite projective and annihilated
by a monic such `Q` with unit constant term. Every polynomial satisfying
the same conditions acts invertibly on the complementary summand. Its
continuous projector has the specified image and kernel and commutes with
the operator. It is the continuous complementary-submodule projection,
independent of Fredholm theory. §7.2 is independent of
CompactOperators' Riesz projectors (CompactOperators §3.1), which are built
from its resolvent and Fredholm determinant; neither construction uses the
other. Existence at every cutoff over an arbitrary affinoid family is not
asserted.

For `r=|p|^h` this means eigenvalue valuation `≤h`, including equality.
It concerns annihilator roots; the roots of `det(1−TU)` are reciprocals.
The comparison of this classical root test with the geometric slope test
on a separated Fredholm factor, the numerical normalisation, functoriality
and uniqueness belong to LocallyAnalyticDistributions §4.16, which uses
§2's supremum theorem. Its coefficient test for monic `Q=ΣaⱼXʲ` with unit
`a₀` is `|aⱼ/a₀|sup rʲ≤1` for every `j`; that comparison is not reproved
here. Source: [Urban] §2.3.
*Needs:* §1.2 (finite residue fields, for the reduction to finite
extensions); the pinned slope predicates and projector; Mathlib
`Polynomial.aeval`, `IsCompl`, `Module.Projective`, `ContinuousLinearMap`,
`spectralNorm` and `Algebra.IsAlgebraic`.

**Checks.**

- For `c∈K×` and a finite projective Banach module, `c·id` with `|c|=r`
  belongs wholly to the first summand; the zero operator has zero first
  summand.
- For `0<|c|<1`, `X−c` fails the `r=1` condition, whereas `1−cT` passes its
  root test: the predicate reads annihilator roots, not reciprocal roots.
- Actual polynomial annihilation is required even over a nonreduced base;
  pointwise tests alone cannot detect nilpotent endomorphisms.

### 7.3 Coherence, identity principle and quasi-Stein spaces

**Supplier contracts: Part III R3.2–R3.4.** Finite modules
and coherent sheaves on `Sp A` are equivalent via the associated-module
functor and global sections, compatibly with restriction, tensor products
and exact sequences. Include coherent ideals/closed subspaces, finite
algebras/finite morphisms and affinoid acyclicity.

**Classical identity principle (supplied to Part II R1.9).** On a connected
normal rigid space, any nonempty admissible open is
analytically Zariski dense. Restriction is injective for functions and
finite locally free sheaves. Do not assert this for arbitrary coherent
sheaves supported away from the open, or omit normality.

**Supplier contract: Part III R3.4.** A quasi-Stein exhaustion is countable,
increasing, admissible and affinoid,
with dense restrictions of coordinate rings. Prove density for coherent
sections, generation on each member by global sections and vanishing of
higher coherent cohomology. No relative-compactness condition or global
finite generating set is implicit. Include the relative version when
inverse images of affinoid opens are quasi-Stein. Sources: [Kiehl-AB]
Definition 2.3 (quasi-Stein spaces) and Satz 2.4 (2.4.1 density, 2.4.2
Theorem B, 2.4.3 Theorem A); [Conrad] Lemma 2.1.4 (identity principle) and
§§1–2; Part III R3.4.
*Needs:* AdicSpacesPartIII R3.2–R3.4; Layer 5 (Čech-to-derived comparison);
§6.2 (rigid spaces); Layers 3–4 (normality and the analytic local rings, for
the identity principle); §8.3 (the comparison functor through which the
transport is made).

**Checks.**

- On the closed unit disc a function vanishing on the smaller disc
  `|T|≤|ϖ|` is zero, since a nonzero Tate series has finitely many zeros.
- The skyscraper sheaf at the origin has nonzero global sections
  restricting to zero on the admissible open `|T|=1`, so the principle is
  not asserted for every coherent sheaf.
- The union of the coordinate axes `Sp K⟨X,Y⟩/(XY)` is connected but not
  normal, and the nonzero function `Y` vanishes on the nonempty Zariski-open
  admissible subset `X≠0`, the `X`-axis without the origin: normality cannot
  be dropped.
- The open unit disc, exhausted by the closed discs `|T|^n≤|ϖ|` with dense
  restrictions, is quasi-Stein with `H¹(𝒪)=0`, and its ring of global
  functions, the series converging on `|T|<1`, is not affinoid.
- `Sp A` with its one-member exhaustion is quasi-Stein, and Theorem B there
  is affinoid acyclicity.
- `ℙ¹` is not quasi-Stein: an admissible increasing affinoid exhaustion of a
  quasi-compact space has a member equal to the whole space, and `ℙ¹` is not
  affinoid because its global functions are the constants.

### 7.4 Proper mapping, strictness and base change

**Supplier contract: Part III R3.6.** For Kiehl-proper `f:X→Sp A` and
coherent `F`, prove `M^i=H^i(X,F)` finite over `A`, all higher direct
images coherent, and closed-range differentials for finite affinoid Čech
complexes computing this cohomology. Use the finite inner-cover definition
of properness, with its separatedness and base-change properties. Neither
smoothness nor reducedness is assumed.

For an affinoid subdomain `Sp B→Sp A` or a finite flat affinoid map,
prove the canonical base-change isomorphism
`B⊗_A M^i ≃ H^i(X_B,F_B)`. For every complete isometric `L/K`, prove
the same with `B=A_L`; compare its algebraic tensor with the completed
field tensor using §1.3. Maps are induced by pullback and scalar action
and commute with connecting homomorphisms. Arbitrary nonflat base change
does not follow. Source: [Kiehl-E] Satz 2.6, Satz 3.5 and §3;
Part III R3.6.
*Needs:* AdicSpacesPartIII R3.6; §6.3 (Kiehl properness); §7.1 (Banach
prerequisites); §7.3 (coherence); §1.3 (complete field extension of finite
modules); Layer 5 (finite affinoid Čech complexes).

**Checks.**

- On `ℙ¹` over `K`, `H⁰(𝒪(−2))=0` and `H¹(𝒪(−2))=K`; base change along a
  finite extension `L/K` gives `0` and `L`, and the algebraic tensor with
  `L` agrees with the completed one.
- For `X=ℙ¹×Sp A→Sp A` and the sheaf `𝒪(−2)`, `M¹=A` is free of rank one,
  and base change to a rational subdomain `Sp A⟨f/g⟩` gives `A⟨f/g⟩`, as
  the Čech complex of the two standard discs computes directly.
- The zero sheaf has zero cohomology on both sides.
- Nonflat base change fails: on `X=ℙ¹` over `A=K⟨t⟩`, with `x` the affine
  coordinate, let `F` be the ideal sheaf of the classical point `P` given by
  `t=0`, `x=0`, twisted by `𝒪(−1)`; then `H⁰(X,F)⊆H⁰(X,𝒪(−1))=0`, whereas
  along `A→A/(t)=K` the restriction of `F` to the fibre `ℙ¹_K` is
  `𝒪(−2)⊕k_P`, whose `H⁰` is `K`.

### 7.5 Principal filtrations and formal functions

For the same `f,F`, `a∈A`, and `i≥0`, let

`R_n=ker(M^i→H^i(X,F/a^nF))`, for `n≥0`.

Require `R_0=M^i`, decreasingness, `a^nM^i⊆R_n`,
`aR_n⊆R_(n+1)`, and equality in the last inclusion for all sufficiently
large `n`. Prove a uniform shift `d` with `R_(n+d)⊆a^nM^i` for every
`n`. Also prove a uniform shift `e` such that the transition

`H^i(X,F/a^(n+e)F)→H^i(X,F/a^nF)`

has image in the image of `M^i`. Thus both the kernel and cokernel systems
of `M^i/a^nM^i→H^i(X,F/a^nF)` are pro-zero; the two shifts need not
coincide. Include the transition maps, not just abstract isomorphic limits.
Source: [Kiehl-E] Theorem 3.4 (the filtration `(R_n)` is `a`-good and the
kernel and cokernel systems are null systems).

For every ideal `J⊆A`, prove the canonical formal-functions isomorphism
`(M^i)^∧_J ≃ lim_n H^i(X,F/J^nF)`, with naturality. The general-ideal
argument is required and uses the noetherian filtration/Artin–Rees inputs;
it is not obtained by merely relabelling `a` as `J`. This is ideal-adic
completion, not Banach completion. The proof and its classical/adic forms
share Part III's cohomology implementation. Source: [Kiehl-E] Theorem 3.7
(by induction on the number of generators of `J`, which is finite since `A`
is noetherian).
*Needs:* §7.4 (finiteness and base change); AdicSpacesPartIII R3.6;
Mathlib's Artin–Rees lemma `Ideal.exists_pow_inf_eq_pow_smul`,
`AdicCompletion`, `IsNoetherianRing` and `Module.Finite`.

**Checks.**

- For `a=0`, `R_0=M^i` and `R_n=0` for `n≥1`, and the shift `d=1` works.
- For `a=1`, `R_n=M^i` and quotient cohomology is zero.
- For the identity of `Sp A` in degree zero, `R_n=a^nM`.
- On `ℙ¹`, compute `H⁰(𝒪)=K`, `H¹(𝒪)=0` and compare the Čech, sheaf and
  base-change maps.

### Examples

The map `h:Σa_nT^n↦Σa_nϖ^nT^n` on `K⟨T⟩` is strictly completely
continuous with `c=1`, and `id−h` has image `TK⟨T⟩` and cokernel `K`.
For `c∈K×` with `|c|=r` and `U=c·id` on a finite projective Banach
module, `M₁=M`, `M₂=0`, annihilated by `X−c`; for `U=0`, `M₁=0`. For
`a=0` the filtration is `M^i,0,0,…` and the shift `d=1` works; on `ℙ¹`,
`H⁰(𝒪)=K` and `H¹(𝒪)=0`.

### Dependencies

Layers 1–6; PadicFunctionalAnalysis §§1.2, 2.1–2.2; CompactOperators §0.1
and Layer 3; AdicSpacesPartIII R3.2–R3.6; §8.3 for the transport of the
contracts; the pinned slope predicates; Mathlib Artin–Rees and adic
completion; [Kiehl-E]; [Kiehl-AB]; [Conrad]; [Urban] §2.3.
LocallyAnalyticDistributions §4.16 and AdicSpacesPartIII consume §7.2 and
§7.5 respectively.

## Layer 8: analytification and rigid–adic comparison

### 8.1 Analytification, local rings and components

Construct the classical rigid analytification consumed by Part II R1.
Construct absolute analytification of schemes locally of finite type over
`K` ([Conrad] Appendix A) and relative analytification over `Sp A` for
schemes locally of finite type over `Spec A` ([Conrad-RA] Example 2.2.11:
the final rigid space over `Sp A` with a map to the scheme as locally ringed
G-topologised spaces over `A`). The latter schemes need not be locally of
finite type over `K`. Include the universal property, points (bijective onto
the points with residue field finite over `K`), fibre products, immersions
and finite maps, with their canonical comparison maps. Build relative affine
charts using completed presentations and glue them along Zariski opens. The
flat local comparison gives exact pullback; the coherent-sheaf and proper
GAGA comparisons are Part III R3.7's targets.

For a classical analytic point `x` over a closed point `x₀`, identify
the completed local rings, compatibly with their local map. Prove that
`𝒪_{X,x₀}` is reduced, respectively normal, iff `𝒪_{X^an,x}` is.
Use §1.2 and Layers 3–4 for affinoid and analytic excellence, the shared
permanence theorems for finite-type schemes over affinoids, and the
completion criteria; normal here means an integrally closed local
domain. Deduce the global equivalences for reducedness and normality.
Also retain connectedness and irreducible-component comparisons, with
components carrying their reduced induced structures. Sources: [Conrad]
§1 and Appendix A (absolute case); [Conrad-RA] Example 2.2.11 (relative
case, with its compatibility with fibre products, affinoid base change and
complete field extension); SchemeAndStackFoundations' excellence input.
*Needs:* §6.2 (gluing and affinoid charts); §1.3 (completed presentations
and pushouts); §1.2 and Layers 3–4 (excellence of affinoid algebras and of
analytic local rings); SchemeAndStackFoundations §0.21 (excellence
permanence, reducedness and normality under completion); Mathlib
`AlgebraicGeometry.Scheme`, `LocallyOfFiniteType`, `IsReduced` and
`IsIntegrallyClosed`.

**Checks.**

- The affine line at zero and the dual-number thickening: the completed
  local rings are `K⟦x⟧` and `K[x]/(x²)` on both sides.
- Over a field of characteristic different from two, the origin on
  `y²=x²(x+1)` has an algebraic local domain but an analytic germ with two
  branches, using a convergent square root of `1+x` on a small disc. Local
  integrality is therefore not an additional equivalence.
- Completion isomorphisms do not alone justify a local-domain assertion.
- For `A=K` the relative analytification is the absolute one; for a finite
  `K`-algebra `A`, `Sp A=Spec A` and analytification over it is
  analytification over `K`.

### 8.2 Classical points and constructible density

For a complete ultrametric normed affinoid algebra `A`, which is
topologically of finite type over `K` by the pinned
`TauCeti.IsAffinoidAlgebra.isTopologicallyFiniteType` (the converse is
`TauCeti.Huber.isTopologicallyFiniteType_algebraMap_iff_isAffinoidAlgebra`),
the map `Max A→Spa(A,A°)` is the pinned
`TauCeti.ValuationSpectrum.maximalSpectrumToSpa`, injective by the pinned
`TauCeti.ValuationSpectrum.maximalSpectrumToSpa_injective`, with image the
points of maximal support
(`TauCeti.ValuationSpectrum.range_maximalSpectrumToSpa`). Identify rational
traces and their coordinate rings. In `Spv A`, let `L_A` consist of the
valuations at most one on `A°` and strictly less than one on `A°°`.
Prove its equality with the constructible closure of the classical points;
deduce their constructible density in `Spa(A,A°)`. Constructible subsets
are determined by their classical traces. Prove the finite rational-cover
criterion through this comparison. Sources: [Huber-CV] Theorem 4.1,
Corollary 4.2; Part II R1.7's classical-point contract.
*Needs:* §2.2 (`A°` and `A°°`); the pinned classical points of
`Spa(A,A°)` and the topologically-finite-type identification; AdicSpaces
Layers 1–2 (`Spv`, `Spa`, rational subsets, pro-constructible subspaces);
AdicSpacesPartII R1.7 (classical-point contract); [Huber-CV] §4.

**Checks.**

- Classical points of the disc are the maximal ideals of `K⟨T⟩`; the Gauss
  point is not classical, its support being zero.
- The rational subset `|T|≤|ϖ|` has classical trace the points of the
  smaller disc, and its coordinate ring is `K⟨T/ϖ⟩`.
- A rank-two point just below the Gauss point can have `v(T)<1` but
  `v(T)^n>|ϖ|` for every `n≥1`; it is outside the adic open
  `⋃_n{|T|^n≤|ϖ|}` corresponding to the rigid open disc. Its singleton is
  proconstructible, not constructible: density does not say arbitrary
  subsets are determined by classical points.
- For `A=0`, `Max A` and `Spa(A,A°)` are both empty.

### 8.3 The image of the rigid–adic functor

Construct the shared functor `r(Sp A)=Spa(A,A°)` and prove compatibility with
gluing, products, the structure sheaf and its ringed topos. It is fully
faithful on rigid spaces. Adic spaces locally of finite type over
`Spa(K,K°)` are locally images of affinoids. Restricted to quasi-separated
objects, `r` is an equivalence with quasi-separated adic spaces locally of
finite type. Prove `r(X)` affinoid iff `X` affinoid. Source: [Huber-FR]
Proposition 4.5; Part II R1.7.
*Needs:* §8.2 (classical points and constructible density); §6.2 (rigid
spaces, gluing and the structure sheaf); Layer 5 (acyclicity, for the ringed
topos comparison); AdicSpaces Layers 3–5 (structure presheaf, gluing, locally
finite type morphisms); AdicSpacesPartII R1.7; [Huber-FR] §4.

**Checks.**

- Two rigid closed discs glued along the rigid open disc give a
  non-quasi-separated example: in its adic image the two rank-two boundary
  points from §8.2 remain distinct.
- Over algebraically closed `K`, also construct the example of two adic
  discs glued along the complement of the closure of the Gauss point; it is
  locally of finite type but is not in the global image.
- These distinguish local image, full faithfulness and essential
  surjectivity.
- Check the affinoid case and the empty space.

Part II owns the further separatedness, properness and partial-properness
comparisons with its adic morphism classes, using §6.3's classical notions
and `r`. Consume its converses with their discrete-valuation hypotheses
and its separately stated locally quasi-finite exception; do not infer
an unqualified converse from the forward comparison.

### 8.4 Proper GAGA

**Supplier contract: Part III R3.7.** For a scheme proper over an
affinoid base, require the exact tensor-compatible equivalence of coherent
sheaves under analytification and the canonical `A`-linear cohomology
comparison in every degree. Include compatibility of higher direct images
with analytification for a proper morphism, even if the target is not
proper. Degree-zero maps are pullback/adjunction maps and the higher ones
extend them functorially.
*Needs:* AdicSpacesPartIII R3.7; §8.1 (analytification); §§7.3–7.4
(coherence and proper cohomology); §8.3 (the comparison functor).

**Checks.**

- `ℙ¹`, its line bundles and finite schemes including nilpotent
  thickenings.
- Nonproper affine-line analytification has nonpolynomial global functions
  and does not satisfy an unrestricted GAGA statement.
- Étale and pro-étale comparisons are owned by Part IV and
  AdicEtaleGeometry; this roadmap asserts no additional equivalence of those
  topoi.

### Examples

The analytification of the affine line is the union of the discs `|T|≤|ϖ|⁻ⁿ`
and has global functions the entire series, so GAGA fails for it; `ℙ¹`
analytifies to the glued pair of unit discs with `H⁰(𝒪)=K`. In characteristic
not two, the origin of `y²=x²(x+1)` has an algebraic local domain and an
analytic germ with two branches `y=±x√(1+x)`. In `Spa(K⟨T⟩,K°⟨T⟩)` the Gauss point is not
classical, and a rank-two point just below it lies outside the adic open
`⋃_n{|T|^n≤|ϖ|}` of the rigid open disc.

### Dependencies

Layers 1–7; AdicSpaces Layers 1–5; AdicSpacesPartII R1.7;
AdicSpacesPartIII R3.7; SchemeAndStackFoundations §0.21; the pinned
classical points of `Spa(A,A°)`; Mathlib schemes; [Conrad] §1 and Appendix
A; [Conrad-RA] Example 2.2.11; [Huber-CV]; [Huber-FR].

## Dependency order and completion

1. Import the shared Tate and Banach foundations; prove characteristic-free
   weak stability of the Gauss fraction field and its Japanese application.
2. Consume the pinned affinoid normalisation, topology and supremum
   theorems, including the polyradius criterion, independently of geometry;
   then prove the Banach function algebra theorem and the integral theory.
3. Compare the algebra with Part II's carriers, localisations, tensors
   and spectral data. General G-site theory is independent of this step.
4. Construct classical subdomains, Tate acyclicity, the G-site and rigid
   category, then rigid analytification and the rigid–adic functor. Use
   foundational adic results, not Part II's consumers of these classical
   constructions. Establish the classical properness predicates.
5. Transport Part III's coherent, quasi-Stein, proper-cohomology and GAGA
   results through the ringed-site equivalence. Prove the elementary
   numerical decomposition and projection of §7.2 independently;
   LocallyAnalyticDistributions §4.16 builds its geometric and
   Fredholm-window comparisons on them.

Completion requires all stated generalities, all canonical-map compatibility
theorems and every check above. There must be one production definition of
each shared series, operator, tensor and geometric object. Compile the
actual modules and audit the transitive axioms of their capstone theorems;
only `propext`, `Classical.choice` and `Quot.sound` are accepted. An
elaborating roadmap prototype is not a proof or an implementation milestone.

## Downstream consumers

- AdicSpacesPartII R0.9 and R1 (R1.1, R1.7 and R1.9) consume
  `TauCeti.IsAffinoidAlgebra`, the affinoid norm and reduction theorems, the
  closed-embedding theorem of §1.1, the affinoid space `Sp A` and its
  subdomains of Layers 3–4, classical Tate acyclicity of Layer 5, the rigid
  category and the properness predicates of §§6.2–6.3, rigid analytification
  of §8.1, the classical-point contract of §8.2, the identity principle of
  §7.3 and the rigid–adic functor of §8.3. R0.9 transports the algebraic
  predicate to its topological presentation; the R1 names refer to these
  objects, not to independent definitions.
- AdicSpacesPartIII R3.1–R3.7 consume classical affinoid acyclicity and the
  Čech-to-derived comparison of Layer 5, the presentation-ring integrality
  of §2.3 (for its *almost-noetherian-integral-affinoid-modules*), the
  local-ring comparisons of Layers 3–4 and §8.1, the properness predicates
  of §6.3 and the principal filtrations and formal functions of §7.5.
- AdicSpacesPartIV F1.1 and R5.7, with its dagger-algebra targets, consume
  strict-polyradius affinoidness (§1.5), affinoid excellence (§1.2), the
  supremum theorems of §§2.1–2.2, fraction algebras (§1.4) and
  rational-local reducedness (Layers 3–4), read through AdicSpacesPartII's
  R0.9 carrier bridge; dagger algebras, weak completion, étale and
  pro-étale geometry and their site comparisons stay there.
- LocallyAnalyticDistributions §4.16 builds its geometric slope comparison,
  Fredholm windows and finite-slope complexes on the numerical slope
  predicates, decomposition and projection of §7.2; it owns the comparison
  of the classical root test with the geometric one, the numerical
  normalisation, functoriality and uniqueness.

## References

- **[BGR]** S. Bosch, U. Güntzer, R. Remmert, *Non-Archimedean Analysis*,
  Springer, 1984. Sections 3.5–3.8 and Chapters 4–9; locators above use
  the book's section/statement numbering.
- **[Bosch]** S. Bosch, *Lectures on Formal and Rigid Geometry*, Lecture
  Notes in Mathematics 2105, Springer, 2014,
  [doi:10.1007/978-3-319-04417-0](https://doi.org/10.1007/978-3-319-04417-0),
  especially §§6.3–6.4 for relative compactness and Kiehl's theorem.
  Locators use the published numbering, not that of the earlier Münster
  preprint.
- **[Kiehl-AB]** R. Kiehl, *Theorem A und Theorem B in der
  nichtarchimedischen Funktionentheorie*, Invent. Math. 2 (1967), 256–273.
  [Journal volume](https://gdz.sub.uni-goettingen.de/id/PPN356556735_0002).
- **[Kiehl-E]** R. Kiehl, *Der Endlichkeitssatz für eigentliche Abbildungen
  in der nichtarchimedischen Funktionentheorie*, Invent. Math. 2 (1967),
  191–214. [Journal volume](https://gdz.sub.uni-goettingen.de/id/PPN356556735_0002).
- **[Conrad]** B. Conrad, *Irreducible components of rigid spaces*,
  Ann. Inst. Fourier 49 (1999), 473–541, especially Lemma 1.1.5,
  Lemma 2.1.4, Lemma 2.1.5 and Appendix A.
  [Author text](https://virtualmath1.stanford.edu/~conrad/papers/irredpaper.pdf).
- **[Conrad-RA]** B. Conrad, *Relative ampleness in rigid geometry*,
  Ann. Inst. Fourier 56 (2006), 1049–1126, Example 2.2.11 (relative
  analytification over an affinoid base),
  [doi:10.5802/aif.2207](https://doi.org/10.5802/aif.2207).
- **[Lütkebohmert]** W. Lütkebohmert, *Formal-algebraic and rigid-analytic
  geometry*, Math. Ann. 286 (1990), 341–371, Corollary 3.2.
  [GDZ digitisation of the volume](https://gdz.sub.uni-goettingen.de/id/PPN235181684_0286).
- **[Temkin]** M. Temkin, *On local properties of non-Archimedean analytic
  spaces*, Math. Ann. 318 (2000), 585–607, Corollaries 4.5–4.6,
  [doi:10.1007/s002080000123](https://doi.org/10.1007/s002080000123).
- **[Huber-CV]** R. Huber, *Continuous valuations*, Math. Z. 212 (1993),
  455–477, §4.
  [GDZ digitisation of the volume](https://gdz.sub.uni-goettingen.de/id/PPN266833020_0212).
- **[Huber-FR]** R. Huber, *A generalization of formal schemes and rigid
  analytic varieties*, Math. Z. 217 (1994), 513–551, §4.
  [GDZ digitisation of the volume](https://gdz.sub.uni-goettingen.de/id/PPN266833020_0217).
- **[FK]** K. Fujiwara, F. Kato, *Foundations of Rigid Geometry I*,
  Appendix B, Proposition B.1.3(1).
  [arXiv:1308.4734](https://arxiv.org/abs/1308.4734).
- **[Urban]** E. Urban, *Eigenvarieties for reductive groups*, Ann. of Math.
  174 (2011), 1685–1784, §2.3: slope decompositions and polynomial tests.
  [Journal article](https://doi.org/10.4007/annals.2011.174.3.7).

## Existing Lean work

The [WilliamCoram/PhD sources][PhDSources], pinned to
`eefb3d91f34b27d0bc7822140fa85fecae029884`, are secondary implementation
references, not the specification or build dependencies. Coordinate
integration with the author and audit hypotheses and transitive axioms;
a stronger target is not discharged by a narrower source theorem.

| Source under `PhD/TauCeti/Code/RigidAnalyticGeometry/` | Interface to compare |
| --- | --- |
| `WeaklyStable.lean`, `Japanese.lean` | Valued fraction fields and finite normalisation in §0.2; retain positive characteristic |
| `Affinoid/{Basic,Continuity,Noether,Fractions,Tensor,BaseChange,Extend}.lean` | Presentations, topology, normalisation and tensor comparisons |
| `SupSeminorm/`, `Affinoid/{SupSeminorm,FunctionAlgebra,PowerBounded}.lean` | Spectral values and Banach function algebras, including reduced non-domains |
| `Affinoid/{Reduction,ReductionFunctor}.lean` | Presentation integrality and canonical reduction maps |
| `Restricted/`, `TateAlgebra/` | Shared-series provenance owned by RestrictedPowerSeries |

[PhDSources]: https://github.com/WilliamCoram/PhD/tree/eefb3d91f34b27d0bc7822140fa85fecae029884
