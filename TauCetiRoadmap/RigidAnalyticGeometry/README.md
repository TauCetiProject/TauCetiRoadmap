# Roadmap: rigid analytic geometry

**Summary.** Develop classical affinoid algebra and its comparison with rigid
and adic geometry over a complete nontrivially valued nonarchimedean field. The
algebraic milestones are weak stability of the Gauss fraction field, finiteness
of normalisation and excellence of affinoid algebras, Noether normalisation,
the maximum modulus principle, integral reduction and the Banach function
algebra theorem. The geometric milestones are the Gerritzen–Grauert theorem,
excellence of the analytic local rings, Tate acyclicity on the classical
G-site, rigid spaces with their properness predicates, the identity principle,
analytification, Huber's constructible density of classical points and the
rigid–adic comparison. Coherent cohomology, Kiehl's proper mapping theorem and
proper GAGA are built downstream of this roadmap, by AdicSpacesPartIII, on
these carriers; analytic families and the geometry underlying eigenvarieties
use them in turn.

This README is the roadmap; every target and Check is required.
[Suggested.lean](Suggested.lean) is the acceptance test: it states the
headline theorems against the pinned Mathlib and Tau Ceti, each admitted, and
its module docstring names the headlines that no pinned carrier can state.
Production modules import library mathematics, not a roadmap's acceptance
file.

## Scope and ownership

This roadmap owns classical affinoid algebra, subdomains, the classical
G-site and rigid category, the classical properness predicates, the identity
principle, rigid analytification, constructible density of classical points
and the rigid–adic comparison. Below, Part II, Part III and Part IV name
AdicSpacesPartII, AdicSpacesPartIII and AdicSpacesPartIV. All three are
downstream of this roadmap and supply nothing to it; their interfaces with it
are listed under **Downstream consumers**. The interfaces consumed by Part II
are `TauCeti.IsAffinoidAlgebra`, the affinoid norm and reduction theorems, the
affinoid space `Sp A` of Layer 3, affinoid subdomains of Layer 4, classical
Tate acyclicity, the rigid category of §6.2, rigid analytification and the
rigid–adic functor `r` of §8.3. Part II's R0.9 transports the algebraic
predicate to its topological presentation; its R1 names refer to these
objects, not independent definitions.

Part II owns the completed tensor products of R0.3 and R0.5 (the latter for
Banach modules), the spectral seminorm and smoothing of R0.4, the comparison
of those adic constructions with the classical ones here, and the adic
comparisons of the properness predicates of §6.3. Part III owns coherence and Kiehl's theorems on
the carriers built here, reading its classical rigid statements through
Part II R1's rigid–adic equivalence, which rests on §8.3: the coherent-module
theory and Kiehl's gluing theorem (R3.1–R3.3), the Banach-module
prerequisites of Kiehl's theorem (R3.3 *surjection-small-perturbation*; R3.6
*completely-continuous-map*, *strictly-completely-continuous-closed-target*,
*completely-continuous-finite-cokernel* and
*restriction-strictly-completely-continuous*), quasi-Stein spaces with
Theorems A and B (R3.4), Kiehl's almost noetherianity of presentation rings
(R3.6 *almost-noetherian-integral-affinoid-modules*, which consumes §2.3's
presentation-ring integrality), faithfully flat complete extension of the
ground field for affinoid algebras and their finite modules (R3.6
*affinoid-completed-field-extension*), Kiehl's proper mapping theorem with its
base changes, principal filtrations and formal functions (R3.6
*kiehl-proper-mapping-theorem*, *proper-affinoid-cohomology-finite*,
*proper-cohomology-affinoid-subdomain*,
*proper-coherent-cohomology-field-extension*,
*proper-cohomology-finite-flat-base-change* and
*proper-cohomology-adic-completion*), and proper GAGA (R3.7
*analytification-coherent*, *proper-gaga* and *proper-gaga-coherent-equivalence*).

Section ids of this roadmap whose content is Part III's, old → new:

- §1.3, complete field extension of affinoid algebras and finite modules →
  AdicSpacesPartIII R3.6 *affinoid-completed-field-extension*; §1.3 keeps
  affinoid pushouts and the affinoid algebra `A⊗̂_K L` over `L`.
- §7.1, Banach prerequisites for Kiehl's theorem → AdicSpacesPartIII R3.3
  *surjection-small-perturbation* and the four R3.6 targets above.
- §7.3, coherence and quasi-Stein spaces → AdicSpacesPartIII R3.2–R3.4;
  §7.3 keeps the identity principle.
- §7.4, proper mapping and base change → AdicSpacesPartIII R3.6
  *kiehl-proper-mapping-theorem*, *proper-affinoid-cohomology-finite*,
  *proper-cohomology-affinoid-subdomain*,
  *proper-coherent-cohomology-field-extension* and
  *proper-cohomology-finite-flat-base-change*.
- §7.5, principal filtrations and formal functions → AdicSpacesPartIII R3.6
  *proper-cohomology-adic-completion*.
- §8.4, proper GAGA → AdicSpacesPartIII R3.7 *analytification-coherent*,
  *proper-gaga* and *proper-gaga-coherent-equivalence*.

Formal models, Raynaud's theorem, admissible blow-ups, Berkovich spaces,
dagger geometry, eigenvariety gluing, automorphic forms and curve
uniformisation are outside this roadmap. Dagger algebras, weak completion,
étale and pro-étale geometry and their site comparisons belong to
AdicSpacesPartIV and AdicEtaleGeometry; the comparison of the numerical slope
predicate of §7.2 with geometric slope criteria belongs to
LocallyAnalyticDistributions §4.16. Part IV and LocallyAnalyticDistributions
consume this roadmap and supply nothing to it.

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

## Exact supplier contracts

| Supplier | Interface used here | Boundary |
| --- | --- | --- |
| Tau Ceti at the pin: `TauCeti/RingTheory/Affinoid/`, `TauCeti/AlgebraicGeometry/Rigid/Affinoid/`, `TauCeti/Topology/GTopology/`, `TauCeti/Analysis/Normed/Field/WeaklyStable.lean`, `TauCeti/RingTheory/MvPowerSeries/TateAlgebra/`, `TauCeti/RingTheory/RegularLocalRing/`, `TauCeti/RingTheory/UniversallyCatenary.lean`, `TauCeti/RingTheory/Huber/`, `TauCeti/AlgebraicGeometry/AdicSpace/Spa/MaximalIdealPoint.lean`, `TauCeti/RingTheory/Japanese.lean`, `TauCeti/Analysis/Normed/Operator/SlopeDecomposition.lean` | The affinoid predicate `TauCeti.IsAffinoidAlgebra`, the supremum seminorm `TauCeti.supSeminorm` and the Layer 0–4 theorems cited by their pinned names below; weak stability of complete and perfect fields and the Gauss-normed fraction field; regularity of Tate algebras, the G-ring and universal-catenarity predicates and the regular locus; closedness of ideals and completed tensor products of Huber rings; affinoid subdomains and rational domains, their presheaf of coordinate algebras and the weak affinoid site; the Japanese-ring predicate; the classical points of `Spa(A,A°)`; G-topologies, their sites, site points with neighbourhood stalks and their slightly finer enhancements; the numerical slope predicates, decompositions and projector of §7.2 | Consumed by name where the text cites them; the remaining targets of Layers 0–4, weak stability of the Gauss fraction field, finiteness of normalisation and excellence of affinoid algebras, the Banach function algebra theorem, the sheaf condition of Layer 5, constructible density and everything else after Layer 5 are this roadmap's |
| [RestrictedPowerSeries](../RestrictedPowerSeries/README.md) §§0.1, 1.1, 2.1–2.2, 2.4, 3.3, Layers 4–5 and §6.2 | Native restricted series over Banach rings, Gauss norms, evaluation and substitution, maximum modulus, reduction, Weierstrass theory, distinguished charts, Rückert theory, closed ideals and finite Tate modules; positive-polyradius algebra; normed and completed comparisons | Those constructions and proofs are not repeated here. Weak stability of the Gauss fraction field, general affinoids and the converse strict-radius criterion are below |
| [PadicFunctionalAnalysis](../PadicFunctionalAnalysis/README.md) §1.2, Layer 1 and §2.4 | Open mapping and closed graph, finite-module topology, countable type and strict exactness of completed scalar extension | General Banach-module analysis stays there |
| [SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md) §§0.20–0.21 | Japanese/Nagata ring vocabulary, permanence criteria, excellence and algebraic completion criteria | Apply the shared algebraic criteria; the Japanese predicate is the pinned `TauCeti.Ring.IsJapanese` |
| [AdicSpaces](../../Completed/AdicSpaces/README.md) Layers 1–5 | Huber pairs, `Spv` and `Spa`, rational localisation, Tate acyclicity for rational covers of `Spa(A,A°)`, gluing and morphisms locally of finite type | The foundational adic theory is consumed, not repeated |

### From Mathlib

Mathlib supplies restricted-series predicates and Gauss norms
(`MvPowerSeries.IsRestricted`, `MvPowerSeries.gaussNorm`), polynomial and
fraction-ring algebra (`FractionRing`, `integralClosure`, `IsIntegral`),
noetherian and Jacobson rings (`IsNoetherianRing`, `IsJacobsonRing`), maximal
spectra (`MaximalSpectrum`), heights and Krull dimension (`Ideal.height`,
`ringKrullDim`), the spectral norm on finite extensions (`spectralNorm`),
normed quotients, finite-dimensional topology, topological nilpotence
(`IsTopologicallyNilpotent`), flat modules and localisations (`Module.Flat`,
`IsLocalization`), tensor products and finite-type algebras
(`Algebra.FiniteType`), adic completion (`AdicCompletion`), the constructible
topology of a topological space (`constructibleTopology`, generated by the
open compact sets and their complements), schemes with their finite-type
morphisms (`AlgebraicGeometry.Scheme`,
`AlgebraicGeometry.LocallyOfFiniteType`), and categorical sites and sheaves
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
`TauCeti/RingTheory/MvPowerSeries/TateAlgebra/` supplies the Gauss-normed
fraction field `TauCeti.MvPowerSeries.GaussFractionField` (Mathlib's fraction
field of the native Tate algebra with the extended Gauss norm, not completed)
and regularity of Tate algebras at maximal ideals
(`TauCeti.MvPowerSeries.isRegularLocalRing_localization_atPrime_of_isMaximal_isRestricted_subring`).
`TauCeti/RingTheory/RegularLocalRing/` supplies the G-ring predicate
`TauCeti.Excellence.IsGRing` (noetherian, with geometrically regular formal
fibres at every prime, Stacks Definition 15.51.1) and the regular locus
`TauCeti.Excellence.regularLocus` (the primes with regular localisation, not
asserted open). `TauCeti/RingTheory/UniversallyCatenary.lean` supplies
`TauCeti.Excellence.IsUniversallyCatenary` (noetherian, with every algebra of
finite type catenary, Stacks Definition 10.105.3).

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
subdomains (`TauCeti.IsAffinoidSubdomainMap`) and rational domains
(`TauCeti.rationalDomain`) with flatness, inverse images,
intersections, kernels, standard rational covers, transitivity and
infinitesimal neighbourhoods, density and completion of rational fractions,
the supremum bound from a monic equation, the kernel and injectivity theorems
for reduction maps, the identification of complete ultrametric normed
affinoid algebras with the algebras topologically of finite type over `K`, and
the classical-point test for numerical slopes. `TauCeti/RingTheory/Huber/`
supplies closedness of every ideal of an algebra topologically of finite type
(`TauCeti.Huber.IsTopologicallyFiniteType.isClosed_ideal`), the completed
tensor product of Huber rings `TauCeti.Huber.CompletedTensor` and its base
change of restricted series
(`TauCeti.Huber.CompletedTensor.weightedRestrictedEquiv`).
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
site points (`TauCeti.GTopology.point`) whose fibers are the neighbourhood
stalks (`TauCeti.GTopology.nhdsColimitIso`), stalk maps, bases, the slightly finer
relation, the finest slightly finer G-topology with its universal property,
and the extension of sheaves along a slightly finer G-topology.

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

§§0.1 and 1.1: restricted series over Banach rings, the complete
multiplicative Gauss norm and polynomial density; §§2.1–2.2: bounded
evaluation and substitution; §2.4: maximum modulus at a
finite-residue-field point; §3.3: coefficient reduction `T̃ₙ≃K̃[X₁,…,Xₙ]`;
Layer 4: Weierstrass division and preparation over Banach rings; §5.1:
Weierstrass polynomials and distinguished charts; §5.2: noetherianity,
factoriality, integral closedness, the Jacobson property, `dim Tₙ=n`, finite
maximal residue fields and polynomial generation of maximal ideals; §5.3:
closed ideals, least-norm representatives and strictness for finite Tate
modules; §5.4: weighted Tate algebras, their multiplicative norm and the
finite monomial extension; §6.2: normed and completed comparisons.

### From TauCetiRoadmap.PadicFunctionalAnalysis

§1.2: open mapping and closed graph; Layer 1: the finite-module topology;
§2.4: complete countable-type Banach spaces, strict splitting and strict
exactness of completed scalar extension `L⊗̂_K(−)`.

### From TauCetiRoadmap.SchemeAndStackFoundations

§0.20: Japanese and Nagata rings and their permanence criteria; §0.21:
excellent rings, G-rings, J-2 rings and the completion criteria for
reducedness and normality.

### From TauCetiRoadmap.AdicSpaces

Layers 1–2: `Spv`, `Spa`, rational subsets and pro-constructible subspaces;
§3.1: rational localisation of a Huber pair; Layer 4: Tate acyclicity for
rational covers of `Spa(A,A°)`; Layer 5: gluing and morphisms locally of
finite type.

## How to read the build

Layer 0 imports the Tate package and proves weak stability of the Gauss
fraction field and finiteness of normalisation. Layer 1 consumes the pinned
affinoid algebra (presentations, topology, normalisation, dimension) and adds
excellence, tensor products, fraction algebras and the strict-radius
identification. Layer 2 consumes the pinned supremum seminorm and proves the
Banach function algebra theorem, the reduction functor and the
presentation-ring theory. Layer 3 constructs classical affinoid spaces and
Layer 4 their subdomains, rational covers (with the Gerritzen–Grauert
theorem) and local rings (with their excellence), on the pinned
carriers; Layer 5 proves Tate acyclicity, the sheaf condition of the weak
affinoid site, and the Čech comparisons for modules; Layer 6 builds general
G-topologies, rigid spaces and the classical properness predicates; Layer 7
records the numerical slope interface and proves the identity principle;
Layer 8 constructs analytification, proves constructible density of classical
points and constructs the rigid–adic comparison. Each layer ends with its
examples and its dependencies; a `*Needs:*` line lists what each target's
statement and route use.

## Layer 0: shared Tate inputs and weak stability

### 0.1 The imported Tate package

Use RestrictedPowerSeries §1.1 for the complete multiplicative Gauss norm
and polynomial density, §3.3 for coefficient reduction
`T̃ₙ≃K̃[X₁,…,Xₙ]`, §§2.1–2.2 for bounded evaluation and substitution, and
§2.4 for maximum modulus at a finite-residue-field point. Its Weierstrass
polynomials are monic of Gauss norm one; nonleading coefficients may have
norm one. Consume division and preparation (Layer 4), simultaneous
distinguished charts (§5.1) and the finite free quotient on
`1,X,…,X^(s−1)` for degree `s`.

The same supplier owns noetherianity, factoriality, integral closedness,
the Jacobson property, `dim Tₙ=n`, finite maximal residue fields and
polynomial generation of maximal ideals (§5.2), and least-norm
representatives for Tate ideals and strictness for finite Tate modules
(§5.3). The last property is specific input; nearest points are not assumed
to exist in every Banach subspace.
*Needs:* RestrictedPowerSeries §§1.1, 2.1–2.2, 2.4 and 3.3 (Gauss norm,
polynomial density, evaluation, maximum modulus, reduction), Layer 4 and
§5.1 (Weierstrass theory and distinguished charts), §§5.2–5.3
(noetherianity, dimension, closed ideals and strictness for finite Tate
modules); Mathlib
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
criterion and the comparison of finite-extension norms. The complete
countable-type Banach-space results are PadicFunctionalAnalysis §2.4's. The
bounded-functional separation and weakly Cartesian results for the
possibly incomplete Gauss fraction field are targets here, following [BGR]
2.3.2/7 and §§3.5.1–3.5.3; they are not obtained by dropping the completeness
hypothesis of a Banach-space theorem.

The fraction field `Frac(Tₙ)` with the extended Gauss norm, not completed,
is the pinned `TauCeti.MvPowerSeries.GaussFractionField`. Prove that it is
weakly stable in every characteristic (`isWeaklyStable_gaussFractionField`),
using [BGR] 5.3.1/1 and 3.5.3/1–2. In characteristic zero the field is
perfect and this is the pinned perfect case; in characteristic `p` the field
is imperfect and incomplete, and the statement is a target. Apply the
Japanese-ring criteria of SchemeAndStackFoundations §0.20 to prove that the
integral closure of `Tₙ` in every finite extension of its fraction field is
finite, that is, `Tₙ` is `TauCeti.Ring.IsJapanese`. The inseparable step uses
[BGR] 4.1/3–4 and 4.4/2 and is part of the theorem. Neither separability nor
a discrete valuation may replace that step. §1.2 extends this to every
affinoid domain.
*Needs:* §0.1 (noetherianity, factoriality and integral closedness of `Tₙ`,
from RestrictedPowerSeries §5.2); Tau Ceti `TauCeti.IsWeaklyStable`,
`TauCeti.MvPowerSeries.GaussFractionField`,
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

RestrictedPowerSeries §§1.1, 2.1–2.2, 2.4, 3.3, Layer 4 and §§5.1–5.3;
PadicFunctionalAnalysis §2.4; SchemeAndStackFoundations §0.20; Tau Ceti weak
stability, the Gauss-normed fraction field and the Japanese predicate;
Mathlib restricted series, Gauss norms, integral closure and fraction fields.
Nothing of Layers 1–8 is used.

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
`TauCeti.IsAffinoidAlgebra.isJacobsonRing`. Every ideal of an affinoid
algebra is closed for every complete ultrametric algebra norm: such an
algebra is topologically of finite type over `K` (the pinned
`TauCeti.IsAffinoidAlgebra.isTopologicallyFiniteType`), and every ideal of an
algebra topologically of finite type over `K` is closed (the pinned
`TauCeti.Huber.IsTopologicallyFiniteType.isClosed_ideal`). For an affinoid `A` with a
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
pinned `TauCeti.IsAffinoidAlgebra.continuous_algHom`. Its algebraic inputs
include finite-dimensionality of `A/𝔪^n` for `n≥1` and
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
Tate modules); RestrictedPowerSeries §§0.1 and 1.1 (restricted series over
Banach rings), Layer 4 (Weierstrass theory over Banach rings) and §§5.2–5.3;
PadicFunctionalAnalysis §1.2 (open mapping and closed
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

Prove that affinoid algebras are excellent in every characteristic: Kiehl's
theorem, whose proof [Conrad] §1.1 (pp. 3–5) explains. Universal catenarity
is pinned under `TauCeti/RingTheory/Affinoid/UniversallyCatenary.lean`. The
two remaining halves are headlines: every affinoid algebra `A` is a G-ring,
`TauCeti.Excellence.IsGRing A` (`isGRing_of_isAffinoidAlgebra`), and for
every `A`-algebra `B` of finite type the regular locus
`TauCeti.Excellence.regularLocus B` is open in `Spec B`
(`isOpen_regularLocus_of_finiteType`, the J-2 property). Following [Conrad]
§1.1 (p. 3), it suffices to treat Tate algebras and to prove two inputs: the
regular locus of every affinoid domain `A` contains a nonempty open subset
of `Spec A`, and the localisations of Tate algebras at maximal ideals have
geometrically regular formal fibres. Regularity of Tate algebras at maximal
ideals is the pinned instance
`TauCeti.MvPowerSeries.isRegularLocalRing_localization_atPrime_of_isMaximal_isRestricted_subring`.
Include the differential-rank regularity criterion of [Conrad] Theorem 1.1.1
used in positive characteristic; finiteness of the imperfection degree
`[K:K^p]` is not assumed. General excellent-ring permanence stays in
SchemeAndStackFoundations.
*Needs:* §1.2's normalisation; SchemeAndStackFoundations §0.21 (excellent
rings, G-rings, J-2 rings and their permanence); Tau Ceti universal
catenarity, `TauCeti.Excellence.IsGRing`, `TauCeti.Excellence.regularLocus`
and the regularity of Tate algebras; [Conrad] §1.1 and Theorem 1.1.1;
Mathlib `Algebra.FiniteType`.

**Checks.**

- `A=K`: a field is a G-ring, and every finite-type `K`-algebra has open
  regular locus; this is the zero-variable case of both halves.
- For every affinoid domain the generic point `(0)` lies in the regular
  locus, since the localisation there is a field; so a target asserting only
  that the regular locus is nonempty holds vacuously, and the open-subset form
  is what J-2 needs.
- For the cusp `K⟨X,Y⟩/(Y²−X³)` the regular locus is the complement of the
  maximal ideal `(X,Y)`: at the origin the maximal ideal needs two generators
  in a local ring of dimension one, while away from it the Jacobian
  `(−3X², 2Y)` does not vanish on the curve in any characteristic. The
  complement of a closed point is open, as J-2 requires.
- `K⟨T⟩×K` is not a domain and is still a G-ring: the G-ring statement is
  made for every affinoid algebra.

### 1.3 Tensor products and complete field extension

For `B=A⟨X⟩/I`, `C=A⟨Y⟩/J`, the affinoid pushout `A⟨X,Y⟩/(I,J)` is the
pinned `TauCeti.AffinoidPushout`, with its continuous universal property,
its quotient law and its identification with the completed tensor product
`TauCeti.Huber.CompletedTensor` under `TauCeti/RingTheory/Affinoid/Pushout/`.
Prove presentation independence, density of the algebraic tensor image and
preservation of surjections. Density alone is not the completion theorem.

For a complete isometric extension `L/K`, set `A_L=A⊗̂_K L`, the pinned
completed tensor product `TauCeti.Huber.CompletedTensor` of `A` and `L` over
`K`. The identification `Tₙ(K)⊗̂_K L ≃ Tₙ(L)`, coefficientwise on the left
factor and the structure map on the right, is the pinned
`TauCeti.Huber.CompletedTensor.weightedRestrictedEquiv` at unit weights.
Prove that a presentation `π:Tₙ(K)↠A` with kernel `I` induces a surjection
`Tₙ(L)↠A_L` with kernel `I·Tₙ(L)`, so that `A_L` is an affinoid `L`-algebra,
compatibly with affinoid homomorphisms and with repeated field extension. No
algebraicity or spherical completeness of `L/K` is assumed. Source: [BGR]
6.1.1.
*Needs:* §1.1 (`A⟨X⟩`, presentations, quotient topologies and closed
ideals); PadicFunctionalAnalysis §2.4 (strict exactness of `L⊗̂_K(−)` on
countable-type spaces); Tau Ceti `TauCeti.AffinoidPushout`,
`TauCeti.Huber.CompletedTensor` and
`TauCeti.Huber.CompletedTensor.weightedRestrictedEquiv`; Mathlib
`TensorProduct`.

**Checks.**

- `K⟨X⟩⊗̂_K K⟨Y⟩=K⟨X,Y⟩`, while the algebraic tensor product is a proper
  dense subring: `Σ ϖⁿXⁿYⁿ` is not a finite sum of pure tensors, its
  coefficient matrix `(ϖⁿδ_{nm})` having infinite rank. A construction
  stopping at density misses it.
- `B⊗̂_A A=B` and `B⊗̂_A 0=0`; the surjection `K⟨X⟩↠K`, `X↦0`, tensored
  with `K⟨Y⟩` gives the surjection `K⟨X,Y⟩↠K⟨Y⟩`.
- `L=K` gives `A_K=A`; for `A=K` it gives `L` with its norm.
- Over `ℚ_p`, `A=ℚ_p⟨T⟩/(T²−p)` is a field, while for `L=ℚ_p(√p)` the
  algebra `A_L=L⟨T⟩/(T−√p)(T+√p)` is `L×L`, the two factors being coprime
  because `2√p` is a unit of `L`: field extension does not preserve being a
  domain, so `A_L` is not computed as a field compositum.

### 1.4 Fraction algebras

The rational and Laurent fraction algebras, the invertibility of `g`, the
power-bounded ratios and their universal properties in terms of classical
points are pinned under `TauCeti/RingTheory/Affinoid/` (`RationalFraction.lean`,
`LaurentFraction.lean`, `Subdomain/Rational.lean`, `Subdomain/Laurent.lean`).
When `g,f₁,…,fₘ` generate the unit ideal, density of `A[g⁻¹]` in `A⟨f/g⟩`
is the pinned `TauCeti.RationalFraction.denseRange_awayLift`, and the
identification of `A⟨f/g⟩` with the completion of `A[g⁻¹]` for its Huber
topology, which is the rational localisation of the Huber pair of AdicSpaces
§3.1, is the pinned `TauCeti.RationalFraction.completionLocEquiv`: a
homeomorphic ring isomorphism equal to the structure map on `A` and sending
`fᵢ/g` to `fᵢ/g`. Construct Weierstrass fractions and the iterated
presentations. Construct the quotient seminorm on `A[g⁻¹]` induced by the
residue norm of `A⟨f/g⟩` and prove that its separated completion is
`A⟨f/g⟩` isometrically; the compared norms are specified before an isometry
is asserted. Sources: [BGR] 6.1.4–6.1.5, 7.2.
*Needs:* §1.1 (`A⟨X⟩`, its continuous universal property and quotient
topologies); §1.3 (affinoid pushouts); the pinned rational and Laurent
fractions, `TauCeti.RationalFraction.denseRange_awayLift` and
`TauCeti.RationalFraction.completionLocEquiv`; AdicSpaces §3.1 (rational
localisation of a Huber pair); Mathlib `IsLocalization`.

**Checks.**

- One-variable Weierstrass and Laurent presentations of the disc
  `|T|≤|ϖ|` and the annulus `|ϖ|≤|T|≤1`.
- Denominator one with numerators of supremum at most one gives back `A`:
  for `|fᵢ|sup≤1` the domain `{|fᵢ|≤1}` is all of `Sp A`. Without that bound
  it does not: on `A=K⟨T⟩`, `f=T/ϖ` gives `A⟨S⟩/(S−T/ϖ)≅K⟨S⟩` through
  `T=ϖS`, the disc `|T|≤|ϖ|`. The zero algebra gives zero.
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

Layer 0; RestrictedPowerSeries §§0.1, 1.1, Layer 4 and §§5.2–5.4;
PadicFunctionalAnalysis §1.2, Layer 1 and §2.4; SchemeAndStackFoundations
§§0.20–0.21; AdicSpaces §3.1; the pinned affinoid algebra under
`TauCeti/RingTheory/Affinoid/`, the Tate regularity, G-ring and regular-locus
interfaces and the Huber completed tensor product; the forward direction of
§1.5 uses §2.2. AdicSpacesPartII and AdicSpacesPartIII consume this layer.

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
preserve them (`TauCeti.IsAffinoidAlgebra.supSeminorm_map_of_isIntegral`).
For a monic equation `f^d+Σ_{i<d} aᵢf^i=0` the bound
`|f|sup≤max_{i<d}|aᵢ|sup^(1/(d−i))` is the pinned
`TauCeti.IsAffinoidAlgebra.supSeminorm_le_iSup_coeff_rpow_of_eval_eq_zero`.
Retain the equality for a minimal monic equation for an integral
torsion-free algebra monomorphism from an integrally closed domain, as in [BGR] 3.8.1/7, including a non-domain
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
algebra with a complete ultrametric algebra norm prove `‖f‖≤C|f|sup` for
some `C>0`
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
does not suffice. Sources: [BGR] 3.8, 6.2.1–6.2.4.
*Needs:* §2.1; §1.2 (normalisation, minimal primes); §0.2 (weak stability
of `Frac(Tₙ)` and finite normalisation); §1.1 (automatic continuity,
equivalence of complete norms); the pinned names of this section; Tau Ceti
`TauCeti.Huber.powerBoundedSubring` and `topologicallyNilpotentIdeal`;
Mathlib `IsTopologicallyNilpotent`.

**Checks.**

- A nonzero nilpotent in `K⟨T⟩/(T²)` has supremum zero while its quotient
  norm is one: reducedness in the Banach function algebra theorem cannot be
  dropped.
- For `0<|c|<1`, prove that the annulus algebra `K⟨X,Y⟩/(XY−c)` is a domain
  and has `|X|sup=|Y|sup=1`, `|XY|sup=|c|`. The domain assertion and norm
  computations are separate checks.
- On `K×K`, `(1,0)` attains its supremum one only at the classical point
  where the second factor is killed and vanishes at the other: the maximum
  is attained, but the maximum locus of a nonzero element of a general
  affinoid need not be Zariski dense.
- Check the zero algebra separately in every power formula.

### 2.3 Reduction functor and presentation rings

The reduction map `φ̃:Ã→B̃` of an affinoid homomorphism, with its identity and
composition laws, its kernel and the equivalence of injectivity on reductions
with preservation of the supremum seminorm, is pinned under
`TauCeti/RingTheory/Affinoid/Reduction.lean`. The radical statements of
[BGR] 6.3.1/4–5 for a strict homomorphism are the pinned
`AlgHom.comap_ker_reductionMap_eq_radical`,
`AlgHom.ker_reductionMap_eq_radical_map` and
`AlgHom.injective_reductionMap_iff_ker_le_nilradical`, and the injectivity
half of [BGR] 6.3.1/6 is the pinned
`AlgHom.injective_of_injective_reductionMap` (reduced source). Prove the
strictness half of 6.3.1/6: for reduced source, a homomorphism injective on
reductions is strict, so that injective strictness, supremum isometry and
injectivity on reductions are equivalent; the route is §2.2's Banach
function algebra theorem on the source. Here strictness means that the map
from the quotient by the kernel to its image is a homeomorphism, using the
induced topology on the image. Supremum isometry is a consequence, not a claim that the
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

**Reduced quotient of a ring of definition.** For an open bounded subring `B⊆A`
and `ϖ∈B` which is topologically nilpotent and left regular in `A`, for
instance a topologically nilpotent unit of `A`, if `B/ϖB` is reduced then
`B=A°={f:|f|sup≤1}`: the pinned
`TauCeti.IsAffinoidAlgebra.mem_iff_supSeminorm_le_one_of_isReduced_quotient`.
It combines the pinned Huber-ring criterion
`TauCeti.Huber.isPowerBounded_iff_mem_of_isReduced_quotient` (in any
topological ring, under the same hypotheses on `B` and `ϖ`, the power-bounded
elements are exactly the elements of `B`) with §2.2's supremum
identification. [FK] Chapter 0, Appendix B, Proposition B.1.3(1) (p. 236 of
arXiv v5, stated there without proof) supplies only the boundedness step of
that criterion: `f` is power-bounded iff `B[f]` is again a ring of
definition. The reduced-quotient argument is not in [FK]. The element `ϖ`
need not be a scalar. Part II R0.9 consumes this theorem. The sufficient
hypothesis is not asserted to be necessary.
*Needs:* §2.2 (`A°`, `A°°` and the supremum theorems); §1.1 (presentations
and quotient norms); §1.2 (finite maps and residue fields); the pinned
reduction maps, presentation-ring integrality and reduced-quotient criterion;
Tau Ceti `Subring.unitClosedBall`; [FK] B.1.3(1); Mathlib `IsIntegral`,
`integralClosure` and `Ideal.Quotient.mk`. AdicSpacesPartII R0.9 and
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

Layers 0–1; the pinned supremum
seminorm, power-bounded and topologically nilpotent characterisations,
reduction maps and presentation-ring integrality; [FK] B.1.3(1); Mathlib
spectral norms, integral closure and quotients. AdicSpacesPartII R0.9 and
AdicSpacesPartIII R3.6 consume this layer.

## Layer 3: affinoid spaces

### 3.1 Affinoid spaces, closed subspaces and fibre products

Classical `Sp A=MaximalSpectrum A`, the poset `TauCeti.AffinoidSubdomain` of
its affinoid subdomains, their presheaf of coordinate algebras
`TauCeti.AffinoidSubdomain.presheaf` and the weak affinoid G-topology
`TauCeti.AffinoidSubdomain.weakGTopology` are pinned under
`TauCeti/AlgebraicGeometry/Rigid/Affinoid/`; Layer 5 proves the sheaf
condition (`isSheaf_affinoidSubdomain_presheaf`). These are the classical
inputs consumed by Part II R0.9 and R1. Construct closed subspaces,
connected components, finite morphisms and affinoid fibre products
`Sp B×_{Sp A}Sp C=Sp(B⊗̂_A C)`, whose coordinate rings are the affinoid
pushouts of §1.3. Identify classical points with maximal ideals and global
sections with `A`. Retain nonreduced structure sheaves. Sources: [BGR] Chapter 7.
*Needs:* §§1.1–1.3 (presentations, finite maps, affinoid pushouts); §1.2
(maximal ideals and finite residue fields); the pinned
`TauCeti.AffinoidSubdomain`, `TauCeti.AffinoidSubdomain.presheaf` and
`TauCeti.AffinoidSubdomain.weakGTopology`; Mathlib `MaximalSpectrum` and
`Ideal.Quotient.mk`.

**Checks.**

- Empty subdomains and zero rings: `Sp 0` is empty, and it is the only
  affinoid space with an empty cover.
- Products with a nilpotent thickening: `Sp K⟨T⟩/(T²)` has the classical
  points of a point and a two-dimensional coordinate ring; a space recording
  only its points loses the thickening.
- `Sp K⟨X⟩×_{Sp K}Sp K⟨Y⟩=Sp K⟨X,Y⟩`, the closed bidisc, whose coordinate
  ring is the completed and not the algebraic tensor product.
- `Sp(K⟨T⟩×K)` has two connected components, the disc and a point, cut out
  by the idempotents `(1,0)` and `(0,1)`.

### Examples

The nilpotent thickening `Sp K⟨T⟩/(T²)` has the same classical points as a
point and a two-dimensional coordinate ring; the empty subdomain is `Sp 0`;
the closed bidisc is the fibre product of two discs over `Sp K`.

### Dependencies

Layers 1–2; the pinned affinoid subdomains and weak affinoid site; Mathlib
maximal spectra and quotients. AdicSpacesPartII R0.9 and R1 consume this
layer.

## Layer 4: affinoid subdomains, local rings and covers

### 4.1 Affinoid subdomains and rational covers

An affinoid subdomain is the pinned `TauCeti.IsAffinoidSubdomainMap`: a
representing algebra, map and universal property, with uniqueness of the
representing map, intersections, inverse images, flatness of restrictions
and the rational and Laurent cases pinned under
`TauCeti/RingTheory/Affinoid/Subdomain/`. Transitivity is the pinned
`TauCeti.IsAffinoidSubdomainMap.comp`: if `φ:A→B` represents `U⊆Sp A` and
`φ':B→C` represents `V⊆Sp B`, then `φ'∘φ` represents the image of `V` in
`Sp A`. Identify Weierstrass subdomains with §1.4. Include open, closed,
locally closed and Runge immersions of affinoid spaces, and the structure
theorem for locally closed immersions ([Bosch] §4.2, Theorem 10).

Prove the Gerritzen–Grauert theorem (`exists_eq_iUnion_rationalDomain`): for
an affinoid algebra `A`, every affinoid subdomain `U⊆Sp A` is a finite union
`U=R(f₁/g₁)∪…∪R(fₙ/gₙ)` of rational domains, the pinned
`TauCeti.rationalDomain` `R(f/g)={x : g(x)≠0, |fⱼ(x)|≤|g(x)| for every j}`,
where for each `i` the elements `gᵢ,fᵢ₁,…,fᵢₘᵢ` generate the unit ideal, so
that each `R(fᵢ/gᵢ)` is itself an affinoid subdomain (the pinned
`TauCeti.RationalFraction.isAffinoidSubdomainMap`). Prove it in the
stronger form that AdicSpacesPartII R1 *gerritzen-grauert* consumes: `Sp A`
has a finite cover by rational domains `Xᵢ` such that each `U∩Xᵢ` is a
Weierstrass domain in `Xᵢ`, hence a rational domain of `Xᵢ` and so of `Sp A`
([Bosch] §3.3, Theorem 20, p. 60, proved in §4.2 as Corollary 12, p. 77;
[BGR] 7.3.5/3). The route is the structure theorem for locally closed
immersions of affinoid spaces, which covers `Sp A` by rational domains on
which the immersion is Runge, and Weierstrass on them when it is open
([Bosch] §4.2, Theorem 10 and Corollary 11, p. 76), with transitivity of
rational domains ([Bosch] §3.3, Proposition 17). The empty subdomain is the
empty union, and
`Sp A` is the single domain with `g=1` and no numerators. Deduce the
ambient-cover refinement used in Layer 5 and in descent: every finite cover of
`Sp A` by affinoid subdomains is refined by the standard rational cover
`{|gⱼ|≤|gᵢ|≠0 for every j}` of some tuple `(g₀,…,gᵣ)` generating the unit
ideal ([Bosch] §4.3, Lemma 4, p. 84). The converse fails: a finite union of
affinoid subdomains, even of Weierstrass domains, need not be an affinoid
subdomain ([Bosch] §3.3, the remark after Theorem 20). Sources: [BGR]
Chapter 7; [Bosch] §§3.3 and 4.2–4.3.
*Needs:* §§1.1–1.4 (algebras, tensor products and fraction algebras); §2.2
(supremum norms for the rational-domain conditions and the maximum
modulus); Layer 3; for Gerritzen–Grauert, Weierstrass and Runge immersions
and the structure theorem for locally closed immersions, which are targets of
this section; the pinned `TauCeti.IsAffinoidSubdomainMap`,
`TauCeti.IsAffinoidSubdomainMap.comp`, `TauCeti.rationalDomain`,
`TauCeti.RationalFraction.isAffinoidSubdomainMap` and the subdomain theorems
under `TauCeti/RingTheory/Affinoid/Subdomain/`; Mathlib `Module.Flat` and
`Ideal.span`.

**Checks.**

- A rational cover of the unit disc by `|T|≤|ϖ|` and `|ϖ|≤|T|≤1`, whose
  intersection is the circle `|T|=|ϖ|`.
- For a tuple `(g₀,…,gₘ)` generating the unit ideal, the standard rational
  domains `{|gⱼ|≤|gᵢ|≠0 for every j}` cover; conversely such a cover forces
  the unit-ideal condition, since otherwise a maximal ideal containing every
  `gⱼ` is a point at which all of them vanish, and it lies in no domain.
- Arbitrary rational domains do not cover merely because their denominators
  generate the unit ideal: with denominator one, `{|ϖ⁻¹|≤1}` is empty.
- The origin of the unit disc is not an affinoid subdomain. A representing
  algebra `A'` would have one classical point, so it would be finite over `K`
  with nilpotent image `t` of `T`, say `t^N=0`; then the map
  `K⟨T⟩→K[T]/(T^(N+1))`, whose only classical point is the origin, could not
  factor through `A'`, because `T^N≠0` there. A definition of subdomains as
  sets of points, without the universal property, accepts it. The single
  point of `Sp K`, by contrast, is an affinoid subdomain of `Sp K`.
- Gerritzen–Grauert on the unit disc: the annulus `|ϖ|≤|T|≤1` is the single
  rational domain `R(ϖ/T)`, the pair `(T,ϖ)` generating the unit ideal
  because `ϖ` is a unit, and the disc `|T|≤|ϖ|` is `R(T/ϖ)`. The empty
  subdomain needs no domain at all; a version demanding at least one domain
  must use an empty one, such as the pinned
  `TauCeti.rationalDomain_one_algebraMap_eq_empty` `{|ϖ⁻¹|≤1}=∅`.
- The unit-ideal condition carries the content. With `g=T` and no numerators
  the set `{T(x)≠0}` is the punctured disc `{0<|T|≤1}`. It is no finite union
  of affinoid subdomains: on an affinoid subdomain `V` inside it `T` vanishes
  nowhere, hence is a unit of `𝒪(V)`, and the supremum of `|T⁻¹|` on `V` gives
  `|T|≥ε>0` on `V`, so finitely many of them miss `T=ϖᴺ` for large `N`.
  Dropping the condition would let such sets count as rational domains.

### 4.2 Local rings and infinitesimal neighbourhoods

For an affinoid subdomain `U` represented by `φ:A→B` and `x∈U`, the
isomorphisms `A/𝔪ₓⁿ≃B/𝔪ₓⁿB`, for every `n`, are the pinned
`TauCeti.IsAffinoidSubdomainMap.quotientPowAlgEquiv`. The stalk
`𝒪_{Sp A,x}` is the fiber of the pinned presheaf
`TauCeti.AffinoidSubdomain.presheaf` at the pinned site point
`TauCeti.GTopology.point` of `x` for the weak affinoid G-topology, Mathlib's
`CategoryTheory.GrothendieckTopology.Point.presheafFiber`: the colimit of
`𝒪(U)` over the affinoid subdomains `U∋x`, as the pinned
`TauCeti.GTopology.nhdsColimitIso` identifies it. Prove that it is a local
ring whose maximal ideal consists of the germs vanishing at `x`, the
local-ring comparison `A_𝔪/𝔪ⁿ≃𝒪_{Sp A,x}/𝔪ₓⁿ` for every `n` and its
completion `Â_𝔪≃𝒪̂_{Sp A,x}`; these stalk statements are proved after Layer 5
establishes the sheaf condition. The germ map `A_𝔪→𝒪_{Sp A,x}` is local and
faithfully flat. Prove that the analytic local rings are excellent
(`excellent_stalk`, [Conrad] Theorem 1.1.3, p. 4): `𝒪_{Sp A,x}` is a G-ring
(`TauCeti.Excellence.IsGRing`, which includes noetherianity), universally
catenary (`TauCeti.Excellence.IsUniversallyCatenary`), and every algebra of
finite type over it has open regular locus; these are the conditions that
define an excellent ring. The route passes to the completion `Â_𝔪`, which
the stalk shares with `A_𝔪`, and uses §1.2's excellence of `A`. The headline
takes `K` and `A` in one universe, where Mathlib's colimits of commutative
`K`-algebras live. Sources: [BGR] Chapter 7; [Conrad] §1.1 and
Theorem 1.1.3.
*Needs:* §1.2 (excellence of affinoid algebras); §4.1; Layer 5 (the sheaf
condition, used only for the stalk statements); SchemeAndStackFoundations
§0.21 (excellence permanence and completion criteria); the pinned
`TauCeti.IsAffinoidSubdomainMap.quotientPowAlgEquiv`,
`TauCeti.AffinoidSubdomain.presheaf`, `TauCeti.AffinoidSubdomain.weakGTopology`,
`TauCeti.GTopology.point`, `TauCeti.GTopology.nhdsColimitIso`,
`TauCeti.Excellence.IsGRing`, `TauCeti.Excellence.IsUniversallyCatenary` and
`TauCeti.Excellence.regularLocus`; Mathlib
`CategoryTheory.GrothendieckTopology.Point.presheafFiber`, `IsLocalization`,
`IsLocalHom` and `AdicCompletion`.

**Checks.**

- For `A=K⟨T⟩` and `𝔪=(T)`, `A_𝔪/𝔪ⁿ` is `K[T]/(Tⁿ)` and the completion is
  `K⟦T⟧`; for `n=0` both quotients are the zero ring.
- For `A=K` the only affinoid subdomain containing the point is `Sp K`, so the
  stalk is `K`, a field, and the three excellence conditions hold trivially.
- At the origin of the cusp `K⟨X,Y⟩/(Y²−X³)` the stalk is a one-dimensional
  local domain which is not regular (its maximal ideal needs two generators);
  its regular locus is the generic point alone, the complement of the closed
  point and so open. Excellence asserts openness of regular loci, not
  regularity of the stalk.
- The stalk at the origin is strictly larger than `A_𝔪`: the series
  `Σₙ ϖ^(−n)T^(n!)` converges on every disc `|T|≤r` with `r<1`, but its
  Gauss norms on `|T|=r` are unbounded as `r→1`; it is not `g/h` with
  `g,h∈K⟨T⟩`, since `h` times it would then be the bounded series `g` on
  `|T|<1`. A definition of the stalk as `A_𝔪` misses it.
- For the subdomain `|T|≤|ϖ|` of the unit disc and `x` the origin,
  `K⟨T⟩/(T)ⁿ≃K⟨T/ϖ⟩/(T)ⁿ`, both `K[T]/(Tⁿ)`; the subdomain `|T|=1` misses
  the origin and gives no such comparison.

### 4.3 Covers, flatness and reducedness

For a domain `A`, restriction to a nonempty affinoid subdomain is injective,
and for a finite affinoid cover `(Uᵢ)`, `A→∏ᵢ𝒪(Uᵢ)` is faithfully flat;
both are pinned under `TauCeti/RingTheory/Affinoid/Subdomain/`. Prove that
reducedness is local for a rational cover: `A` is reduced iff every member
algebra is reduced. The reverse implication uses faithful flatness; the
forward implication uses the comparison of completed local rings in §4.2 and
the excellence of §1.2, not just flatness of an arbitrary ring map. This
supplies Part IV R5.7. Sources: [BGR] Chapters 7–8.
*Needs:* §4.1; §4.2 (completed local rings); §1.2 (excellence); the pinned
subdomain flatness theorems; Mathlib `Module.FaithfullyFlat` and
`IsReduced`.

**Checks.**

- For the cover of the unit disc by `|T|≤|ϖ|` and `|ϖ|≤|T|≤1`,
  `K⟨T⟩→K⟨T/ϖ⟩×K⟨ϖ/T⟩` is faithfully flat; the single member
  `K⟨T⟩→K⟨T/ϖ⟩` is flat but not faithfully flat, since the maximal ideal
  `(T−1)` generates the unit ideal there, `1−T` being a unit where
  `|T|≤|ϖ|`.
- Without the domain hypothesis restriction need not be injective: on
  `Sp(K⟨T⟩×K)`, restriction to the disc component kills `(0,1)`.
- `K⟨T⟩/(T²)` is nonreduced, and so is its restriction to every subdomain
  containing the origin, while its restriction to the subdomain `|T|=1`,
  which is empty, is the zero ring: reducedness is tested on a cover, not on
  one member.

### Examples

The unit disc `Sp K⟨T⟩` is covered by the rational domains `|T|≤|ϖ|` and
`|ϖ|≤|T|≤1`, whose intersection is the circle `|T|=|ϖ|`. For `A=K⟨T⟩` and
`𝔪=(T)`, `A_𝔪/𝔪ⁿ` is `K[T]/(Tⁿ)`, the quotient of the analytic local ring
at the origin by the `n`th power of its maximal ideal. The origin of the
disc is not an affinoid subdomain, while the whole of `Sp K` is. The two
members of the cover are the rational domains `R(T/ϖ)` and `R(ϖ/T)`, as
Gerritzen–Grauert requires of every affinoid subdomain; the stalk of the cusp
at its origin is an excellent local domain which is not regular.

### Dependencies

Layers 1–3; Layer 5 for the stalk statements of §4.2;
SchemeAndStackFoundations §0.21; the pinned affinoid subdomains, their
transitivity, infinitesimal neighbourhoods and rational domains, the pinned
site points of the weak affinoid G-topology and the G-ring,
universal-catenarity and regular-locus predicates; Mathlib site-point fibers,
flatness, localisation and adic completion; [Bosch] §§3.3 and 4.2–4.3;
[Conrad] Theorem 1.1.3. AdicSpacesPartII R0.9 and R1,
AdicSpacesPartIII and AdicSpacesPartIV R5.7 consume this layer.

## Layer 5: Čech comparison and acyclicity

### 5.1 Tate acyclicity and the sheaf condition

Prove classical Tate acyclicity using the rational-localisation comparison
with foundational AdicSpaces and the affinoid-cover refinement of Layer 4.
Compare the finite-intersection algebras, restriction maps and augmented
Čech complexes. In degree zero this is the sheaf condition of the pinned
weak affinoid site: the presheaf `TauCeti.AffinoidSubdomain.presheaf` of
coordinate algebras is a sheaf for the Grothendieck topology of
`TauCeti.AffinoidSubdomain.weakGTopology` (`isSheaf_affinoidSubdomain_presheaf`,
[BGR] 8.2.1/1). For the two-piece Laurent cover use
`d(u,v)=v|intersection−u|intersection`. Transport Tate acyclicity and
refinement through this chain map. Sources: [BGR] 8.2; Tate's theorem as
recorded in [Kiehl-AB] §1 (p. 258), whose Hilfssatz 1.3 reduces covers to
Laurent covers.
*Needs:* Layer 4 (rational covers, the Gerritzen–Grauert refinement, flat
restrictions); §1.4 (rational localisations and their identification with
AdicSpaces §3.1); AdicSpaces Layer 4 (Tate acyclicity for rational covers of
`Spa(A,A°)`); the pinned `TauCeti.AffinoidSubdomain.weakGTopology`,
`TauCeti.AffinoidSubdomain.presheaf`, `TauCeti.GTopology.grothendieckTopology`
and `TauCeti.GTopology.isSheaf_iff`; Mathlib
`CategoryTheory.Presheaf.IsSheaf`.

**Checks.**

- The Laurent sequence `0→K⟨T⟩→K⟨T/ϖ⟩×K⟨ϖ/T⟩→K⟨T/ϖ,ϖ/T⟩→0` with
  `d(u,v)=v−u` on the circle is exact; a sign convention `u−v` changes the
  differential but not exactness, and the augmentation is the diagonal.
- A one-member identity cover gives the complex `0→A→A→0`, exact.
- For `A=0` the empty cover of `Sp 0` is admissible and the sheaf condition
  forces the coordinate algebra of the empty subdomain to be the zero ring.

### 5.2 Čech complexes of modules and derived cohomology

Retain augmented Čech exactness for **every algebraic `A`-module**, by
tensoring the bounded exact alternating Čech complex for `A` with the
module. Its terms are flat by affinoid-localisation flatness; bounded
exactness then makes this tensoring exact. Intersection algebras are
completed affinoid tensor products, not automatically ordinary algebraic
tensor products. For finite modules, supply the canonical Banach topologies
and strict exactness as a separate theorem. Construct the natural
Čech-to-derived-cohomology comparison for covers whose finite intersections
are acyclic, using native sheaf categories. No arbitrary module receives a
fictitious Banach norm. Sources: [BGR] 8.2.
*Needs:* §5.1; Layer 4 (flat restrictions); PadicFunctionalAnalysis Layer 1
(strictness for finite modules); Mathlib `Module.Flat`,
`HomologicalComplex` and sheaf cohomology.

**Checks.**

- Zero modules and an infinitely generated direct sum of copies of `A` keep
  exactness; the strict version is asserted only for finite modules.
- Verify both the augmentation and differential under the comparison.
  Exactness alone does not certify closed images.
- For the one-member cover `{Sp A}` the Čech-to-derived comparison is the
  identity on global sections in degree zero, and both sides vanish in
  positive degrees.

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
R1 and AdicSpacesPartIII R3.1 consume the acyclicity theorem and the
Čech-to-derived comparison.

## Layer 6: general G-topologies and rigid gluing

### 6.1 G-sites and sheaves

Admissible opens and covers with [BGR] 9.1's identity, restriction,
intersection and composition axioms, continuous maps, induced G-topologies,
their site on the preorder of admissible opens
(`TauCeti.GTopology.grothendieckTopology`), the identification of the sheaf
condition with the admissible-cover equaliser condition
(`TauCeti.GTopology.isSheaf_iff`), the ordinary open-set site of a
topological space, the G0–G2 conditions, pasting of §9.1.3 and the slightly
finer relation are pinned under `TauCeti/Topology/GTopology/`. So are the
basis property of the admissible opens
(`TauCeti.GTopology.isTopologicalBasis_range`), the enhancement of [BGR]
9.1.2, namely the finest slightly finer G-topology
`TauCeti.GTopology.finestSlightlyFiner`, which satisfies (G0)–(G2)
(`TauCeti.GTopology.saturated_finestSlightlyFiner`), with its universal
property (`TauCeti.GTopology.SlightlyFiner.exists_continuousMap_finestSlightlyFiner`),
and the extension of sheaves across a slightly finer G-topology by the
dense-subsite comparison of [BGR] 9.2.3/1
(`TauCeti.GTopology.SlightlyFiner.isDenseSubsite` and
`TauCeti.GTopology.SlightlyFiner.sheafEquiv`), without another category of
sheaves.

Use Mathlib's sheaves and sheafification. Compare classical neighbourhood
stalks with site points, and BGR's plus construction with that
sheafification.
*Needs:* the pinned G-topologies, sites, enhancements and
`TauCeti.GTopology.isSheaf_iff`;
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
extension `X↦X_L` by gluing the affinoids `Sp(A_L)` of §1.3, compatibly with
affinoid subdomains and gluing. Carry the quasi-separated hypothesis in these
global base-extension statements. Sources: [BGR] §9.3 (weak and
strong G-topologies on affinoids, rigid analytic varieties, gluing and fibre
products; the complete field extension of quasi-separated spaces is its
9.3.6, as [Conrad] §3.1 records); [Bosch] §5.3; [Conrad] §3.1.
*Needs:* §6.1; Layers 3–4 (affinoid subdomains and finite affinoid covers);
Layer 5 (acyclicity, for the structure sheaf); §1.3 (the affinoid algebras
`A_L` over `L`); Mathlib locally ringed spaces and sites.

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

Define Kiehl properness as [Kiehl-E] Definition 2.3 and [Bosch] §6.3,
Definition 8 do: `f:X→Y` is proper if it is separated and there is an
admissible affinoid covering `(Yⱼ)` of `Y` such that each `f⁻¹(Yⱼ)` has two
finite admissible affinoid covers `(Uⱼᵢ)` and `(Vⱼᵢ)` with `Vⱼᵢ⋐_{Yⱼ}Uⱼᵢ`.
Prove that properness is local on the base (a morphism is proper when its
restrictions over the members of an admissible covering of the base are),
the base-change law ([Bosch] §6.3, Lemma 7) and properness of finite
morphisms. Prove the inner-cover form over every affinoid: for Kiehl-proper
`f` and every admissible affinoid open `Y'⊆Y`, `f⁻¹(Y')` itself has two
finite affinoid covers with the inner relation over `Y'`. Base change gives
such covers only over the members of some covering of `Y'`, and inner
relations over the members do not glue to one over `Y'`. Prove the
composition law: a composite of Kiehl-proper morphisms is Kiehl-proper. It
does not follow from the inner-cover definition alone. For discretely valued
`K` both are proved through formal models ([Lütkebohmert] Lemma 2.6 and
Theorem 3.1, whose proof over an affine formal base produces the inner
covers, and Corollary 3.2 for the composition law, under that paper's
standing complete discrete valuation ring); for general `K` both are proved
through the comparison of Kiehl properness with Berkovich properness of
Hausdorff strictly analytic spaces, which is local on the base and over an
affinoid base is the inner-cover condition, and the interior formula
([Temkin] Corollaries 4.5–4.6). Formal models and Berkovich spaces are
outside this roadmap, so those routes are inputs these two theorems need
from outside it, not constructions here. These classical predicates are
supplied to Part II's properness comparison and Part III's Kiehl theorems;
adic properness is not their definition. Sources: [Bosch] §6.3; [Kiehl-E]
§2; [Lütkebohmert] Lemma 2.6, Theorem 3.1 and Corollary 3.2 (discretely
valued `K`); [Temkin] Corollaries 4.5–4.6 (general `K`, through the
comparison with Berkovich properness).
*Needs:* §6.2 (rigid spaces, fibre products, affinoid covers); §2.2
(supremum norms of generator restrictions); §1.1 (presentations); Layers
3–4 (closed immersions and the relative polydisc); for the inner-cover form
over every affinoid and the composition law, [Lütkebohmert] Lemma 2.6,
Theorem 3.1 and Corollary 3.2 or [Temkin] Corollaries 4.5–4.6 as inputs from
outside this roadmap.

**Checks.**

- A smaller closed disc is inner in the unit disc, whereas the unit disc is
  not inner in itself over `K`: the generators of a witnessing presentation
  would all have supremum below one, so by §2.3 `K̃[T]` would be integral
  over a subfield of `K̃`, which `T` is not.
- The punctured disc `{0<|T|≤1}` over `Sp K` is not quasi-compact: it is
  covered admissibly by the annuli `|ϖ|ⁿ≤|T|≤1`, and no finitely many of
  them cover it, the first `N` missing the point `T=ϖ^(N+1)`. A definition
  testing only that every point has an affinoid neighbourhood accepts it.
- Two closed unit discs glued along the open unit disc `|T|<1` are not
  quasi-separated: the intersection of the two affinoid discs is the open
  disc, which is not quasi-compact.
- `ℙ¹` is separated: the two chart discs meet in the circle `|T|=1`, and
  `K⟨T⟩⊗̂_K K⟨S⟩→K⟨T,T⁻¹⟩`, `S↦T⁻¹`, is surjective. Two closed unit discs
  glued along the punctured disc `0<|T|≤1` are not separated: the diagonal
  is not a closed immersion, since in the chart `D₁×D₂`, the closed
  bidisc, the Zariski closure of the diagonal image `{(t,t):0<|t|≤1}` of
  the punctured disc contains the pair of origins, which is not on the
  diagonal.
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

## Layer 7: numerical slopes and the identity principle

### 7.2 Numerical slopes as a shared analysis interface

The classical module-level interfaces on which LocallyAnalyticDistributions
§4.16 builds its finite-slope theory are the pinned `Polynomial.IsSlopeLE`,
`ContinuousLinearMap.IsSlopeDecomposition` and
`ContinuousLinearMap.IsSlopeDecomposition.exists_projection`, on native
polynomials, submodules, continuous linear maps and finite projective
modules. For `r>0`, the affinoid root condition on `Q∈A[X]` is that every
root of `χ(Q)` has absolute value **at least** `r`, for every algebra map
`χ:A→L` with `L/K` algebraic, using the unique extended absolute value.
Include `r>0` in the predicate. For affinoid `A`, the equivalence with
testing in finite extensions, over all finite residue fields and their finite
splitting extensions, is the pinned
`TauCeti.IsAffinoidAlgebra.isSlopeLE_iff_splittingField`. A decomposition is
continuously split and
operator-stable; its first summand is finite projective and annihilated
by a monic such `Q` with unit constant term. Every polynomial satisfying
the same conditions acts invertibly on the complementary summand. Its
continuous projector has the specified image and kernel and commutes with
the operator. It is the continuous complementary-submodule projection,
independent of Fredholm theory and of Riesz projectors built from a
resolvent and a Fredholm determinant. Existence at every cutoff over an
arbitrary affinoid family is not asserted.

For `r=|p|^h` this means eigenvalue valuation `≤h`, including equality.
It concerns annihilator roots; the roots of `det(1−TU)` are reciprocals.
The comparison of this classical root test with the geometric slope test
on a separated Fredholm factor, the numerical normalisation, functoriality
and uniqueness belong to LocallyAnalyticDistributions §4.16, which uses
§2's supremum theorem. Its coefficient test for monic `Q=ΣaⱼXʲ` with unit
`a₀` is `|aⱼ/a₀|sup rʲ≤1` for every `j`; that comparison is not reproved
here. Source: [Urban] 2.3.1 (p. 1706) defines `≤h`-slope decompositions only
for vector spaces over a finite extension `L/ℚ_p`, with a finite-dimensional
first summand, and proves their functoriality and uniqueness in Lemma 2.3.2
and Corollary 2.3.3. The predicates over an affinoid, or any normed, base
algebra, with a finite projective first summand and an annihilating
polynomial in place of the characteristic polynomial, are the pinned
Tau Ceti generalisation. Over a field the two polynomial conditions agree by
Cayley–Hamilton and the minimal polynomial, so for `A=K` a finite extension
of `ℚ_p`, `r=|p|^h` and a continuously split decomposition the pinned
predicate is Urban's.
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

### 7.3 The identity principle

An analytic subset of a rigid space `X` is a subset which, on each member
`Sp A` of some admissible affinoid covering of `X`, is the zero set of an
ideal of `A`. Prove the identity principle: on a connected normal rigid
space `X`, the only analytic subset containing a nonempty admissible open
`U` is `X` itself, and `X` is not a union of two proper analytic subsets.
Consequently restriction to `U` is injective on functions and on sections of
finite locally free modules. Do not assert this for arbitrary sheaves
supported away from `U`, or omit normality. The route reduces to a connected
affinoid domain, where all analytic local rings have the same dimension by
the height formula of §1.2, and uses normality of the local rings to show
that an analytic subset of full dimension meeting a connected affinoid
contains it. Part II R1.9 consumes this principle. Source: [Conrad]
Lemma 2.1.4 (pp. 12–13), with Lemma 2.1.5.
*Needs:* §6.2 (rigid spaces, admissible coverings and connectedness);
Layer 4 (affinoid subdomains, the analytic local rings and their
normality); §1.2 (the height formula
`TauCeti.IsAffinoidAlgebra.height_eq_ringKrullDim_of_isDomain`); Mathlib
`IsIntegrallyClosed` and `ringKrullDim`.

**Checks.**

- On the closed unit disc a function vanishing on the smaller disc
  `|T|≤|ϖ|` is zero, since a nonzero Tate series has finitely many zeros.
- The skyscraper sheaf at the origin, with stalk `K`, has nonzero global
  sections restricting to zero on the admissible open `|T|=1`, so the
  principle is not asserted beyond finite locally free modules.
- The union of the coordinate axes `Sp K⟨X,Y⟩/(XY)` is connected but not
  normal, and the nonzero function `Y` vanishes on the nonempty Zariski-open
  admissible subset `X≠0`, the `X`-axis without the origin: normality cannot
  be dropped.
- `Sp(K⟨T⟩×K)` is normal but not connected, and `(0,1)` vanishes on the
  disc component: connectedness cannot be dropped.

### Examples

For `c∈K×` with `|c|=r` and `U=c·id` on a finite projective Banach
module, `M₁=M`, `M₂=0`, annihilated by `X−c`; for `U=0`, `M₁=0`. On the
closed unit disc a function vanishing on the disc `|T|≤|ϖ|` vanishes
identically, whereas on the union of the coordinate axes `Y` vanishes on the
`X`-axis without the origin.

### Dependencies

Layers 1–6; the pinned slope predicates and the height formula; Mathlib
polynomials, projective modules and continuous linear maps; [Conrad];
[Urban] §2.3. LocallyAnalyticDistributions §4.16 consumes §7.2, and
AdicSpacesPartII R1.9 consumes §7.3.

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
flat local comparison gives exact pullback.

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
`AlgebraicGeometry.Scheme`, `AlgebraicGeometry.LocallyOfFiniteType`,
`IsReduced` and `IsIntegrallyClosed`.

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
Prove its equality with the constructible closure of the classical points
([Huber-CV] Theorem 4.1, p. 472); deduce their density in `Spa(A,A°)` for
Mathlib's `constructibleTopology` (`dense_range_maximalSpectrumToSpa`,
[Huber-CV] Corollary 4.2, p. 473). Deduce that constructible subsets are
determined by their classical traces: two constructible subsets with the
same classical points are equal ([Huber-CV] Corollary 4.3, p. 473). Prove
the finite rational-cover criterion through this comparison. Part II R1.7
consumes these statements as *classical-points-constructible-density*.
Sources: [Huber-CV] Theorem 4.1 and Corollaries 4.2–4.3.
*Needs:* §2.2 (`A°` and `A°°`); the pinned classical points of
`Spa(A,A°)` and the topologically-finite-type identification
`TauCeti.IsAffinoidAlgebra.isTopologicallyFiniteType`; AdicSpaces Layers
1–2 (`Spv`, `Spa`, rational subsets, pro-constructible subspaces); Mathlib
`constructibleTopology`; [Huber-CV] §4.

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
finite type. Prove `r(X)` affinoid iff `X` affinoid. Part II R1.7 consumes
`r` and these statements. Source: [Huber-FR] Proposition 4.5.
*Needs:* §8.2 (classical points and constructible density); §6.2 (rigid
spaces, gluing and the structure sheaf); Layer 5 (acyclicity, for the ringed
topos comparison); AdicSpaces Layers 3–5 (structure presheaf, gluing, locally
finite type morphisms); [Huber-FR] §4.

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

### Examples

The analytification of the affine line is the union of the discs `|T|≤|ϖ|⁻ⁿ`
and has global functions the entire series, so GAGA fails for it; `ℙ¹`
analytifies to the glued pair of unit discs with `H⁰(𝒪)=K`. In characteristic
not two, the origin of `y²=x²(x+1)` has an algebraic local domain and an
analytic germ with two branches `y=±x√(1+x)`. In `Spa(K⟨T⟩,K°⟨T⟩)` the
Gauss point is not classical, and a rank-two point just below it lies
outside the adic open `⋃_n{|T|^n≤|ϖ|}` of the rigid open disc; every
nonempty constructible subset nevertheless contains a classical point.

### Dependencies

Layers 1–7; AdicSpaces Layers 1–5; SchemeAndStackFoundations §0.21; the
pinned classical points of `Spa(A,A°)`; Mathlib schemes and the
constructible topology; [Conrad] §1 and Appendix A; [Conrad-RA] Example
2.2.11; [Huber-CV]; [Huber-FR]. AdicSpacesPartII R1 and AdicSpacesPartIII
consume this layer.

## Dependency order and completion

1. Import the shared Tate and Banach foundations; prove characteristic-free
   weak stability of the Gauss fraction field and its Japanese application.
2. Consume the pinned affinoid normalisation, topology and supremum
   theorems, including the polyradius criterion, independently of geometry;
   prove excellence, then the Banach function algebra theorem and the
   integral theory.
3. Construct affinoid spaces, subdomains and their local rings, and prove
   Tate acyclicity. General G-site theory is independent of this step.
4. Construct the G-site and rigid category, the classical properness
   predicates and the identity principle, then rigid analytification,
   constructible density of classical points and the rigid–adic functor,
   using the foundational adic results of AdicSpaces only.
5. Prove the elementary numerical decomposition and projection of §7.2
   independently; LocallyAnalyticDistributions §4.16 builds its geometric
   and Fredholm-window comparisons on them, and AdicSpacesPartII,
   AdicSpacesPartIII and AdicSpacesPartIV build on the rest.

Completion requires all stated generalities, all canonical-map compatibility
theorems and every check above. There must be one production definition of
each shared series, operator, tensor and geometric object. Compile the
actual modules and audit the transitive axioms of their capstone theorems;
only `propext`, `Classical.choice` and `Quot.sound` are accepted. An
elaborating roadmap prototype is not a proof or an implementation milestone.

## Downstream consumers

- AdicSpacesPartII R0.9 and R1 (R1.1, R1.7 and R1.9) consume
  `TauCeti.IsAffinoidAlgebra`, the affinoid norm and reduction theorems, the
  closed-embedding theorem of §1.1, the affinoid space `Sp A` of Layer 3 and
  its subdomains of Layer 4, classical Tate acyclicity of Layer 5, the rigid
  category and the properness predicates of §§6.2–6.3, rigid analytification
  of §8.1, constructible density of classical points of §8.2
  (*classical-points-constructible-density*), the identity principle of
  §7.3 and the rigid–adic functor of §8.3. R0.9 transports the algebraic
  predicate to its topological presentation; the R1 names refer to these
  objects, not to independent definitions.
- AdicSpacesPartIII R3.1–R3.7 consume classical affinoid acyclicity and the
  Čech-to-derived comparison of Layer 5, the presentation-ring integrality
  of §2.3 (for its *almost-noetherian-integral-affinoid-modules*), the
  affinoid algebras `A_L` of §1.3, the local-ring comparisons of Layer 4 and
  §8.1, the rigid category and properness predicates of §§6.2–6.3 and the
  rigid–adic functor of §8.3; the coherence, Kiehl, formal-functions and
  GAGA targets listed under **Scope and ownership** are theirs.
- AdicSpacesPartIV F1.1 and R5.7, with its dagger-algebra targets, consume
  strict-polyradius affinoidness (§1.5), affinoid excellence (§1.2), the
  supremum theorems of §§2.1–2.2, fraction algebras (§1.4) and
  rational-local reducedness (§4.3), read through AdicSpacesPartII's
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
  especially §3.3 (Theorem 20) and §§4.2–4.3 (Theorem 10, Corollaries 11–12,
  Lemma 4) for the Gerritzen–Grauert theorem and rational refinements, and
  §6.3 (Definitions 6 and 8, Lemma 7) for relative compactness and properness.
  Locators use the published numbering, not that of the earlier Münster
  preprint.
- **[Kiehl-AB]** R. Kiehl, *Theorem A und Theorem B in der
  nichtarchimedischen Funktionentheorie*, Invent. Math. 2 (1967), 256–273.
  [Journal volume](https://gdz.sub.uni-goettingen.de/id/PPN356556735_0002).
- **[Kiehl-E]** R. Kiehl, *Der Endlichkeitssatz für eigentliche Abbildungen
  in der nichtarchimedischen Funktionentheorie*, Invent. Math. 2 (1967),
  191–214, §2 (Definitions 2.1–2.3).
  [Journal volume](https://gdz.sub.uni-goettingen.de/id/PPN356556735_0002).
- **[Conrad]** B. Conrad, *Irreducible components of rigid spaces*,
  Ann. Inst. Fourier 49 (1999), 473–541, especially §1.1 with Theorems
  1.1.1 and 1.1.3, Lemma 2.1.4, Lemma 2.1.5, §3.1 and Appendix A.
  [Author text](https://virtualmath1.stanford.edu/~conrad/papers/irredpaper.pdf).
- **[Conrad-RA]** B. Conrad, *Relative ampleness in rigid geometry*,
  Ann. Inst. Fourier 56 (2006), 1049–1126, Example 2.2.11 (relative
  analytification over an affinoid base),
  [doi:10.5802/aif.2207](https://doi.org/10.5802/aif.2207).
- **[Lütkebohmert]** W. Lütkebohmert, *Formal-algebraic and rigid-analytic
  geometry*, Math. Ann. 286 (1990), 341–371, Lemma 2.6, Theorem 3.1 and
  Corollary 3.2.
  [GDZ digitisation of the volume](https://gdz.sub.uni-goettingen.de/id/PPN235181684_0286).
- **[Temkin]** M. Temkin, *On local properties of non-Archimedean analytic
  spaces*, Math. Ann. 318 (2000), 585–607, Corollaries 4.5–4.6,
  [doi:10.1007/s002080000123](https://doi.org/10.1007/s002080000123).
- **[Huber-CV]** R. Huber, *Continuous valuations*, Math. Z. 212 (1993),
  455–477, §4 (Theorem 4.1, Corollaries 4.2–4.3).
  [GDZ digitisation of the volume](https://gdz.sub.uni-goettingen.de/id/PPN266833020_0212).
- **[Huber-FR]** R. Huber, *A generalization of formal schemes and rigid
  analytic varieties*, Math. Z. 217 (1994), 513–551, §4.
  [GDZ digitisation of the volume](https://gdz.sub.uni-goettingen.de/id/PPN266833020_0217).
- **[FK]** K. Fujiwara, F. Kato, *Foundations of Rigid Geometry I*,
  Chapter 0, Appendix B, Proposition B.1.3(1), p. 236 of arXiv v5.
  [arXiv:1308.4734v5](https://arxiv.org/abs/1308.4734v5).
- **[Urban]** E. Urban, *Eigenvarieties for reductive groups*, Ann. of Math.
  174 (2011), 1685–1784, §2.3: slope decompositions and polynomial tests.
  [Journal article](https://doi.org/10.4007/annals.2011.174.3.7).

## Existing Lean work

The [WilliamCoram/PhD sources][PhDSources], pinned to
`eefb3d91f34b27d0bc7822140fa85fecae029884`, are secondary implementation
references, not the specification or build dependencies. Audit their
hypotheses and transitive axioms; a stronger target is not discharged by a
narrower source theorem.

| Source under `PhD/TauCeti/Code/RigidAnalyticGeometry/` | Interface to compare |
| --- | --- |
| `WeaklyStable.lean`, `Japanese.lean` | Valued fraction fields and finite normalisation in §0.2; retain positive characteristic |
| `Affinoid/{Basic,Continuity,Noether,Fractions,Tensor,BaseChange,Extend}.lean` | Presentations, topology, normalisation and tensor comparisons |
| `SupSeminorm/`, `Affinoid/{SupSeminorm,FunctionAlgebra,PowerBounded}.lean` | Spectral values and Banach function algebras, including reduced non-domains |
| `Affinoid/{Reduction,ReductionFunctor}.lean` | Presentation integrality and canonical reduction maps |
| `Restricted/`, `TateAlgebra/` | Shared-series provenance owned by RestrictedPowerSeries |

[PhDSources]: https://github.com/WilliamCoram/PhD/tree/eefb3d91f34b27d0bc7822140fa85fecae029884
