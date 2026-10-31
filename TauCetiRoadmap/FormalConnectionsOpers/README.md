# Roadmap: formal algebraic connections, loop gauge groupoids and opers

**Summary.** Construct algebraic connections and their sheaf theory, formal loop gauge
prestacks, regular and punctured opers, Drinfeld–Sokolov reduction and its Poisson cotangent
algebroid, from the relative formal calculus of Laurent series over arbitrary commutative
coefficient algebras and the native Hopf-point functor of affine groups. The resulting objects
give a precise geometric parameter space for critical-level representation theory. Connections
are relative de Rham connections; an oper remembers a transverse Borel reduction. Isomorphisms
of the underlying connections form a groupoid over the oper space, the isomonodromy groupoid;
they are not a global action on oper normal forms. The end theorems are the universal property
of all-order principal parts over arbitrary commutative rings (Layer 2), the classification of
regular formal connections by their fibre at `t = 0` (Layer 2), the polynomial factorization of
formal loops of a connected reductive complex group over every commutative complex algebra
(Layer 3A), the Chevalley–Kostant slice and Drinfeld–Sokolov normal form (Layer 4), the
Frenkel–Zhu theorem that every flat bundle on the punctured formal disc for a connected
reductive complex group has an oper structure (Layer 6), the Drinfeld–Sokolov Poisson structure
with its Miura screening-kernel description (Layer 7) and the identification of the isomonodromy
Lie algebroid with the continuous cotangent algebroid of punctured opers (Layer 8). The roadmap
is this README; `Suggested.lean` states the headline theorems whose carriers exist at the pins.

## Scope and ownership

This roadmap owns the relative formal calculus over arbitrary coefficient algebras (Layer 1),
the all-order differential-operator and principal-parts theory over arbitrary commutative rings
and the algebraic connection comparisons (Layer 2), the fixed-model manifold realization of
smooth separated finite-type complex schemes with its tangent, toric, group and gauge comparisons
(§2.4), formal and polynomial loop groups with their gauge groupoids, quotient prestacks and the
polynomial/formal quotient comparison (Layers 3 and 3A), intrinsic opers, the lower
algebraic/analytic dictionary of `G(ℂ)`, the Chevalley–Kostant adapter and the Drinfeld–Sokolov
normal form (Layer 4), oper coordinates and function algebras (Layer 5), the oper-reduction
theorem over `ℂ((t))` with its proof lane (Layer 6), the Drinfeld–Sokolov Poisson structure and
the Miura comparison (Layer 7), and the isomonodromy groupoid with its differentiation (Layer 8).
The labels F1–F8 and F3A name the layers; consumers cite them by these labels. Every
construction includes morphisms, extensionality, identity and composition, base change with its
hypotheses, naturality, local restriction and explicit comparisons between its coordinate and
intrinsic descriptions.

- **CrystallineCohomology CR.1.3** owns the ordinary form connection over an arbitrary
  commutative base ring: the additive Leibniz carrier, base linearity, tensor symmetry, extension,
  curvature, horizontal morphisms, tensor, Hom/dual and base change. Layer 2 consumes it and owns
  the form/vector-field comparison with its finite-projectivity hypotheses, scheme gluing,
  continuous and formal extensions, differential operators, jets, Lie–Rinehart PBW and
  principal-group connections.
- **ComplexComparisonPartII C−1.1, C0.3–C0.4, C5.1–C5.2** owns the scheme analytification
  functor and its analytic ring sheaf, complex points, open and closed subspaces, fibre products,
  smooth charts, étale local isomorphisms and the separated/Hausdorff comparison, the coherent
  tensor pullback and finite locally free bundle dictionary, and the analytic
  differential-operator and connection dictionaries. §2.2 supplies the algebraic operators and
  all-order principal parts below that prefix; §2.4 realizes the smooth constant-dimensional
  restriction on fixed manifold models and owns the tangent, toric, group and gauge comparisons.
  No proper GAGA or global algebraization theorem is a prerequisite of any lane here.
- **ComplexKahlerGeometry K1, K3.0, K4** owns joint holomorphic inverse and implicit maps,
  regular-zero-set submanifolds, finite-dimensional Cauchy/analyticity, the holomorphic
  section/reconstruction comparison, connection carriers, curve flatness and the flat
  holomorphic/smooth/local-system equivalence, consuming ComplexManifolds Milestone 7's bundle
  mixin and cocycle gluing. §2.4 owns only the fixed-model and gauge comparison applications.
- **SmoothBundlesConnections B3–B5** owns smooth connections, flat bundles, holonomy and
  monodromy. **LieGroupoidsPoisson** owns finite-dimensional smooth groupoids and Poisson
  manifolds; this roadmap owns the algebraic Lie–Rinehart and ind-formal versions, in native
  Lie–Rinehart vocabulary.
- **ReductiveGroups Layers 0–9 and 6B** owns the Hopf/scheme/points dictionary, faithful closed
  representations, algebraic tangent and adjoint action, subgroups, quotients and components,
  tori and their lattices, solvable and unipotent groups, centres, derived groups, central
  isogenies and the characteristic-zero reductivity theorem, Borel/torus conjugacy, Levi and
  Bruhat structure, the classification of split reductive groups by root data, pinned Chevalley
  groups over `ℤ`, and the complex reductive coset-affineness theorem. §4.3 owns the
  ordered-root-product, complex-point generation and analytic matrix applications; Layer 6 owns
  the loop-Grassmannian reduction-locus application of 6B.
- **LieHighestWeight Layer 7** owns the Lie-algebra Chevalley restriction theorem over every
  algebraically closed characteristic-zero field, with the `Int(L)·H` density argument and the
  homogeneous-degree compatibility. §4.3 imports it and owns only the adapters: group invariants
  equal Lie-algebra invariants for connected groups in characteristic zero, the central-direction
  splitting for reductive `𝔤`, the rational descent of the pinned Chevalley model and the
  comparison with CharacteristicClasses C5.1's compact restriction through a compact real form.
  This roadmap proves no second restriction theorem.
- **CharacteristicClasses C5.1** owns the compact-group Chevalley restriction `I(G) ≃ Sym(𝔱*)^W`.
  §4.3's compact-form comparison identifies it with the algebraic restriction; it is a comparison
  target consumed by NilpotentOrbits, not an input to any theorem here.
- **LieGroups Layers 0, 6 and 7** owns the real Lie-group exponential map, maximal tori and the
  Weyl group of compact connected groups with the surjectivity of `lieExp`, and the complexification
  of compact groups with the existence of a compact real form of a complex reductive Lie group
  as a milestone. §4.3 owns the holomorphic exponential chart of `G(ℂ)`, the comparison of the
  complex Lie algebra with its realification and the identification of a compact maximal torus
  with an algebraic torus: these are targets here, with their hypotheses, not inputs.
- **FormalLaurentPuiseux L1–L3, L7** owns field-valued formal substitutions, the Laurent
  derivation, residue, continuous differentials and the procyclic absolute Galois group of
  `ℂ((t))`. Layer 1 constructs the relative `R`-algebra extensions; it does not infer them from
  field statements.
- **§6.2** owns the cyclic-vector theorem for finite-dimensional differential modules over a
  differential field of characteristic zero with nonzero derivation, since no roadmap earlier in
  the merge order states it, together with the `GL_n` flag/oper equivalence and the oper lattice
  estimates. The finite-ramification formal normal forms, slopes and ramified descent of
  differential modules over `F((t))` are PadicDifferentialEquationsAndRigidCohomology's
  (§RD.6.52a) and are not used here: the oper-reduction argument of §6.4 takes the leading
  coefficient of a connection at an order below its pole order, where it is zero.
- **SchemeAndStackFoundations §§1.1, 1.14–1.18** owns ordinary quasi-coherent fpqc module
  descent with its morphisms and coherence, groupoids, sheaf torsors, stackification and 2-fibre
  products. Layers 1–3 construct the completed Tate, loop and ind-formal extensions and the
  connection descent, which finite-presentation algebraic-stack theorems alone do not supply.
- **AffineLieAlgebras** owns the completed universal enveloping algebra, the completed centre and
  the Feigin–Frenkel isomorphism, including the comparison of its mode completion with §7.5's
  completion of the classical screening-kernel algebra. This roadmap consumes nothing from it:
  §7.5 constructs its completion explicitly, and Layer 7 is built independently of any
  quantum-centre theorem so that the two roadmaps have no dependency cycle.
- **KacMoody KM8A** owns the untwisted minimal derived affine group, its real-root/torus
  homomorphism to polynomial loops, its central kernel and the rotation/global-form comparison with
  the polynomial loop group of Layer 3A. This roadmap consumes nothing from it; Layer 3A
  constructs polynomial and formal functors, full-cocharacter quotients and positive orbits
  independently, and KacMoody consumes them.
- **GeometricRepresentationCategories R3–R5** consumes the exported contracts of §8.4; its
  categorical-lift conjectures are stated there, not here.
- General root classification, highest-weight representation theory, PBW and universal
  enveloping algebras stay with RootSystems, LieHighestWeight and their existing owners.

## Conventions

The ordinary form-connection carrier and the elementary all-order differential-operator and
principal-parts API of §§2.1–2.3 are over arbitrary commutative base rings, as specified there.
Work over a characteristic-zero field `k` for the remaining algebraic and formal calculus, over a
characteristic-zero field with split pinning for the adjoint semisimple Drinfeld–Sokolov
statements, and over `ℂ` for the general reductive oper-reduction theorem of Layer 6. The moduli
and Drinfeld–Sokolov constructions use every commutative `k`-algebra `R`, including nonreduced
algebras, rather than only field-valued points. Write `O_R = R[[t]]`, `F_R = R((t))`,
`D_R = Spf O_R` and `D_R× = Spec F_R`. The relative derivative kills `R`. Formal Laurent
coefficients use the `t`-adic linear topology, with `R` discrete. Function-algebra modules use the
pro-discrete and `!` tensor topologies of Layers 1 and 5; analytic comparisons use the ordinary
complex topology. Here `R` is a test algebra, not the topological algebra `Fun Op`. Layers 5–8 use
adjoint split semisimple `G`; Layers 4 and 6 retain general reductive intrinsic opers, and §4.4
describes their central-isogeny comparison. Continuous differentials are required: algebraic
Kähler differentials of `R((t))/R` alone are not the formal cotangent carrier.

Coordinate substitution is contravariant: `σ_φ(f) = f∘φ` and `σ_φ ∘ σ_ψ = σ_(ψ∘φ)` on the common
domain where both substitutions are defined, with `(ψ∘φ)(t) = ψ(φ(t))`; §1.2 pins this by a
two-term witness. Coefficientwise continuity and every domain and unit hypothesis are proved,
never assumed. The left gauge action is `gauge(g, A) = Ad(g)A − (dg)g⁻¹`, so that
`gauge(h, gauge(g, A)) = gauge(hg, A)`; its dictionary with the frame change of
ComplexKahlerGeometry K4 is pinned in §2.4. The cotangent Poisson bracket is fixed by
`[df, dg]_P = d{f, g}` and the Leibniz rule in each coefficient; the completed cotangent target
proves the differential, Jacobi and continuity laws rather than assuming a bracket field. The
invariant form `κ` of Layer 7 is `κ₀∨`, the invariant extension of the inverse of the original
Cartan form; in rank one it is the trace form with `κ(h, h) = 2`. Residue pairing identifies
`𝔤((t))dt` with the continuous dual of `𝔤((t))`; the canonical Hamiltonian anchor of `dH_x` is
`+∇_ad x = x' + [A, x]`, while the tangent labelled by a left gauge `x` is `−∇_ad x = [x, A] − x'`.
Both signs are recomputed in §§7.2 and 8.2. `G(ℂ)` always means the native Hopf-point carrier
`WithConv (H →ₐ[ℂ] ℂ)` with the topology and atlas of §4.3; `Aut(O)` means the group functor of
§1.2 of coordinate automorphisms preserving the chosen formal disc.

## Exact supplier contracts

### From Mathlib

- `Derivation`, `KaehlerDifferential`, `LieRinehartRing`, `LieRinehartAlgebra` with their `Hom`
  and `anchor`: derivations, Kähler differentials and Lie–Rinehart algebras in
  `Mathlib/Algebra/LieRinehartAlgebra/Defs.lean`. The Kähler carrier is algebraic; Layer 1 builds
  the continuous one.
- `LaurentSeries`, `PowerSeries`, `PowerSeries.derivative`, `HahnModule`, `HahnSeries.single`,
  `HahnSeries.ofPowerSeriesAlg` and `LaurentPolynomial.eval₂`: the coefficient rings of Layers 1
  and 3A. Under the pinned instances, `Algebra ℚ (LaurentSeries ℚ)` is found as
  `HahnSeries.powerSeriesAlgebra` (`Mathlib/RingTheory/HahnSeries/PowerSeries.lean`), which routes
  through `R[[t]]`; `Suggested.lean` selects the coefficientwise `HahnSeries.instAlgebra` by a local
  instance so that its coefficient maps are algebra maps for one fixed structure. The two are
  propositionally, not definitionally, equal.
- `ModuleCat`, `AlgebraicGeometry.Scheme.PresheafOfModules`, `CategoryTheory.Grpd`,
  `CategoryTheory.Pseudofunctor.IsPrestack`, native sites and descent: the categorical carriers
  of the sheaf and prestack constructions of Layers 2–3.
- `Matrix.GeneralLinearGroup`, `Matrix.GeneralLinearGroup.map`, `Matrix.linftyOpNormedRing`,
  `Matrix.linftyOpNormedAlgebra`: matrix groups, their coefficient maps and the real normed-algebra
  structure on matrices used in §2.4 and Layer 6.
- `GroupLieAlgebra`, `LeftInvariantDerivation`, `mlieBracket` (in
  `Mathlib/Geometry/Manifold/VectorField/`): the analytic Lie algebra of a Lie group and its
  bracket, used in §4.3. `LeftInvariantDerivation` is a real notion with finite-dimensional, smooth
  and identity-interior hypotheses; §4.3 applies it only to the realification.
- `RootPairing.flip`, `RootPairing.Base.flip`: duality of root pairings, for the dual group of
  §4.4 through ReductiveGroupsPartII.
- `Algebra.Smooth.exists_span_eq_top_isStandardSmooth`,
  `Algebra.IsSmoothAt.exists_isStandardEtale_mvPolynomial`: standard-smooth and standard-étale
  presentations with their finite-presentation and smoothness hypotheses, for the charts of §2.4.
- `MvPolynomial.eq_vanishingIdeal_singleton_of_isMaximal`,
  `MvPolynomial.isMaximal_iff_eq_vanishingIdeal_singleton`,
  `MvPolynomial.vanishingIdeal_zeroLocus_eq_radical`: the weak and strong Nullstellensatz over
  `ℂ`, for the complex-point statements of §2.4. The strong form needs the reduced hypothesis.
- `TopologicalSpace.secondCountableTopology_of_countable_cover`: second countability from a
  countable open cover of second-countable opens, for §2.4.
- `IsTopologicalGroup.exist_openSubgroup_sub_clopen_nhds_of_one`,
  `ProfiniteGrp.exist_openNormalSubgroup_sub_open_nhds_of_one`, `nhds_basis_clopen`: open subgroups
  inside clopen neighbourhoods of `1`, for the finite-monodromy classification of Layer 6.

### From Tau Ceti

- `TauCeti.HopfAlgebra.pointsFunctor` and `TauCeti.HopfAlgebra.points` with the point carrier
  `WithConv (H →ₐ[k] R)` in `TauCeti/Algebra/AlgebraicGroup/PointsFunctor.lean`,
  `TauCeti.AlgHom.mapValue` in `TauCeti/Algebra/AlgebraicGroup/FunctorOfPoints.lean`,
  `TauCeti.FiniteTypeCommHopfAlgCat` in `TauCeti/Algebra/AlgebraicGroup/FiniteType/CommHopfAlgCat.lean`
  and `TauCeti.reductiveCommHopfAlgProperty` in `TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean`:
  Hopf points with their convolution group law and post-composition maps; reductivity means
  smooth, geometrically connected, with no nontrivial connected normal smooth unipotent subgroup
  over the algebraic closure, so the hypothesis of `formalLoop_eq_polynomial_mul_positive` is
  "connected reductive".
- Counit-valued derivations `Derivation k H (TauCeti.Bialgebra.CounitAlgebra k H k)` and their
  convolution Lie bracket in `TauCeti.Algebra.AlgebraicGroup.Tangent.Lie.Basic`: the algebraic Lie
  algebra of §3.1 and §4.3. Algebraic-group base change and the native `ProjectiveGeneralLinear`
  group scheme.
- `TauCeti.chartedSpaceOfIsOpenEmbedding` and `TauCeti.isManifold_chartedSpaceOfIsOpenEmbedding`
  in `TauCeti/Geometry/Manifold/Gluing.lean`: the manifold structure glued from open embeddings,
  after the topology, open embeddings, cover and holomorphic local deck maps are proved (§2.4 and
  its §4.3 group application).
- `ContinuousMonoidHom.exists_mem_nhds_one_forall_le_ker` in
  `TauCeti/Analysis/Normed/Algebra/NoSmallSubgroups.lean`: a neighbourhood of `1` in a normed
  algebra's unit group containing no nontrivial subgroup, for Layer 6.
- `TauCeti.zHat`, `TauCeti.zHat.gen`, `TauCeti.zHat.hom_ext`, `TauCeti.zHat.lift`,
  `TauCeti.zHat.lift_gen`, `TauCeti.zHat.lift_unique`, `TauCeti.zHat.liftEquiv` in
  `TauCeti/Topology/Algebra/Group/Profinite/ZHat/Basic.lean`, and
  `TauCeti.zHat.cohomologicalDimensionAt_le_one` (for `p ≠ 0`),
  `TauCeti.zHat.cohomologicalDimensionAt_eq_one` (for prime `p`) and
  `TauCeti.zHat.cohomologicalDimension_eq_one` in
  `TauCeti/Topology/Algebra/Group/Profinite/ZHat/CohomologicalDimension.lean`: the procyclic group
  with its universal property and cohomological dimension, for Layer 6, with the nonzero/prime
  hypotheses retained.
- `TauCeti.Toric.regularAffinePointHomeomorph` in `TauCeti/Geometry/Toric/Analytic/RegularChart.lean`:
  for a regular affine semigroup with generating family, the homeomorphism from its complex
  points, with the affine point topology, onto `(ι → ℂ) × (κ → ℂˣ)`; and `coneChartEquiv`. Used by
  the rank-one toric comparison of §2.4.

### From TauCetiRoadmap.FormalLaurentPuiseux

L1 supplies field-valued formal substitutions with `σ_φ∘σ_ψ = σ_(ψ∘φ)` and the coefficient
tower; L2 the Laurent derivation and continuous one-forms; L3 the residue; L7 the continuous
profinite identification of the absolute Galois group of `ℂ((t))` with `TauCeti.zHat`. Layer 1 extends L1–L3 to arbitrary coefficient algebras `R` by construction.

### From TauCetiRoadmap.ReductiveGroups

Layers 0–9: the Hopf/scheme/points dictionary; Layer 1's faithful closed algebraic representation
`G → GL(V)` with coordinate algebra generated by matrix coefficients and `det(V)⁻¹`; Layer 2's
algebraic tangent and adjoint action; Layer 3's subgroup, quotient and component constructions and
Layer 3A's characteristic-zero Cartier smoothness comparison; Layer 4's torus character and
cocharacter lattices; Layer 5's solvable groups and unipotent radicals; Layer 6's centres, derived
groups, central isogenies, simply connected and adjoint forms and the characteristic-zero
reductive ⇔ linearly reductive theorem; Layer 7's maximal-torus/Borel conjugacy, Levi and Bruhat
structure; Layer 8's classification of split reductive groups by root data; Layer 9's pinned
Chevalley groups and root maps over `ℤ`; Layer 6B's complex reductive coset affineness, with its
fpqc quotient and invariant-ring identification, applied to `GL_n/G`.

### From TauCetiRoadmap.ReductiveGroupsPartII

RG2.5.1: the dual pinned group from `RootPairing.flip` and `RootPairing.Base.flip`. This is the
ordinary dual algebraic group, not a Weil semidirect product; no nonarchimedean building or
arithmetic normalization is consumed.

### From TauCetiRoadmap.SchemeAndStackFoundations

§§1.1, 1.14–1.18: ordinary quasi-coherent fpqc module descent with morphisms and coherence,
groupoids, sheaf torsors, stackification and 2-fibre products, and the early fpqc torsor/descent
interfaces used by the torsor lane of §3A.2.

### From TauCetiRoadmap.CrystallineCohomology

CR.1.3: the ordinary connection carrier over arbitrary commutative base rings, an additive map
`M → M ⊗_A Ω¹_(A/k)` with the Leibniz identity, its base linearity and tensor-symmetry adapters,
extension, curvature, horizontal morphisms, tensor, Hom/dual (when the first module is finite
projective) and base change. Its statements are cited by section; they are prose contracts.

### From TauCetiRoadmap.AlgebraicVectorBundles

Finite locally free sheaves, transition maps and pullback. Layer 2 owns differential operators,
algebraic connections and their gluing.

### From TauCetiRoadmap.ComplexKahlerGeometry

K1: joint holomorphic inverse and implicit maps and regular-zero-set submanifolds in model spaces
with their manifold transport, and the manifold inverse theorem; K3.0: finite-dimensional Cauchy
and analyticity; K4: holomorphic section/reconstruction comparison, connection carriers, curve
flatness and the flat holomorphic/smooth/local-system equivalence.

### From TauCetiRoadmap.ComplexComparisonPartII

C−1.1: the single scheme analytification functor `complexSchemeAnalytification` with its analytic
ring sheaf and comparison morphism `φ_X`, its complex-point comparison, open-restriction and
closed-immersion comparisons, fibre-product comparison, smooth-chart comparison, étale
local-isomorphism comparison and separated/Hausdorff comparison; C0.3's `holomorphicBundleDictionary`;
C0.4's coherent tensor pullback; C5.1's `DifferentialOperatorAnalytification`; C5.2's
`holomorphicConnectionDictionary`. The section-level comparisons of C−1.1 are cited by their
subject, as C−1.1 states them in prose.

### From TauCetiRoadmap.ComplexManifolds

Milestone 1: complex-to-real restriction of scalars and model/carrier atlas transport; Milestone 2:
canonical-real-orientation compatibility; Milestone 7: holomorphic-transition mixin and cocycle
gluing on native finite-rank vector bundles.

### From TauCetiRoadmap.AnalyticToricGeometry

L2: `AffineSemigroupComplexPoint`, `affinePointTopology` and `coneChartedSpace`; L3G and L3: the
finite-fan regular realization `Fan.analyticRealization` and its complex atlas; L6: the independent
toric complex-point comparison. §2.4 owns the comparison with the supplied scheme analytification
in lattice rank one, on the actual chart and face-localization maps.

### From TauCetiRoadmap.SmoothBundlesConnections

B3–B5: smooth connections, flat bundles, holonomy and monodromy, for the analytic side of the
curve comparison in §2.4.

### From TauCetiRoadmap.LieGroups

Layer 0: the exponential map `lieExp` of a finite-dimensional real Lie group, with derivative the
identity at `0` and its local-diffeomorphism property; Layer 6: maximal tori, the finite Weyl group
`N_K(T)/T` of a compact connected group with its identification with `RootPairing.weylGroup`, and
surjectivity of `lieExp` for compact connected groups; Layer 7: complexification of compact groups
and the existence of a compact real form of a complex reductive Lie group, stated there as a
milestone. §4.3 proves that `G(ℂ)` satisfies that milestone's hypotheses before consuming it, and
owns every other analytic input it needs.

### From TauCetiRoadmap.LieHighestWeight

Layer 7: `lieInvariantSymmetricAlgebra`, `lieCartanRestriction`, `lieChevalleyRestrictionIso` with
its restriction-map equation and `lieChevalleyRestrictionIso_mem_homogeneous_iff`, and
`killingSymmetricEquiv_cartan_restriction`: the Chevalley restriction isomorphism
`S(L)^L ≃ S(H)^W` for a finite-dimensional Killing-semisimple Lie algebra `L` with Cartan
subalgebra `H` over an algebraically closed characteristic-zero field, with its passage to
invariant polynomial functions `S(L*)`.

### From TauCetiRoadmap.CharacteristicClasses

C5.1: homogeneous compact Chevalley restriction `I(K) ≃ Sym(𝔱*)^W` for a compact connected Lie
group `K`, with compact-group versus infinitesimal invariants and finite-degree real descent.
Consumed only by the comparison target of §4.3, never by a proof route.

### From TauCetiRoadmap.AffineMorseLefschetz

A4: compatible triangulations of projective pairs and locally finite-polyhedral Borel–Moore
homology, for the finite-stage affine Springer cycles of Layer 6.

### From TauCetiRoadmap.ProfiniteCohomology

Layers 1 and 11: compatible-pair cohomology functoriality and the general cohomological-dimension
definitions and vanishing criteria. Layer 6 transports Tau Ceti's `zHat` dimension theorems along
its procyclic isomorphism.

### From TauCetiRoadmap.RootSystems

Finite root systems, bases, positive roots, the Weyl group and its reflection representation, for
the affine root bounds and the dominant-chamber transport of Layer 3A.

## How to read the build

Layer 1 builds the relative formal calculus, the `!` tensor completion, coordinate automorphisms
and Tate modules with their descent. Layer 2 builds ordinary and formal connections, all-order
differential operators and principal parts, and the fixed-model analytic comparison for smooth
complex schemes with the regular horizontal trivialization. Layer 3 builds formal loop groups,
their connections and the gauge groupoid with its fpqc stackification; Layer 3A builds polynomial
loops, the polynomial/formal quotient comparison, normalizers, Iwahori subgroups and positive
double cosets. Layer 4 builds intrinsic opers, the lower analytic dictionary of `G(ℂ)`, the
Chevalley–Kostant adapter and the Drinfeld–Sokolov normal form. Layer 5 builds the coordinate
action, oper function algebras and the scalar operator models. Layer 6 proves the Frenkel–Zhu
oper-reduction theorem with its torsor-triviality, affine-flag and deformed-Springer prerequisites.
Layer 7 builds the Drinfeld–Sokolov Poisson structure, the continuous cotangent algebroid, the
coisotropic regular locus and the Miura screening-kernel description with its completion. Layer 8
builds the isomonodromy groupoid, differentiates it and exports the contracts consumed downstream.
The order within Layers 3A, 4 and 6 is stated at the end of each.

## Layer 1: relative formal calculus and Tate modules (F1)

### 1.1 Relative derivations, continuous differentials and the ! tensor completion (F1.1)

Extend the formal derivative, product and chain rules, residue and substitution of
FormalLaurentPuiseux L1–L3 to arbitrary commutative `R`. Construct the relative
`Derivation R F_R F_R` with coefficient formula `d(t^j) = j t^(j−1)` for every integer `j`, and
the `dt`-trivialized continuous differentials `Ω¹_cont(F_R/R) = F_R dt`. Prove their universal
property for continuous derivations into complete separated linearly topologized `F_R`-modules
with compatible scalar multiplication. For the oper function and cotangent constructions pin the
`!` tensor completion `V ⊗^! W = lim_(U,T) (V/U) ⊗ (W/T)` over open linear submodules `U ⊂ V`,
`T ⊂ W`, with the inverse-limit topology; prove presentation independence and its universal
property for bilinear maps factoring continuously through these quotient systems. Build its
relative module and sheaf form by finite-projective charts and descent. Distinguish it from the
two ordered completions (one factor completed, the other discrete) and from the jointly
continuous completion; no algebraic tensor product is silently completed.

- The relative derivative is `R`-linear, continuous for the `t`-adic topology, and satisfies
  `d(fg) = f dg + g df`; the residue `Res(f dt)` is the coefficient of `t⁻¹` and vanishes on
  exact forms.
- Every continuous `R`-derivation `F_R → M` into a complete separated linearly topologized
  `F_R`-module factors uniquely through `dt`.
- `⊗^!` is functorial in both factors, symmetric, associative, and commutes with finite direct
  sums; for discrete finite projective factors it is the algebraic tensor product.

**Checks.**

- `d(t⁻¹) = −t⁻²` and `Res(f' dt) = 0` for every `f`, since the `t⁻¹` coefficient of `f'` is
  `0·f₀`; `Res(t⁻¹ dt) = 1`. A module in which `d(t⁻¹)` were an independent generator would not be
  free on `dt`.
- Over `R = ℚ[ε]/ε²`, `d(ε t) = ε dt` and `d(ε) = 0`: the relative derivative kills the
  nonreduced constants. A derivation over `k` rather than over `R` would have to be given a value
  on `ε`.
- For `V = W = k((t))`, the element `Σ_(n≥0) t^n ⊗ t^(−n)` lies in `V ⊗^! W`: in
  `(V/t^M V⁺) ⊗ (W/t^N W⁺)` only the terms with `n < M` survive. It does not lie in the algebraic
  tensor product, and not in the ordered completion that completes only the second factor, where
  the first factor's degrees `n` are unbounded. This separates `⊗^!` from both.

*Needs:* FormalLaurentPuiseux L1–L3; Mathlib `LaurentSeries`, `Derivation`; SchemeAndStackFoundations
§1.1 for the chart-and-descent module form.

### 1.2 Coordinate automorphisms (F1.2)

Define coordinate automorphisms by `φ ∈ tR[[t]]` with unit coefficient of `t`. Construct the
inverse substitution recursively, the group functor `Aut(O)`, its composition order, and its action
on `F_R` and on differential forms. Use FormalLaurentPuiseux L1's `σ_φ∘σ_ψ = σ_(ψ∘φ)` with
`(ψ∘φ)(t) = ψ(φ(t))`; therefore coordinate pullback is a right action, `(q^φ)^ψ = q^(φ∘ψ)`. Prove
`d(f∘φ) = (f'∘φ) φ' dt` and invariance of `Res(f dt)` under substitution. These are continuous
`R`-algebra automorphisms preserving the chosen formal disc; no statement about arbitrary abstract
automorphisms of `ℂ((t))` is intended.

- `Aut(O)(R)` is a group under composition, functorial in `R`, with `Aut⁺(O) = ker(φ ↦ φ'(0))`
  pro-unipotent and `Aut(O) = 𝔾_m ⋉ Aut⁺(O)` (Frenkel, *Langlands correspondence for loop
  groups*, §§3.5.3–3.5.4, pp. 91–92).
- Substitution is a continuous `R`-algebra automorphism of `F_R` preserving `O_R`, and acts on
  `F_R dt` by `f dt ↦ (f∘φ) φ' dt`.
- The infinitesimal action of `ε(t)∂_t` on `λ`-forms `f (dt)^λ` is `ε f' + λ ε' f` (Frenkel,
  §3.5.7, p. 96).

**Checks.**

- For `φ = t + t²` the inverse is `ψ = t − t² + 2t³ − 5t⁴ + ⋯`: `φ(ψ(t)) = (t − t² + 2t³) +
  (t − t² + 2t³)² + O(t⁴) = t + O(t⁴)`. Truncating the recursion one step early gives `t − t²`,
  whose composite with `φ` is `t − 2t³ + O(t⁴)`.
- For `φ = 2t` and `ψ = t + t²`, `σ_φ σ_ψ (t) = (ψ∘φ)(t) = 2t + 4t²` while `σ_ψ σ_φ (t) =
  (φ∘ψ)(t) = 2t + 2t²`. The two orders differ, which pins the contravariance.
- For `f = t⁻¹` and `φ = t + t²`: `f∘φ = t⁻¹ − 1 + t − ⋯`, `(f∘φ)' = −t⁻² + 1 − ⋯`, and
  `(f'∘φ) φ' = −t⁻²(1 + t)⁻²(1 + 2t) = −t⁻² + 1 + ⋯`, so the chain rule holds; `Res((f∘φ) φ' dt) = 1 =
  Res(f dt)`. For the non-automorphism `φ = t²`, `Res(t⁻² · 2t dt) = 2 ≠ 1`: the unit hypothesis is
  needed.

*Needs:* §1.1; FormalLaurentPuiseux L1.

### 1.3 Relative Tate modules, lattices and descent (F1.3)

Construct the relative Tate module `V((t))` for finite projective `R`-modules `V`, its lattices
`V[[t]]`, exact sequences, continuous duals and residue duality `V((t))^∨_cont ≃ V^∨((t)) dt`,
with lattice annihilators and coefficient formulas. Use completed local modules when `V` varies
over a scheme. Define discrete projective modules and their projective-dual topological pieces:
for a discrete projective `R`-module `Q`, `Q* = Hom_R(Q, R)` has the topology of pointwise
evaluation with `R` discrete. An elementary Tate `R`-module is `P ⊕ Q*` for discrete projective
`P`, `Q`; a Tate `R`-module is a topological direct summand of one, with continuous `R`-linear
morphisms. A lattice `L` is an open submodule such that `L/U` is finitely generated for every open
submodule `U ⊂ L` (Drinfeld, *Infinite-dimensional vector bundles in algebraic geometry*, §3.2.1
and §3.2.3). Prove lattices exist and form a neighbourhood basis. Construct completed coefficient
base change `S ⊗̂_R M` from `S ⊗_R P` and `(S ⊗_R Q)*` on elementary presentations and then on
direct summands; prove independence of presentation, continuity, functoriality, identity and
composition laws and associativity comparisons. Prove effective categorical descent of Tate
modules and continuous morphisms for every faithfully flat coefficient map `R → S`, with this
completed base change and its double and triple tensor-product coherences (Drinfeld, Theorem 3.3).
This includes the projective-presentation and lattice patching needed for effectivity, not only
descent of an underlying abstract module. Compare with SchemeAndStackFoundations §1.1's ordinary
module descent on discrete finite-projective pieces; the completed descent is a construction target
here.

A continuous endomorphism `T` is topologically nilpotent when, for every pair of lattices `L`,
`L′`, one has `T^n L′ ⊂ L` for all sufficiently large `n`. Prove the unique continuous
`R[[t]]`-action with `t` acting by `T`; when `T` is also a topological automorphism, extend it to
`R((t))`. Prove that Tate `R`-modules with such a topologically nilpotent automorphism, and
continuous morphisms commuting with it, are equivalent to finite projective `R((t))`-modules with
their standard topology (Drinfeld, Lemma 3.9 and Theorem 3.10). Construct this standard topology
by finite-projective summands of `R((t))^n` and prove its independence of the chosen presentation,
its characterization as the initial topology for all `R((t))`-linear maps to `R((t))` (Drinfeld,
§3.2.2), and both directions of the equivalence. Compare completed coefficient base change with
`S((t)) ⊗_(R((t))) M` on every such finite-projective object, including its standard topology and
morphisms. Prove that topological nilpotence is preserved and reflected by faithfully flat
completed coefficient base change, as required for descent of the Laurent-module structure. No
identity `S ⊗_R R((t)) = S((t))` is assumed. Prove the lattice independence, base change,
tensor/continuous-dual and descent rules used in Layers 3, 7 and 8. Retain arbitrary, including
nonreduced, coefficient algebras `R`; the `ℂ`-point linear topology is not a substitute for this
sheaf on all `R`-points.

- Tate modules form an additive category with continuous duals, `M** = M`, and lattices in a
  direct sum are sums of lattices up to commensurability.
- Completed base change along `R → S` is exact on elementary presentations and sends the
  standard topology of a finite projective `R((t))`-module to that of its `S((t))`-base change.
- Topological nilpotence of `T` on `M` is equivalent to the existence of a unique continuous
  `R[[t]]`-module structure with `t = T` (Drinfeld, Lemma 3.9).

**Checks.**

- `R((t)) = t⁻¹R[t⁻¹] ⊕ R[[t]]` is elementary with `P = t⁻¹R[t⁻¹]` discrete free and `R[[t]] =
  (R^(ℕ))*`; `t^N R[[t]]` is a lattice, and for `U = t^M R[[t]]`, `M ≥ N`, the quotient is free of
  rank `M − N`. The non-open submodule `R[t⁻¹]` is not a lattice.
- With `R = {f ∈ k[x] : f(0) = f(1)}` and `M = {u ∈ k[x]((t)) : u(1, t) = t u(0, t)}` (Drinfeld,
  §3.2.2, equation (3.1)), `M` is a finitely generated projective `R((t))`-module that is not
  quasi-elementary. A definition taking only elementary modules as Tate modules excludes it.
- Residue duality pairs `v t^i` with `φ t^j dt` to `φ(v)` when `i + j = −1` and to `0` otherwise;
  the annihilator of `V[[t]]` is exactly `V^∨[[t]] dt`. Dropping the `dt` shifts the annihilator to
  `t⁻¹ V^∨[[t]]`.
- On `R((t))`, multiplication by `t` is a topologically nilpotent automorphism; multiplication
  by `t⁻¹` is an automorphism that is not topologically nilpotent (`t^(−n) R[[t]] ⊄ R[[t]]`); the zero
  map is topologically nilpotent and not an automorphism.
- For `R = k` and `S = k[x]`, the series `Σ_(n≥0) x^n t^n` lies in `S((t))` but not in
  `S ⊗_k k((t))`, whose elements have bounded `x`-degree; the completed base change, not the
  algebraic one, is the descent carrier.

*Needs:* §1.1; SchemeAndStackFoundations §1.1; Mathlib `HahnModule`.

### Examples

The three fans of lattice rank one give the coefficient rings `ℂ[t]`, `ℂ[t, t⁻¹]` and `ℂ[t⁻¹]`
whose completions at the origin and at infinity are the discs of this layer; `ℙ¹` is the two-ray
case (§2.4). The element `Σ t^n ⊗ t^(−n)` of §1.1 is the model of the universal oper of §5.2, a
compatible family whose pole bound grows with the stage. Drinfeld's module (3.1) is the model of a
family of Tate spaces that is projective but not globally presented.

### Dependencies

FormalLaurentPuiseux L1–L3, SchemeAndStackFoundations §1.1 and Mathlib's Laurent and Hahn series.
No connection, group or oper notion enters this layer.

## Layer 2: algebraic sheaf connections and differential operators (F2)

### 2.1 Form and vector-field connections (F2.1)

For a `k`-algebra `A` and an `A`-module `M`, use CrystallineCohomology CR.1.3's ordinary
connection: an additive map `M → M ⊗_A Ω¹_(A/k)` satisfying the Leibniz identity. Its base
linearity follows because `d` kills `k`; tensor symmetry gives this roadmap's `k`-linear form
`M → Ω¹_(A/k) ⊗_A M`. Identify extension and curvature under that symmetry. Integrability means
zero curvature for every such ordinary form connection. In the formal setting construct the
extension with §1.1's continuous differentials and the appropriate completed tensor; an ordinary
algebraic Kähler-differential carrier does not itself supply this universal property. Construct
evaluation on vector fields as an `A`-linear map `Derivation k A A → Module.End k M` obeying
`∇_ξ(am) = a∇_ξ m + ξ(a) m`. Prove equivalence with the ordinary form carrier when `Ω¹_(A/k)` is
finite projective. Without that hypothesis retain the ordinary form carrier and the
curvature-zero definition; the vector-field presentation alone need not recover the form or
detect its curvature. Its operators are `k`-linear endomorphisms; `O`-linear endomorphisms cannot
differentiate.

- The set of connections on `M` is a torsor under `Hom_A(M, M ⊗ Ω¹)` when nonempty; the
  difference of two connections is `A`-linear.
- The vector-field form is `A`-linear in `ξ` and determines the form connection when `Ω¹_(A/k)`
  is finite projective, by evaluating against a dual basis.
- The Hom/dual connection on `Hom_A(M, N)` is `∇(φ) = ∇_N∘φ − (φ ⊗ 1)∘∇_M`, for `M` finite
  projective (CR.1.3); the tensor connection obeys the Leibniz rule in each factor.

**Checks.**

- `A = k[x]`, `M = A`, `∇ = d + a dx`: `∇(fm) = df m + f∇m` holds, `Ω²_(A/k) = 0` so the
  curvature vanishes, `Ω¹` is free on `dx` and `∇_(∂_x) = ∂_x + a` recovers `∇`.
- Dual sign: for `M = A` with `∇ = d + a dx`, `∇^∨ = d − a dx` on `M^∨ = A`, and the tensor
  connection on `M ⊗ M^∨ = A` is `d`, compatible with the trace pairing. The sign `∇^∨ = d + a dx`
  would give `d + 2a dx` on the trivial pairing.
- Negative control for the vector-field form: in characteristic zero let `A = k[x, y]/(x, y)²`,
  `M = A` and `∇(a) = da + a·x dy`. Then `Ω²_(A/k) ≃ k` spanned by `dx ∧ dy`, since `x dx = y dy =
  x dy + y dx = 0` in `Ω¹`, and the curvature sends `1` to `d(x dy) = dx ∧ dy ≠ 0`, while every
  `k`-derivation `ξ` of `A` maps `x` and `y` into `(x, y)` (apply `ξ` to `x² = y² = 0`), so
  `x ξ(y) = 0`, `∇_ξ = ξ` and the bracket identity holds for all `ξ, η`. The vector-field form does
  not see the curvature when `Ω¹` is not projective.

*Needs:* CrystallineCohomology CR.1.3; Mathlib `Derivation`, `KaehlerDifferential`; §1.1 for
the formal extension.

### 2.2 Differential operators and principal parts (F2.2)

Construct order-filtered algebraic differential operators on modules via iterated commutators
with multiplication, the symbol map, the first-jet/Atiyah exact sequence and its splitting
criterion for a connection. Define the sheaf of these operators on schemes by restriction and
localization; prove gluing. For arbitrary commutative `k`, commutative `k`-algebras `A` and
arbitrary `A`-modules `M`, `N`, prove the order-zero `A`-linearity criterion, additivity in the
operator and the multiplier, monotonicity, sums at a common order and the composition order bound.
With `I = ker(A ⊗_k A → A)`, construct all-order principal parts
`P^m_(A/k)(M) = ((A ⊗_k A)/I^(m+1)) ⊗_(A,right) M` with the left `A`-action and jet `s ↦ 1 ⊗ s`.
Prove the natural bijection between `A`-linear maps `P^m(M) → N` and `k`-linear operators
`M → N` of order at most `m` (Stacks, Definition 10.133.1, Lemmas 10.133.3 and 10.133.9, tags
09CI, 09CK and 0H90): this is `principalParts_universal`, with the order predicate
`IsDifferentialOperator` (order zero is `A`-linearity, and order at most `m + 1` means every
commutator `m ↦ D(am) − aD(m)` has order at most `m`), the relation module
`principalPartsRelations` spanned by the iterated differences
`(a₀ ⊗ 1 − 1 ⊗ a₀) ⋯ (a_m ⊗ 1 − 1 ⊗ a_m)(1 ⊗ s)`, the quotient `PrincipalParts` and the jet
`principalJet`. Construct order-transition quotients and composition maps
`P^(m+n)(M) → P^m(P^n(M))`, carrying jets to iterated jets, with unit, associativity,
order-transition, localization and sheafified restriction laws. Individual finite-order
operators extend uniquely to localized coefficient modules; identifying localized `Hom` with all
`Hom` after localization additionally requires finite presentation of `P^m(M)`. The order
predicate and universal factorization require no characteristic, smoothness or projectivity
hypothesis. For smooth schemes in characteristic zero identify `gr D_X` with `Sym T_X` through
Lie–Rinehart PBW and the comparison with ordinary differential operators. Construct the
Lie–Rinehart enveloping algebra by its relations `[ξ, a] = ξ(a)`, `[ξ, η]` = their bracket, and
`A`-linearity; its universal property and filtered PBW under projectivity (Rinehart,
*Differential forms on general commutative algebras*, Theorem 3.1, cited by locator) are targets
here. A vector-field connection satisfying the bracket identity is equivalently a module over this
Lie–Rinehart enveloping algebra with the compatible `O_X`-action. Compare this with ordinary
curvature-zero form connections under the explicit hypothesis that `Ω¹_(X/k)` is finite locally
projective; on affine charts use §2.1's finite-projective equivalence. Neither this form comparison
nor the smooth characteristic-zero comparison with ordinary differential operators is asserted
without its hypotheses. These are targets here, not dependencies on an unnamed D-module roadmap.

- `IsDifferentialOperator k A n D` is monotone in `n`, closed under sums at a common order, and
  the composite of operators of orders `m` and `n` has order at most `m + n`.
- `principalParts_universal`: composition with `principalJet k A M n` is a bijection from
  `A`-linear maps `PrincipalParts k A M n →ₗ[A] N` onto the `k`-linear operators `M → N` of order
  at most `n`, for every commutative ring `k`, commutative `k`-algebra `A` and `A`-modules `M`, `N`.
- The order-transition map `P^(m+1)(M) → P^m(M)` is the quotient by the next power of `I`, and
  the jets are compatible.

**Checks.**

- For `m = 0` the relations are spanned by `a ⊗ s − 1 ⊗ as`, the quotient is `M` by `a ⊗ s ↦ as`,
  and the bijection is the identity on `A`-linear maps.
- For `A = k[x]` and `M = N = A`, `D = d/dx` satisfies `D(x·1) = 1 ≠ x·D(1) = 0`, so it is not of
  order zero, while `[D, x] f = (xf)' − xf' = f` is `A`-linear, so `D` has order one. `P¹(A)` is
  free on `1 ⊗ 1` and `1 ⊗ x − x ⊗ 1`, the jet of `f` is `(f, df)`, and the factorization of `D`
  sends `1 ⊗ 1 ↦ 0` and `1 ⊗ x − x ⊗ 1 ↦ 1`.
- In characteristic `p` the operator `(d/dx)^p` is zero on `k[x]`, since
  `(d/dx)^p x^n = n(n−1)⋯(n−p+1) x^(n−p) = 0`, while the divided-power operator
  `x^n ↦ binom(n, p) x^(n−p)` has order `p` and is not generated by vector fields: the order
  predicate is not the vector-field one.
- For `A = 0` or `A = k` all principal parts are `M` in every order and every `k`-linear map
  has order zero.

*Needs:* Mathlib tensor products and `Submodule.span`; §2.1; AlgebraicVectorBundles for the
sheaf form; Mathlib `LieRinehartAlgebra` for the enveloping algebra.

### 2.3 Operations, Bianchi and the flatness criterion (F2.3)

Consume CR.1.3's ordinary extension, curvature, horizontal morphisms, tensor and base-change
operations, and its Hom/dual connection when the first coefficient module is finite projective.
Compare them under §2.1's base-linearity and tensor-symmetry adapters, including direct sums and
the unit connection, and prove Bianchi with those conventions. Ordinary integrability always means
zero curvature. For every ordinary form connection zero curvature implies `∇_[ξ,η] = [∇_ξ, ∇_η]`;
prove the converse, and hence the flatness criterion, when `Ω¹_(A/k)` is finite projective; the
negative control of §2.1 shows the hypothesis is needed. The vector-field bracket identity is the
Lie–Rinehart notion of flatness independently of this qualified comparison. Extend these
operations and their qualified comparisons to vector-bundle sheaves by localization and gluing
using `Scheme.PresheafOfModules` and its sheaf and finite-local-freeness conditions. Construct the
continuous and formal versions and their restriction, completed-tensor, continuous Hom/dual and
relative base-change comparisons using Layer 1, rather than inferring them from ordinary algebraic
differentials. Construct principal `G`-connections on fpqc torsors via local gauge forms and
gluing, and prove independence of trivialization and the associated vector-bundle dictionary for a
faithful algebraic representation.

- Curvature `F_∇ : M → M ⊗ Ω²` is `A`-linear and satisfies Bianchi `∇(F_∇) = 0` in
  `Hom(M, M ⊗ Ω³)`; `F_(∇⊗∇′) = F_∇ ⊗ 1 + 1 ⊗ F_∇′`.
- Horizontal morphisms compose; the kernel and cokernel of a horizontal morphism between flat
  connections inherit connections when they are `A`-direct summands.
- The principal `G`-connection on a torsor trivialized on an fpqc cover is a compatible family of
  `𝔤 ⊗ Ω¹`-valued gauge forms; changing the trivialization by `g` transforms the form by
  `gauge(g, ·)`.

**Checks.**

- `A = k[x, y]`, `M = A²`, `∇ = d + N dx` with `N = [[0, 1], [0, 0]]`: curvature
  `dN dx + N dx ∧ N dx = 0`, `∇_(∂_x) = ∂_x + N`, `∇_(∂_y) = ∂_y`, and `[∇_(∂_x), ∇_(∂_y)] = 0 =
  ∇_([∂_x, ∂_y])`.
- Same `A`, `∇ = d + y N dx`: curvature `d(y N dx) = N dy ∧ dx ≠ 0`, and
  `[∇_(∂_x), ∇_(∂_y)] = [∂_x + yN, ∂_y] = −N ≠ 0 = ∇_([∂_x, ∂_y])`; evaluating `N dy ∧ dx` on
  `(∂_x, ∂_y)` also gives `−N`, so the bracket identity computes the curvature with the right sign
  when `Ω¹` is free.
- Rank one: `F_(d + a dx + b dy) = (∂_x b − ∂_y a) dx ∧ dy`, which vanishes for `a = y`, `b = x`
  and equals `dx ∧ dy` for `a = 0`, `b = x`; Bianchi is `d` of a top form, zero in two variables.

*Needs:* CrystallineCohomology CR.1.3; §§2.1–2.2; §1.1; Mathlib `Scheme.PresheafOfModules`;
SchemeAndStackFoundations §§1.14–1.16 for torsors.

### 2.4 Analytification on fixed models and the regular horizontal trivialization (F2.4)

Take ComplexComparisonPartII C−1.1's `complexSchemeAnalytification`, its analytic ring sheaf and
comparison morphism `φ_X`. For every separated finite-type smooth scheme `X` over `ℂ` whose
`Ω¹_(X/ℂ)` is locally free of constant rank `d`, construct its fixed-model manifold realization
and compare it with this same analytic space. Call the selected rank the constant differential
dimension `d`. Construct the comparison with Krull pure dimension `d`. At every closed complex
point `x` construct the cotangent-fibre isomorphism `Ω¹_(X/ℂ) ⊗ κ(x) ≃ m_x/m_x²`; smoothness makes
the local ring regular, so its dimension is this cotangent dimension. Prove the finite-type field
dimension theorem identifying the local dimension at a closed point with the dimension of its
irreducible component; regularity makes that component unique locally. The differential rank is
locally constant on a smooth scheme. Use the Jacobson property of finite-type complex schemes, so
every nonempty open contains a closed point, to pass the closed-point rank calculation to every
point. Prove the equivalence of constant differential dimension `d` with every irreducible
component having Krull dimension `d`. Include the empty scheme separately, with its empty manifold
for each selected `d`.

Define `X(ℂ)` as the `ℂ`-morphisms `Spec ℂ → X`, and use C−1.1's complex-point comparison to
identify this carrier with the underlying space of `X^an`. For `X = Spec A` construct the
Spec-adjunction equivalence with `A →ₐ[ℂ] ℂ`, natural under algebra maps. On a finite affine
presentation identify the supplied topology with the common-zero-set subspace topology in `ℂ^N`.
Verify independence from generators and presentation by the polynomial coordinate maps and their
inverse equations. Identify C−1.1's open-restriction comparison on each `D(f)` with evaluation into
`{x : f(x) ≠ 0}`, including its open-embedding map, then use the principal open basis for every
Zariski open immersion. On a finite affine cover identify the supplied glued space with the actual
`TopCat.GlueData` of these point spaces and overlaps. Prove the glued-point identification is the
identity on `X(ℂ)`, each affine-open point map is an `IsOpenEmbedding`, these maps cover, and
common refinements give the same topology and maps. These adapter statements precede any manifold
instance. Identify C−1.1's fibre-product comparison with the affine tensor-product point
comparison on every open chart, giving `(X × Y)^an ≃ X^an × Y^an` with its actual projections.
Identify its closed-immersion comparison with the corresponding closed embeddings and the
separated diagonal with the diagonal of this product. Use its separated/Hausdorff comparison on
this same topology. Each affine piece is a second-countable subspace of a finite-dimensional
complex space. For the finite family of its open images `U_i`, transport second countability to
each subtype `U_i` and apply `TopologicalSpace.secondCountableTopology_of_countable_cover`, with
openness, a countable index type and `⋃ i, U_i = univ`. Obtain second countability and hence
separability of `X(ℂ)`. The local implicit-function charts need not be finite.

Prove both finite-type complex-point Nullstellensatz applications. Every nonempty Zariski open of
a finite-type complex scheme has a complex point: reduce to a nonempty principal affine open and a
finite polynomial presentation, then use `MvPolynomial.eq_vanishingIdeal_singleton_of_isMaximal`
and `MvPolynomial.isMaximal_iff_eq_vanishingIdeal_singleton`. For a reduced finitely generated
complex algebra `A`, prove that an element vanishing under every `A →ₐ[ℂ] ℂ` is zero, using
`MvPolynomial.vanishingIdeal_zeroLocus_eq_radical` on its presentation ideal. Keep the reduced
hypothesis in this second statement; all `R`-valued formal families of Layers 1–8 retain their
nonreduced test algebras.

Consume native `Algebra.IsSmoothAt.exists_isStandardEtale_mvPolynomial` and
`Algebra.Smooth.exists_span_eq_top_isStandardSmooth` with their finite-presentation and smoothness
hypotheses. Own the standard-smooth cotangent/Jacobian comparison: identify the free differential
rank `n` in each standard-étale polynomial presentation with the fibre rank of `Ω¹_(X/ℂ)`. The
constant-rank hypothesis gives `n = d` before any manifold instance. Use C−1.1's smooth-chart
comparison and compare its standard-smooth presentation with K1's joint holomorphic implicit map
and regular-zero-set theorem in the presentation's complex model spaces. Prove the resulting open
subsets of `Fin d → ℂ` map by open embeddings into the already topologized `X(ℂ)`, and cover it.
This includes the comparison from localized fresh presentation coordinates to any fixed affine
embedding. Compute overlap maps directly from polynomial and fraction evaluations and the joint
implicit solutions; prove the holomorphic local-deck equations before applying native
`TauCeti.chartedSpaceOfIsOpenEmbedding` and `TauCeti.isManifold_chartedSpaceOfIsOpenEmbedding` at
order `ω`. Export `ChartedSpace (Fin d → ℂ) X^an` and `IsManifold 𝓘(ℂ, Fin d → ℂ) ω X^an`, hence
order `∞`. For two embeddings, presentations or covers prove the identity on `X(ℂ)` is
biholomorphic in both directions, equivalently their maximal complex atlases coincide. Identify the
manifold holomorphic function sheaf with C−1.1's analytic ring sheaf by coordinate evaluation and
equality of germs; prove compatibility with restrictions and `φ_X`. Take regular morphism
analytification from `complexSchemeAnalytification.map` and verify its coordinate formula,
identity, composition and naturality in these charts. For products first use the native product
model `(Fin d → ℂ) × (Fin e → ℂ)`; transport it by the complex continuous linear equivalence
defined by `Fin.append` and restriction to the two blocks to `Fin (d + e) → ℂ`. Prove the product
comparison biholomorphic, with its actual projections, pairing and associativity comparisons.
Construct the natural complex-linear tangent isomorphism
`τ_x : T_x X^an ≃ Der_ℂ(O_(X,x), ℂ) ≃ (Ω¹_(X/ℂ) ⊗ κ(x))^∨`: a vector acts on a regular germ by the
derivative of its analytification. Prove germ independence, Leibniz, invertibility in the
standard-étale coordinates, and the chain rule `τ_(f(x)) ∘ d(f^an)_x = (precompose f^#) ∘ τ_x`,
with the residue-field module actions supplied by `x` and `f(x)`. An algebraic étale map has
invertible cotangent-fibre and tangent maps; use this square to obtain invertible `mfderiv`, then
apply K1's manifold inverse theorem to prove its local biholomorphism property. Identify these
local inverse branches and their holomorphic pullbacks with C−1.1's étale local-isomorphism
comparison on the same analytic ringed spaces.

Specialize to curves, `d = 1`, using the complex continuous linear equivalence
`(Fin 1 → ℂ) ≃L[ℂ] ℂ`, evaluation at `0` with constant-function inverse. Apply ComplexManifolds
Milestone 1's atlas transport to recover `ChartedSpace ℂ X^an` and `IsManifold 𝓘(ℂ, ℂ) ω X^an`,
and Milestone 2 for compatibility of the canonical real orientations under this complex-linear
recharting. Own the rank-one fan scheme application before comparing the supplied
analytification: classify finite fans in a rank-one lattice as the empty fan, the zero cone, one
primitive ray with its faces, or both primitive rays with their faces. Prove each such fan
satisfies `Fan.IsRegular`: the primitive generator of a ray extends to a lattice basis and the
zero cone uses the empty independent family. Identify the affine algebras with `ℂ[t]`,
`ℂ[t, t⁻¹]` or `ℂ[t⁻¹]`, with the stated principal-localization overlaps. Prove finite type,
smoothness, `Ω¹`-rank one and separatedness by the fan intersection/gluing criterion, including
the two-ray `ℙ¹` case. The empty fan gives the empty scheme and atlas. Compare with
AnalyticToricGeometry L2's topology and `coneChartedSpace`, L3's regular-fan realization and
atlas and L6's algebraic-point comparison. Its native `regularAffinePointHomeomorph` lands in
`(ι → ℂ) × (κ → ℂˣ)`. Choose finite reindexing equivalences `ι ≃ Fin k`, `κ ≃ Fin l`, prove their
reindexing maps are complex coordinate equivalences and retain `k + l = 1`. Include units into
`ℂ`, concatenate the two blocks to `Fin 1 → ℂ`, and evaluate at `0` to obtain `ℂ`. If the selected
toric model is `EuclideanSpace ℂ (Fin 1)`, use its coordinate continuous linear equivalence to that
same model. Prove all these maps intertwine monomial evaluations, face localizations and gluing,
including `ℂ`, `ℂˣ` and `ℙ¹`. This roadmap owns this comparison of the independent carriers and
maximal atlases.

On a smooth algebraic curve use C0.4's tensor pullback `O_(X^an) ⊗_(φ_X⁻¹O_X) φ_X⁻¹E` for finite
locally free sheaves. Compare its analytified transition matrices with ComplexManifolds
Milestone 7's native bundle cocycle gluing and K4's section/reconstruction equivalence through
C0.3's `holomorphicBundleDictionary`. Work on each clopen rank stratum and their common
refinements when ranks vary; preserve all finite locally free objects and morphisms. Use C5.1's
`DifferentialOperatorAnalytification` and C5.2's `holomorphicConnectionDictionary`, identifying
§§2.1–2.3's ordinary differential-form connection with the shared CR.1 carrier by its Leibniz and
local frame equations, including tensor symmetry. Prove restriction, scheme pullback, relative
differentials, curvature and horizontal sheaves commute with this composite. Since `Ω² = 0` on a
smooth algebraic curve, its algebraic connections are flat; identify the resulting connection and
its absolute monodromy with K4's holomorphic carrier and flat comparison. Pin the
connection-matrix dictionary: Layer 3's left gauge by `h` is K4's frame change `e′ = e·h⁻¹`, so
`g = h⁻¹` and `A′ = g⁻¹Ag + g⁻¹dg = Ad(h)A − (dh)h⁻¹`. No GAGA or global algebraization theorem is
assumed.

On `D_R×` the continuous relative 1-form module has rank one, so its relative curvature vanishes.
Prove regular formal horizontal trivialization by coefficient recursion in characteristic zero,
including all `R`-families and morphisms. With the left gauge `regularGauge`,
`g·A = gAg⁻¹ − (dg/dt)g⁻¹` on `R[[t]]`-matrices over a `ℚ`-algebra `R`,
`regularGauge_constantCoeff_bijective` states that taking the constant term is a bijection from
gauge transformations carrying `A` to `B` onto `GL_n(R)`; the proof is the recursion
`(j + 1) g_(j+1) = Σ_(i≤j) (g_i A_(j−i) − B_(j−i) g_i)`, which divides by `j + 1`. Identify regular
connection isomorphisms with isomorphisms of fibres at `t = 0`.

- The fixed-model realization is a functor from smooth separated finite-type complex schemes of
  constant differential dimension `d` (with their morphisms of constant-rank type) to complex
  manifolds modelled on `Fin d → ℂ`, with the identity on `X(ℂ)` as its comparison with `X^an`.
- `τ_x` is natural in `x` and in `X`, and an étale morphism is a local biholomorphism.
- `regularGauge R n g A` is a left action: `regularGauge R n (h * g) A = regularGauge R n h
  (regularGauge R n g A)`, and `regularGauge R n 1 A = A`.

**Checks.**

- `X = 𝔸¹`: `X(ℂ) = ℂ` with the Euclidean topology, the chart is the identity, `Ω¹` has rank one
  and the Krull dimension is one. `X = 𝔾_m`: the chart is the open embedding `ℂˣ ⊂ ℂ`.
- `X = Spec ℂ[x, y]/(xy)` is not smooth: `Ω¹ ⊗ κ` has rank two at the origin and one elsewhere,
  and `X(ℂ)` is not a manifold at the origin. `X = Spec ℂ[x]/(x²)`: `X(ℂ)` is a point, `Ω¹ ⊗ κ = ℂ dx`
  has rank one but the Krull dimension is zero; the smoothness hypothesis excludes both. The
  nonzero element `x` vanishes under every `ℂ`-point, so the strong Nullstellensatz needs
  reducedness.
- `X = 𝔾_m ⊔ 𝔸²` has differential ranks one and two: the constant-rank hypothesis fails and the
  realization is built on the two clopen strata separately.
- The nonempty open `D(x − 1) ⊂ 𝔾_m` has the complex point `x = 2`: the weak Nullstellensatz
  application.
- Rank-one fans: the zero cone has `ι = ∅`, `κ` of rank one and `(ι → ℂ) × (κ → ℂˣ) ≃ ℂˣ`; a ray
  has `ι` of rank one, `κ = ∅` and target `ℂ`; `k + l = 1` in both cases. Two rays glue `ℂ ∪ ℂ`
  along `ℂˣ` by `t ↦ t⁻¹`, giving `ℙ¹`.
- Frame dictionary: with `g = h⁻¹`, `g⁻¹Ag + g⁻¹dg = hAh⁻¹ − (dh)h⁻¹`, since
  `g⁻¹ dg = h d(h⁻¹) = −(dh)h⁻¹`.
- `regularGauge`: `n = 1`, `A = 1`, `B = 0` gives `g′ = g`, so `g = g₀·exp(t)` is the only
  solution with `g(0) = g₀`. Over `𝔽_p` the recursion fails at `t^p`, and `g = 1 + t^p` is a
  nonconstant solution of `g′ = 0` with the same constant term as `1`; the `ℚ`-algebra hypothesis
  is needed. Over `R = ℚ[ε]/ε²` the solutions with `A = εI`, `B = 0` are `g₀(1 + εt)`.
- `regularGauge` composition: `gauge(h, gauge(g, A)) = hgA(hg)⁻¹ − (h′h⁻¹ + h g′g⁻¹ h⁻¹) =
  gauge(hg, A)`, since `(hg)′(hg)⁻¹ = h′h⁻¹ + h g′ g⁻¹ h⁻¹`.

*Needs:* ComplexComparisonPartII C−1.1, C0.3, C0.4, C5.1, C5.2; ComplexKahlerGeometry K1, K3.0,
K4; ComplexManifolds Milestones 1, 2, 7; AnalyticToricGeometry L2, L3G, L3, L6; Mathlib
standard-smooth presentations, Nullstellensatz lemmas, `secondCountableTopology_of_countable_cover`;
Tau Ceti gluing and `regularAffinePointHomeomorph`; §§2.1–2.3; Layer 1.

### Examples

The curve `𝔾_m` with the connection `d + a t⁻¹ dt` on the trivial line bundle: algebraically flat,
whose horizontal sections `c t^(−a)` have monodromy `exp(−2πi a)` around the origin; for `a ∈ ℤ`
the connection is gauge-trivial by `t^a`.
The regular connection `d + (εI) dt` over `ℚ[ε]/ε²` with its gauge trivialization `1 + εt`. The
operator `d/dx` of order one and the divided-power operator of order `p` in characteristic `p`.

### Dependencies

Layer 1; CrystallineCohomology CR.1.3; ComplexComparisonPartII; ComplexKahlerGeometry;
ComplexManifolds; AnalyticToricGeometry; AlgebraicVectorBundles; SchemeAndStackFoundations
§§1.14–1.16; Mathlib and Tau Ceti as listed. The stage order is §2.2's algebraic operators and
all-order principal parts, then ComplexComparisonPartII C5.1's analytic operator adapter, then
§2.4's connection application, with C−1.1 and C0.3–C0.4 supplying the same carriers below. The
prefix uses K1–K4 and the shared algebraic connection operations, not §2.4's manifold, toric,
group or gauge applications.

## Layer 3: formal loop groups, connections and quotient prestacks (F3)

### 3.1 Formal loop groups and congruence subgroups (F3.1)

For the native commutative coordinate Hopf algebra `H` of an affine group `G`, define
`LG(R) = G(F_R)`, `L⁺G(R) = G(O_R)` and `K_N(R) = ker(G(O_R) → G(R[t]/t^N))` for `N ≥ 1`. Use
`TauCeti.HopfAlgebra.points`, its convolution group law and the native counit-derivation Lie
algebra. Construct their functors and maps, congruence inclusions, normality of `K_N` in `L⁺G`,
separation `∩_N K_N = {1}`, the proalgebraic presentation of `L⁺G` by jets, and the inverse-limit
description of `K_N`. In characteristic zero construct
`exp_N : (t^N 𝔤_R[[t]], BCH) ≃* K_N(R)`, its inverse `log_N`, naturality in `R`, derivative equal
to the identity at zero, and compatibility in `N`. For `M > N` construct the finite-jet
equivalence `(t^N 𝔤_R[[t]]/t^M 𝔤_R[[t]], BCH) ≃* K_N(R)/K_M(R)` and all quotient-map commuting
squares; no exponentiation of an arbitrary locally nilpotent module is implied.

- `LG`, `L⁺G` and `K_N` are group functors on commutative `k`-algebras, with `K_(N+1) ⊂ K_N`
  normal in `L⁺G` and `L⁺G/K_N ≃ G(R[t]/t^N)`.
- `exp_N` and `log_N` are mutually inverse natural bijections intertwining the
  Baker–Campbell–Hausdorff group law with the group law of `K_N`.
- `Lie(LG) = 𝔤((t))` with the coefficientwise bracket, computed by dual-number points (§3.2).

**Checks.**

- `G = 𝔾_m`: `LG(R) = R((t))ˣ`, `K_N(R) = 1 + t^N R[[t]]`, and for a field `R` every unit is
  `a t^n u` with `u ∈ K_1(R)`. For `R = ℂ[ε]/ε²` the unit `1 + εt⁻¹`, with inverse `1 − εt⁻¹`, has no
  such form: the valuation description fails for nonreduced `R`, and the functor must be defined
  on all `R`.
- `G = GL_n`: conjugating `1 + t^N X` by `g ∈ GL_n(R[[t]])` gives `1 + t^N gXg⁻¹ ∈ K_N`, so
  `K_N` is normal; `∩_N K_N = {1}` since a matrix congruent to `1` modulo every `t^N` is `1`.
- `exp_1(t) = 1 + t + t²/2 + ⋯ ∈ K_1(ℚ)` for `G = 𝔾_m`; over `𝔽_p` the series does not exist,
  so the characteristic-zero hypothesis is needed. `G = 1` gives trivial groups at every stage.

*Needs:* Tau Ceti `HopfAlgebra.points` and the counit-derivation Lie algebra; Layer 1;
ReductiveGroups Layer 0.

### 3.2 Ind-affine presentation and coefficient descent (F3.2)

Construct `LG` as an ind-affine functor by bounding poles in a finite presentation of `H` and of
the inverse point. Prove the presentation's independence of embedding and cofinal bounds,
functoriality and the fpqc sheaf condition, including nonreduced `R`. Bound inverses as well as
matrix entries: `GL_n` loops with bounded entries alone do not specify an invertible loop. For
every faithfully flat coefficient map `R → S` put `S₂ = S ⊗_R S` and `S₃ = S ⊗_R S ⊗_R S`. Prove
that finite projective `R((t))`-modules are equivalent to finite projective `S((t))`-modules `M`
with descent isomorphism `S₂((t)) ⊗_f M ≃ S₂((t)) ⊗_g M`, where `f(a) = 1 ⊗ a` and `g(a) = a ⊗ 1`
coefficientwise. Over `S₃` let `θ_ij` map the pullback from factor `j` to that from factor `i`;
require `θ_13 = θ_12 ∘ θ_23`. Descend all module morphisms, preserving tensor, dual, composition
and identity (Drinfeld, Theorem 3.11). Prove this by §1.3's Tate descent and topologically
nilpotent-automorphism equivalence, with the completed-base-change/standard-topology comparison.
In particular the overlap is `(S ⊗_R S)((t))`, not an assumed ordinary scalar-tensor identity.
Construct the additional Hopf-coordinate, faithful-representation/reduction and relative
continuous-connection descent maps, with their cocycle and gauge compatibility, that turn this
module theorem into the `LG` and connection/torsor prestacks used here. Those additional
structures remain targets of this layer; ordinary fpqc descent over `Spec R((t))` alone does not
supply coefficient-ring descent. Construct `Lie(LG) = 𝔤((t))`, jets and the differential of group
morphisms by dual-number points, compatible with the native convolution tangent bracket.

- The pole-bounded subfunctors `LG_(≤N)` are affine, `LG = colim_N LG_(≤N)`, and the colimit is
  independent of the faithful representation.
- `LG` is an fpqc sheaf on commutative `k`-algebras, and the connection and torsor prestacks of
  §3.4 satisfy coefficient-ring descent.
- `Lie(LG)(R) = 𝔤 ⊗_k F_R` with `[x ⊗ f, y ⊗ g] = [x, y] ⊗ fg`.

**Checks.**

- `G = 𝔾_m`: the loop `t^(−N)` has poles bounded by `N` and inverse `t^N`; the loop
  `1 + εt^(−N)` over `ℂ[ε]/ε²` has inverse `1 − εt^(−N)`; a bound on `g` alone admits `g = t⁻¹`
  with every inverse bound exceeded by `g^(−1) = t` only after rebounding, so both bounds enter the
  presentation.
- For `R = k` and `S = k[x]`, `Σ_(n≥0) x^n t^n ∈ S((t))` is not in `S ⊗_k k((t))`; the descent
  overlap `(S ⊗_R S)((t))` is likewise larger than `S((t)) ⊗_(R((t))) S((t))`.
- For `R = S` the descent datum is the identity and the equivalence is the identity; for
  `S = R × R` it is the statement that a module is determined by its two restrictions and the
  identification on the empty overlap of the two factors.

*Needs:* §1.3; §3.1; SchemeAndStackFoundations §1.1; ReductiveGroups Layer 1.

### 3.3 Connections on the trivial torsor and the gauge action (F3.3)

Construct `Conn_G(R) = {d + A(t) dt : A ∈ 𝔤 ⊗_k F_R}`; finite dimension identifies this
algebraic tensor with the relative Tate coefficient module. Define `dlog(g) = (dg) g⁻¹`
intrinsically through dual-number tangent translation and prove `gauge(g, A) = Ad(g)A − dlog(g)`,
the cocycle identity `dlog(gh) = dlog(g) + Ad(g) dlog(h)`, and
`gauge(h, gauge(g, A)) = gauge(hg, A)`. With `g = 1 + εx`, the infinitesimal variation is
`[x, A] − x′`. Construct the tautological relative connection.

- `gauge` is a left action of `LG(R)` on `Conn_G(R)`, natural in `R`.
- `dlog` is a crossed homomorphism `LG → 𝔤((t)) dt` for the adjoint action.
- The infinitesimal gauge action of `x ∈ 𝔤((t))` is the vector field `A ↦ [x, A] − x′ = −∇_ad x`.

**Checks.**

- `G = 𝔾_m`: `dlog(gh) = (gh)′/(gh) = g′/g + h′/h`, and `gauge(t, A) = A − t⁻¹`.
- `(1 + εx) A (1 − εx) − ε x′ = A + ε([x, A] − x′)`, the displayed variation.
- `gauge(h, gauge(g, A)) = hgA(hg)⁻¹ − h g′ g⁻¹ h⁻¹ − h′h⁻¹ = gauge(hg, A)`.

*Needs:* §§3.1–3.2; §2.3 for principal connections.

### 3.4 The gauge groupoid and `Loc_G(D×)` (F3.4)

Construct the action groupoid of trivialized connections, with actual `Groupoid` instances,
base-change functors and naturality: source `A`, target `gauge(g, A)`, unit `1`, inverse `g⁻¹`,
composite `h` after `g` is `hg`. Its fpqc stackification on coefficient algebras is `Loc_G(D×)`.
Identify its objects intrinsically as relative connections on torsors trivializable after a
coefficient-ring fpqc cover. Construct the groupoid of all `G`-torsors with relative connection
over `F_R` using Layer 2, and the comparison functor; prove full faithfulness and the stated
essential-image criterion. Prove that torsors extending to `O_R` are in this image for smooth
`G` by formal lifting after trivializing their `t = 0` fibre. Layer 6 proves the all-torsor
comparison on `ℂ`-points. Ordinary fpqc local triviality over `Spec F_R` is not by itself the
coefficient-cover criterion over `Spec R`. Prove stabilizers equal horizontal automorphisms, and
construct the deformation complex `[𝔤((t)) → 𝔤((t)) dt]` with differential `∇_ad`. Quotient sets
retain only isomorphism classes; downstream category descent consumes the groupoid/prestack,
including stabilizers.

- The gauge groupoid is a prestack in groupoids on commutative `k`-algebras; `Loc_G(D×)` is its
  stackification, and the comparison functor to torsors with connection is fully faithful.
- The automorphism group of `d + A dt` is `{g : gauge(g, A) = A}`, the horizontal sections of the
  adjoint torsor; its Lie algebra is `ker(∇_ad)`.
- Isomorphism classes over a field `R` are the gauge orbits.

**Checks.**

- `G = 𝔾_m`, `R = ℂ`: gauge by `t^n` changes `d + a dt` by `−n t⁻¹ dt`, and gauge by
  `exp(f)`, `f ∈ tℂ[[t]]`, changes it by `−f′ dt`; the isomorphism classes are the pairs
  (irregular part in `t⁻²ℂ[t⁻¹] dt`, residue in `ℂ/ℤ`).
- Stabilizers over `ℂ`: `gauge(g, a) = a` means `g′ = 0`, so `g ∈ ℂˣ`; over `ℚ[ε]/ε²` the same
  holds, while over `𝔽_p` the non-constant `t^p` would also stabilize, which the characteristic-zero
  convention excludes.
- `G = 1`: the groupoid has one object and one arrow.

*Needs:* §§3.2–3.3; §2.3; SchemeAndStackFoundations §§1.14–1.18.

### Examples

The rank-one classification of `Loc_(𝔾_m)(D×)(ℂ)` by irregular part and residue modulo `ℤ`;
the unit `1 + εt⁻¹` of `ℂ[ε]/ε²((t))` as a loop that is neither positive nor polynomial-times-
positive in the field-valued sense; the deformation complex `[ℂ((t)) → ℂ((t)) dt]` with differential
`d` for `G = 𝔾_m`, whose cohomology is `ℂ` in each degree.

### Dependencies

Layers 1–2, Tau Ceti Hopf points, ReductiveGroups Layers 0–1 and SchemeAndStackFoundations
§§1.1, 1.14–1.18. No oper, Poisson or representation-theoretic notion enters.

## Layer 3A: polynomial loops, full cocharacters and positive quotients (F3A)

Fix a connected reductive complex algebraic group `G` with specified maximal torus `T`, Borel `B`
and pinning of its derived root directions. Retain its actual perfectly paired lattices
`X = X*(T)`, `Y = X_*(T)`, roots and coroots, including central directions; no integral
central/derived splitting is assumed. Polynomial functors and their formal comparison below are
on all commutative complex algebras `R`, including nonreduced `R`. Weyl normalizer formulas and
Cartan orbit labels below are on complex points, not a classification of every `R`-point by a
single constant cocharacter.

### 3A.1 Polynomial functors and coefficient maps (F3A.1)

Define `L_poly G(R) = G(R[t, t⁻¹])` and `L_poly⁺G(R) = G(R[t])` on the same native Hopf-point
functor as §3.1. Consume FormalLaurentPuiseux L1's coefficient tower and §1.1's relative
extension, with the actual finite-support monomial formulas over `R`. Export inclusion into the
formal `LG` and `L⁺G`, evaluation at `0` on positive loops, its constant section and congruence
kernels; prove functor laws, injectivity and all coefficient/point squares. Positive polynomial
loops are regular maps `𝔸¹ → G`. The underlying quotient `L_poly G / L_poly⁺G` is a coset
functor, not a quotient group; the positive subgroup is generally not normal. Use the existing
subgroup-coset and sheaf quotient carriers, and construct their comparison maps. The coefficient
maps are `polynomialLoopToFormal` (through `laurentPolynomialToLaurentSeries`, which sends the
Laurent variable to the unit `formalParameterUnit`) and `positiveLoopToFormal`, both by
post-composition of Hopf points.

- `polynomialLoopToFormal` and `positiveLoopToFormal` are injective group homomorphisms natural
  in `R` and in `H`.
- `L_poly⁺G ∩ (image of K_N)` is the kernel of evaluation modulo `t^N` on `G(R[t])`.
- Evaluation at `0` splits `L_poly⁺G(R) → G(R)` by the constant loops.

**Checks.**

- `G = 𝔾_m`: `laurentPolynomialToLaurentSeries` sends `T^n` to `t^n`, and `R[t, t⁻¹]ˣ` for a
  field `R` is `{a t^n}`, strictly smaller than `R((t))ˣ`.
- `G = SL₂`, `R = ℂ`: the positive loop `[[1, t], [0, 1]]` has constant term `1` and is not
  constant; conjugating it by `[[0, 1], [−1, 0]]` gives `[[1, 0], [−t, 1]]`, still positive, while
  conjugating by `diag(t, t⁻¹)` gives `[[1, t³], [0, 1]]` and `diag(t, t⁻¹)` itself is not positive:
  the positive subgroup is not normal.
- `G = 1`: all functors are the point.

*Needs:* §3.1; §1.1; FormalLaurentPuiseux L1; Mathlib `LaurentPolynomial`, `HahnSeries.single`.

### 3A.2 Polynomial/formal quotient comparison and the torsor lane (F3A.2)

Construct the canonical natural map `G(R[t, t⁻¹])/G(R[t]) → G(R((t)))/G(R[[t]])` and prove it
bijective for every commutative complex algebra `R`. Identify both sides with Layer 6's
affine-Grassmannian functor and its fpqc/étale sheaf presentation, preserving their actual
quotient maps, actions and base change. For injectivity prove `R[t, t⁻¹] ∩ R[[t]] = R[t]` in
`R((t))` coefficientwise and apply the affine Hopf presentation. For surjectivity prove
`G(R((t))) = G(R[t, t⁻¹]) G(R[[t]])` by the following owned torsor lane, before invoking that
factorization; density alone is not a proof.

Construct formal-disc/`𝔸¹` gluing and restriction equivalences for affine `G`-torsors with
trivializations, using SchemeAndStackFoundations' early fpqc torsor/descent interfaces. Prove
Henselian lifting for a smooth torsor with specified trivial fibre, and patching across `t = 0`
and infinity with the actual ring-square diagrams. Establish the precise `ℙ¹` triviality
theorem: a `G_R`-torsor on `ℙ¹_R` trivial at infinity is trivial on `𝔸¹_R`. Here `G_R` is split
and hence totally isotropic; the target is this complex-base-change specialization, not arbitrary
anisotropic reductive groups (Česnavičius–Fedorov, *A toral version of the Grothendieck–Serre
conjecture*, Theorem 4.2, cesnavicius-fedorov line 721; restated as Česnavičius, *The affine
Grassmannian as a presheaf quotient*, Theorem 16, cesnavicius-presheaf line 332).

Own the lower inputs used to prove that theorem: Quillen locality for an `𝔸¹` torsor to descend
to the base; the split simply connected isotropic semilocal reduction, including surjectivity of
the residue-field loop-coset map by root-group lifts and Chinese remainders; triviality on `𝔸¹`
over the residue fields under the specified infinity trivialization; and pointed `ℙ¹` rigidity
for families whose geometric fibres are trivial. Construct the latter via the trivial-bundle locus
in the existing torsor stack, deformation controlled by `H¹(ℙ¹, O) = H²(ℙ¹, O) = 0` and descent of
the infinity trivialization. Construct the torus case from the relative Picard/cocharacter
calculation and the reductive reduction along `G_der^sc × Z(G)⁰ → G`: finite central-kernel
lifting obstructions, the degree-power pullback on `ℙ¹`, geometric-fibre lifts and their specified
infinity lifts. These are construction targets of this lane, not assumed generic `Bun_G` results
or a new general moduli owner. The reductions use actual finite central maps without an integral
lattice splitting. Combine them with diagonal-section translation over `R[u]` to obtain `𝔸¹`
triviality, then the patching contradiction proving polynomial factorization. This proof lane is
independent of opers, compact forms and critical centres.

Česnavičius, Theorems 17 and 19 (cesnavicius-presheaf lines 334–369), with the `ℙ¹` input above,
are the precise proof route. Theorem 19 is the polynomial-loop presentation
`G(R((t)))/G(R[[t]]) ≃ G(R[t, t⁻¹])/G(R[t])` over every ring for reductive `G` with totally
isotropic adjoint quotient; a connected reductive complex group is split, so its base change to
every complex algebra `R` qualifies (cesnavicius-presheaf lines 330–331). Its surjectivity half,
the factorization `G(R((t))) = G(R[t, t⁻¹])·G(R[[t]])`, is stated in `Suggested.lean` as
`formalLoop_eq_polynomial_mul_positive` on native Hopf points. Polynomial, formal, Henselian and
localized-algebraic loop conventions are distinguished by their coefficient rings; terminology
alone does not identify their groups.

- The comparison map is a natural bijection of coset functors compatible with the left
  `G(R[t, t⁻¹])`-action and base change.
- `formalLoop_eq_polynomial_mul_positive`: for every connected reductive `G = Spec H` over `ℂ`,
  every commutative `ℂ`-algebra `R` and every `g ∈ G(R((t)))`, there are `p ∈ G(R[t, t⁻¹])` and
  `q ∈ G(R[[t]])` with `g = p·q` in `G(R((t)))`.
- The `ℙ¹` triviality theorem and its lower inputs hold for every commutative `ℂ`-algebra `R`,
  including nonreduced ones.

**Checks.**

- `G = 𝔾_m`, `R` a field: the factorization is the unique decomposition of a unit of `R((t))` as
  `a t^n` times a unit of `R[[t]]` with constant term `1`.
- `R = ℂ[ε]/ε²`: the unit `1 + εt⁻¹` is already a polynomial loop, with positive factor `1`; the
  factorization must not require the positive factor to be constant or the polynomial factor to
  be a monomial.
- `G = 1`: both sides are a point. `G = SL₂`, `R = ℂ`: `[[1, t⁻¹ + t⁻² + ⋯], [0, 1]]` with the
  geometric series `(1 − t)⁻¹ t⁻¹` factors as the polynomial loop `[[1, t⁻¹], [0, 1]]` times
  `[[1, (1 − t)⁻¹ t⁻¹ − t⁻¹], [0, 1]] = [[1, (1 − t)⁻¹], [0, 1]]`, which is positive.
- Injectivity witness: `t⁻¹ + t ∈ R[t, t⁻¹]` lies in `R[[t]]` only if `t⁻¹` does, which fails;
  `R[t, t⁻¹] ∩ R[[t]] = R[t]` coefficientwise.

*Needs:* §3A.1; §§3.2, 3.4; SchemeAndStackFoundations §§1.14–1.18; ReductiveGroups Layers 4, 6, 9;
Layer 6's lattice Grassmannian presentation for the identification of both sides.

### 3A.3 Normalizer and the full translation lattice (F3A.3)

Construct the ordinary conjugation action `W → Aut(Y)`, using the inverse of the native
contravariant/opposite coweight action. With translation first use
`(λ, w)(μ, v) = (λ + wμ, wv)` on `Y ⋊ W`, and give the inverse dictionary to the factor order
`W ⋉ Y`. Put `t^λ = λ(t)`, prove `t^(λ+μ) = t^λ t^μ` and `n_w t^λ n_w⁻¹ = t^(wλ)`. Prove
`N_G(T)(ℂ[t, t⁻¹])/T(ℂ[t]) ≃ Y ⋊ W` and the corresponding formal normalizer quotient modulo
`T(ℂ[[t]])`, compatibly with coefficient inclusion (Iwahori–Matsumoto, *On some Bruhat
decomposition and the structure of the Hecke rings of p-adic Chevalley groups*, §1–§2, for the
affine Weyl group presentation). Laurent units of the split torus have unique `a t^n` form; the
multiplication defects of chosen finite normalizer lifts lie in `T(ℂ)` and vanish in these
quotients. No splitting `W → N_G(T)(ℂ)` is asserted.

Identify the affine Coxeter subgroup as `Q^∨ ⋊ W`, with `Q^∨` the actual coroot span in `Y`, and
its extended quotient as `Y/Q^∨`. Construct the component map and its comparison with the
Grassmannian's connected components. Central translations have length zero and the length-zero
alcove stabilizer need not be finite. Define dominant `Y` by `α_i(λ) ≥ 0`, transport the finite
dual-root chamber theorem of RootSystems to the actual integral lattice with central directions,
and prove uniqueness of dominant orbit representatives. Compare `Y` with the compact exponential
kernel of §4.3 by `λ ↦ dλ(2πi)`, not by equality of unrelated carriers.

- `Y ⋊ W` is a group with the displayed law, `Q^∨ ⋊ W` is its Coxeter subgroup, and
  `(Y ⋊ W)/(Q^∨ ⋊ W) ≃ Y/Q^∨` as sets with the component map.
- Every `W`-orbit in `Y` contains exactly one dominant cocharacter.
- The normalizer quotient isomorphism intertwines `t^λ ↦ (λ, 1)` and `n_w ↦ (0, w)`.

**Checks.**

- `G = 𝔾_m`: `W = 1`, `Q^∨ = 0`, `Y = ℤ`, and `ℂ[t, t⁻¹]ˣ/ℂ[t]ˣ = {a t^n}/ℂˣ ≃ ℤ`.
- `G = SL₂`: `Y = ℤα^∨ = Q^∨`, `Y/Q^∨ = 0`; `G = PGL₂`: `Y = ℤ(α^∨/2)`, `Y/Q^∨ = ℤ/2`; `G = GL_n`:
  the determinant leaves `Y/Q^∨ = ℤ`.
- `(λ, w)(μ, v)(ν, u) = (λ + wμ + wvν, wvu)` in both bracketings; the factor order `W ⋉ Y` has
  `(w, λ)(v, μ) = (wv, v⁻¹λ + μ)`, a different formula for the same group.
- `n_w t^λ n_w⁻¹ = t^(wλ)`: for `SL₂`, `n = [[0, 1], [−1, 0]]` and `t^λ = diag(t, t⁻¹)` give
  `n t^λ n⁻¹ = diag(t⁻¹, t) = t^(−λ)`.

*Needs:* §3A.1; ReductiveGroups Layers 4, 7, 9; RootSystems; §4.3 for the compact comparison.

### 3A.4 Iwahori, parabolic and real-root formulas (F3A.4)

Define `I_poly(R) = ev₀⁻¹(B(R))` in `G(R[t])` and `I_form(R) = ev₀⁻¹(B(R))` in `G(R[[t]])`, with
their natural inclusions and flag-coset maps. For the chosen positive finite roots prove the
affine-positive root bounds `n ≥ 0` for `α > 0` and `n ≥ 1` for `α < 0` on `x_α(u t^n)`. Prove
`t^λ` conjugates that parameter by `t^(α(λ))`. For each irreducible derived component the real
roots are `α + nδ` and the diagram is its untwisted affine diagram; central tori add no root
vertices.

On complex points prove that the subgroup generated by `I_poly` and the finite simple
negative-root directions is `G(ℂ[t])`; compare it with the positive formal parahoric and Layer 6's
actual ind-scheme quotients. Its omitted nodes are the extending nodes, one per derived
component. It is a maximal standard parabolic in the irreducible affine root setting; for a product
with multiple nontrivial derived components it is not maximal in the full product, and a root-free
torus has no extending node. Do not infer arbitrary-ring generation of all `G(R[t])` from this
complex-point statement. KacMoody KM8A compares its separately constructed untwisted minimal group
with these polynomial loops; that comparison is KacMoody's, and nothing here consumes it.

- `I_poly` and `I_form` are subgroup functors with `I_poly = I_form ∩ G(R[t])` inside `G(R((t)))`.
- `x_α(u t^n) ∈ I` iff `n ≥ 0` for `α > 0`, iff `n ≥ 1` for `α < 0`;
  `t^λ x_α(u t^n) t^(−λ) = x_α(u t^(n + α(λ)))`.
- The real roots of the loop algebra of an irreducible component are `{α + nδ}`, with simple
  affine roots the finite simple roots and `−θ + δ`.

**Checks.**

- `G = SL₂`: `I_poly(ℂ)` is the matrices in `SL₂(ℂ[t])` whose constant term is upper triangular;
  `[[1, 1], [0, 1]] ∈ I` and `[[1, 0], [t, 1]] ∈ I`, while `[[1, 0], [1, 1]] ∉ I`.
- `t^λ = diag(t, t⁻¹)` conjugates `[[1, u], [0, 1]]` to `[[1, t² u], [0, 1]]`, so `α(λ) = 2`.
- `G = SL₂ × SL₂`: two extending nodes; omitting only one gives a parabolic that is not maximal in
  the product. `G = 𝔾_m`: no roots, `I = G(R[t])`.

*Needs:* §3A.3; ReductiveGroups Layers 7, 9; RootSystems.

### 3A.5 Positive double cosets (F3A.5)

After Layer 6's formal Cartan decomposition, prove the polynomial positive double-coset comparison
and the compatible bijections between the double cosets of `G(ℂ[t])` on both sides of
`G(ℂ[t, t⁻¹])`, the double cosets of `W` on both sides of `Y ⋊ W`, the orbits `Y/W` and the
dominant cocharacters `Y⁺`. Specify the two-sided orbit relation and all representative maps and
inverses. Prove the first comparison by positive root-jet/stabilizer factorization on the actual
bounded lattice strata (or equivalently the compatible `ℙ¹` bundle argument): the formal positive
action on each complex point orbit must be shown to have the same orbits as the polynomial
positive action. The Grassmannian bijection alone is insufficient. An arbitrary truncation of an
invertible formal matrix can have nonconstant determinant and is not a polynomial `GL_n` point;
preserve the unit/inverse equations in this factorization. The middle comparison removes the `W`
factor on the right and changes `λ` by `W` on the left. This indexes positive-group orbits, not the
individual points of `LG/L⁺G`. Export inverse-coset and antidominant-convention transports and
retain the full component group `Y/Q^∨`.

- `G(ℂ[t]) \ G(ℂ[t, t⁻¹]) / G(ℂ[t]) ≃ Y⁺`, compatibly with the formal
  `G(ℂ[[t]]) \ G(ℂ((t))) / G(ℂ[[t]]) ≃ Y⁺` of Layer 6.
- `W \ (Y ⋊ W) / W ≃ Y/W ≃ Y⁺`.
- Inversion `g ↦ g⁻¹` sends the class of `t^λ` to that of `t^(−λ)`, whose dominant representative
  is `t^(−w₀λ)`.

**Checks.**

- `G = GL₂`: `t^λ = diag(t, 1)` and `diag(1, t)` are in one positive double coset (conjugate by
  the Weyl element), with dominant representative `(1, 0)`; `diag(t, t)` is central with
  `Y/Q^∨`-component `2`.
- Truncation witness: the scalar loop `(1 − t)⁻¹·1 ∈ GL₂(ℂ((t)))` has determinant `(1 − t)⁻²`;
  truncating its entries to `1 + t` gives determinant `(1 + t)²`, not a unit of `ℂ[t]`, so the
  truncation is not a `GL₂(ℂ[t])` point.
- `G = 𝔾_m`: the double cosets are the integers `n`, every `n` is dominant, and inversion is
  `n ↦ −n`.

*Needs:* §§3A.2–3A.4; Layer 6's Cartan decomposition and lattice strata.

### 3A.6 Boundary computations and construction order (F3A.6)

Give the `G = 1`, `𝔾_m`, `SL₂`, `PGL₂`, `GL_n` and `SL₂ × SL₂` calculations: for `𝔾_m`, `W = 1`,
`Q^∨ = 0` and `Y = ℤ`; for `SL₂`, `Y` is the coroot lattice; for `PGL₂` it is the index-two
enlargement; for `GL_n` the determinant leaves `Y/Q^∨ = ℤ`. Verify the reducible parabolic
qualification and central length-zero directions. Polynomial loops evaluate to smooth loops on
`S¹`, but arbitrary formal series need not converge there, and neither a group identification nor
a homotopy equivalence is asserted.

**Checks.**

- `PGL₂`: the cocharacter `α^∨/2` is `t ↦ [diag(t, 1)]`, with `(α^∨/2)(t)² = [diag(t², 1)] =
  [diag(t, t⁻¹)] = α^∨(t)`; its class generates `Y/Q^∨ = ℤ/2`.
- `GL_n`: `det ∘ λ = t^(Σ λ_i)`, zero exactly on `Q^∨`.
- The formal loop `Σ_(n≥0) n! t^n` is a unit of `ℂ[[t]]` with constant term `1` that converges
  at no nonzero complex `t`; it defines no loop on `S¹`.

The order within the layer is §3.1/§3A.1 coefficient/point definitions → early algebraic
root/lattice/Iwahori maps from ReductiveGroups and RootSystems → Layer 6's basic lattice
Grassmannian/flag geometry and formal Cartan decomposition → §3A.2 torsor comparison and §3A.5
positive-orbit comparison. The semilocal torsor lemmas are constructed independently of the
desired polynomial quotient theorem. Layer 6's later affine-Springer cycle/oper argument consumes
these exports; no oper-reduction, critical-centre, representation-category or KacMoody
group-comparison return edge supplies them.

### Examples

`𝔾_m`, `SL₂`, `PGL₂`, `GL_n` and `SL₂ × SL₂` as above; the unit `1 + εt⁻¹` over `ℂ[ε]/ε²` as a
polynomial loop with no monomial normal form; the geometric-series `SL₂` loop of §3A.2 and its
explicit polynomial-times-positive factorization.

### Dependencies

Layers 1–3, ReductiveGroups Layers 4, 6, 7, 9, RootSystems, SchemeAndStackFoundations
§§1.14–1.18, FormalLaurentPuiseux L1, and the lattice-Grassmannian and Cartan-decomposition
targets of Layer 6 for §§3A.2 and 3A.5 only. Nothing from KacMoody or AffineLieAlgebras.

## Layer 4: intrinsic opers and the Drinfeld–Sokolov/Kostant slice (F4)

### 4.1 Intrinsic opers (F4.1)

For a pinned split semisimple group define an oper as a principal connection plus a Borel
reduction whose second fundamental form lies in the open `B`-orbit of `𝔤^(−1)/𝔟`, where
`𝔤^(−1) = 𝔟 ⊕ Σ_i 𝔤_(−α_i)`: its negative-simple-root components are units and its other
negative-root components vanish (Frenkel, *Langlands correspondence for loop groups*, §4.2.1,
pp. 108–109, frenkel-loop line 4816). Make this a sheaf condition, construct arrows preserving
the reduction, restriction and base change. For an arbitrary connected reductive group use the same
condition on its derived-root directions and retain the central connection directions. Prove the
`B`-gauge presentation with invertible coefficients `ψ_i f_i` (Frenkel, §4.2.2, equation (4.2-1),
line 4871).

- An oper over `R` is a triple (torsor, connection, `B`-reduction) satisfying the transversality
  condition; arrows are isomorphisms of torsors with connection preserving the reduction.
- Locally in the fpqc topology on `R`, an oper is `d + Σ_i ψ_i(t) f_i dt + v(t) dt` with `ψ_i`
  units of `F_R` and `v ∈ 𝔟 ⊗ F_R`, up to `B(F_R)`-gauge.
- Base change along `R → S` preserves the condition and the presentation.

**Checks.**

- `PGL₂`: `d + [[a, b], [ψ, c]] dt` is an oper for the standard Borel iff `ψ` is a unit; `ψ = t`
  over `ℂ((t))` qualifies, `ψ = t` over `ℂ[[t]]` does not, and `ψ = 0` never does.
- The sheaf condition is fpqc-local: for `R = ℂ[ε]/ε²` the series `ψ = ε + t⁻¹` is a unit of
  `R((t))`; the unit condition is tested in `R((t))`, not in `(R/ε)((t))` alone.
- A torus has no roots and every connection with its unique Borel reduction is an oper (§4.4).

*Needs:* §§3.3–3.4; §2.3; ReductiveGroups Layers 7, 9.

### 4.2 Normalization for adjoint groups (F4.2)

For adjoint semisimple `G`, use the simple-root character isomorphism of `T` to normalize all
`ψ_i` to `1`, obtaining `(d + f + 𝔟((t)) dt)/N((t))` with `f = Σ_i f_i` (Frenkel, §4.2.2,
equation (4.2-2) and the display following it, lines 4896–4910). The normalized `N`-quotient does
not automatically describe a nonadjoint group's opers; central isogenies, lift torsors and
stabilizers must be retained by the intrinsic presentation.

**Checks.**

- `PGL₂` over any `R`: `diag(s, 1)` conjugates `ψ` to `s⁻¹ψ`, so `s = ψ` normalizes it; the
  simple-root character `diag(s, 1) ↦ s` is an isomorphism `T → 𝔾_m`.
- `SL₂` over `ℚ`: `diag(s, s⁻¹)` conjugates `ψ` to `s⁻²ψ`, so `ψ = 2` cannot be normalized to `1`
  over `ℚ`; the adjoint hypothesis is needed and the lift torsor of §4.4 records the defect.
- The normalized `sl₂` presentation `d + [[a, b], [1, −a]] dt` modulo `N((t))`: the gauge
  `[[1, u], [0, 1]]` sends it to `d + [[a + u, b − 2au − u² − u′], [1, −a − u]] dt`, so `u = −a` is
  the unique choice killing the diagonal, giving `d + [[0, b + a² + a′], [1, 0]] dt`.

*Needs:* §4.1; ReductiveGroups Layers 4, 6.

### 4.3 The lower analytic dictionary, Chevalley–Kostant adapter and Drinfeld–Sokolov normal form (F4.3)

This section has four parts, in order: the lower algebraic/analytic dictionary of `G(ℂ)` on the
native Hopf-point carrier; the Chevalley restriction theorem, imported from LieHighestWeight
Layer 7 with the adapters owned here; a compact real form with matched torus and pinning,
consumed by NilpotentOrbits and used for the comparison with CharacteristicClasses C5.1 but by no
proof here; and the principal `sl₂`, exponents, Kostant slice, regular locus and Drinfeld–Sokolov
normal form. No part consumes a compact Chevalley theorem.

**Lower dictionary.** First establish the algebraic rank required by §2.4. For a connected
reductive complex affine group `G = Spec H`, put `I = ker ε` and let `𝔤` be the native
counit-valued derivations `Derivation ℂ H (TauCeti.Bialgebra.CounitAlgebra ℂ H ℂ)`. Construct the
algebraic left Maurer–Cartan trivialization `Ω¹_(H/ℂ) ≃ H ⊗_ℂ (I/I²)` and `I/I² ≃ 𝔤^∨`,
compatible with translations and base change. Smoothness and finite type give finite local
freeness, so `Ω¹_(G/ℂ)` has constant rank `d = dim_ℂ 𝔤` before analytification. Take
ReductiveGroups Layer 1's faithful closed representation, apply §2.4 with this rank, and identify
its topology and atlas with the matrix-subspace realization including `det⁻¹` on `GL_N`. Use the
Spec adjunction to identify its point carrier with native `TauCeti.HopfAlgebra.points`, namely
`WithConv (H →ₐ[ℂ] ℂ)`. Transport the topology and atlas to this fixed native carrier; retain its
existing group structure. Prove that regular multiplication, unit and inverse correspond exactly
to convolution, counit and antipode. All subsequent `G(ℂ)` Lie-group and continuous-homomorphism
statements use this carrier. Regular group operations give its complex Lie-group structure. Use
the native complex Lie algebra `GroupLieAlgebra 𝓘(ℂ, Fin d → ℂ) G(ℂ)`, whose bracket is
`mlieBracket` of the left-invariant tangent fields at `1`. §2.4's `τ_e` lands first in
`Der_ℂ(O_(G,e), ℂ)`. Construct restriction along `H → O_(G,e)` as a complex-linear equivalence
from germ derivations to the displayed global counit derivations. Its inverse localizes `D` by
`D(a/s) = D(a)/ε(s) − ε(a)D(s)/ε(s)²` for `ε(s) ≠ 0`; prove representative independence, Leibniz
and the two inverse laws. Compose this with `τ_e`. Prove bracket compatibility with no minus sign:
`D^L h = Σ h_(1) D(h_(2))`, with coproduct `Δ = μ*` and the left group factor first; thus the
commutator at `1` evaluates to `D*E − E*D`, the native counit bracket.

Own the realification comparison: with ComplexManifolds Milestone 1's named realification `G(ℂ)_ℝ`
of the same carrier, construct the real-linear tangent equivalence from the underlying real vector
space of `GroupLieAlgebra 𝓘(ℂ, Fin d → ℂ) G(ℂ)` to the real `GroupLieAlgebra` of `G(ℂ)_ℝ`, prove it
preserves brackets by comparing the real and complex derivatives of the invariant fields in
realified charts, and apply the native Tau Ceti `LeftInvariantDerivation` equivalence only to
`G(ℂ)_ℝ`, with its finite-dimensional, smooth and identity-interior hypotheses. Transport
multiplication by `i` to that real derivation algebra; prove `J² = −1` and the complex bilinearity
`[JX, Y] = J[X, Y] = [X, JY]`, and prove compatibility with the algebraic map above, the bracket,
adjoint maps, central/derived splitting and Cartan restrictions. The realification of `𝔤` has
real dimension `2d`; it is not the algebra that a real form complexifies.

Own the holomorphic exponential chart: transport LieGroups Layer 0's `lieExp` of `G(ℂ)_ℝ` through
the realification comparison to a map `exp_G : 𝔤 → G(ℂ)` that is holomorphic, has derivative the
identity at `0`, restricts on each complex line `ℂX` to the one-parameter subgroup `z ↦ exp(zX)`,
and is a biholomorphism from a neighbourhood of `0` onto a neighbourhood of `1` by K1's manifold
inverse theorem. In the faithful matrix representation it is `Matrix.exp`.

Prove analytic connectedness using root generation. Initially choose a maximal torus `T₀`, Borel
`B₀` and pinning. ReductiveGroups Layer 8's full-root-datum classification identifies `G` with the
complex base change of Layer 9's pinned Chevalley group; transport its root maps and commutator
laws, retaining the central torus and central-isogeny data. Layer 4 identifies `T₀ ≃ 𝔾_m^r`.
Consume Layer 7's Levi theorem for `B₀`, and prove its regular-cocharacter application
`Z_G(λ) = T₀`, giving `B₀ = T₀ ⋉ U₀`. Own the ordered-positive-root multiplication isomorphism
`∏_(α>0) 𝔾_a ≃ U₀`: derive its root-height filtration and additive quotients from the transported
commutator laws, with change-of-pinning laws. Specialize Layer 7's Bruhat theorem to the split
complex-point group: `G(ℂ) = ⋃_(w∈W) B₀(ℂ) n_w B₀(ℂ)`, with actual representatives `n_w`. Prove
this point-level specialization from its scheme cells or double-coset statement, using §2.4's
point dictionary and weak Nullstellensatz as required. Prove `n_α = x_α(1) x_(−α)(−1) x_α(1)`
represents each simple reflection in the transported rank-one normalization. Every complex point
is then a finite product of torus and root points. Their analytic images are path connected and
contain `1`, since `ℂ` and `ℂˣ` are path connected. Finite products and their union are path
connected, proving `G(ℂ)° = G(ℂ)`.

Complete the lower dictionary before any compact-form statement. Identify `Z(G)⁰` with its
Layer 4/Layer 6 torus, its points with `(ℂˣ)^m` and analytic Lie algebra with `𝔷(𝔤)`. Apply §2.4
to Layer 6's closed smooth `G_der` and its closed immersion; compare its analytic tangent with
`[𝔤, 𝔤]` through Layer 2's differential/adjoint maps. Apply the preceding root-generation argument
also to `G_der`, proving its complex point subgroup connected. Compare the central multiplication
`Z(G)⁰ × G_der → G`, its finite central kernel and its actual surjective complex-point map. The
tangent isomorphism and §2.4's local inverse give its finite covering/local biholomorphism laws.

**Chevalley restriction.** Import LieHighestWeight Layer 7's `lieChevalleyRestrictionIso` for the
semisimple Lie algebra `[𝔤, 𝔤]` over `ℂ` with Cartan subalgebra `𝔥_ss = 𝔥 ∩ [𝔤, 𝔤]`, together with
its restriction-map equation, `lieChevalleyRestrictionIso_mem_homogeneous_iff` and
`killingSymmetricEquiv_cartan_restriction` to pass to invariant polynomial functions
`S([𝔤,𝔤]*)^([𝔤,𝔤]) ≃ S(𝔥_ss*)^W`. Own the following adapters.

- Group versus Lie-algebra invariants: for a connected affine group `G` over a characteristic-zero
  field and a finite-dimensional rational representation `V` with differential `𝔤 → End(V)`,
  prove `V^G = V^𝔤`. The inclusion `⊂` is differentiation of the coaction. For `⊃`, the stabilizer
  of `v ∈ V^𝔤` is a closed subgroup scheme whose Lie algebra is the stabilizer of `v` in `𝔤`
  (ReductiveGroups Layer 3A's Cartier smoothness in characteristic zero makes the stabilizer
  smooth, so its Lie algebra is the scheme-theoretic one), hence equals `𝔤`; a smooth closed
  subgroup of full dimension of a connected group is the whole group (ReductiveGroups Layer 3).
  Apply this degreewise to `S^n(𝔤*)`.
- Central splitting: with `𝔤 = 𝔷(𝔤) ⊕ [𝔤, 𝔤]` and `𝔥 = 𝔷(𝔤) ⊕ 𝔥_ss` (ReductiveGroups Layer 6),
  `W` acts trivially on `𝔷(𝔤)`, and `S(𝔤*)^𝔤 = S(𝔷*) ⊗ S([𝔤,𝔤]*)^([𝔤,𝔤])`,
  `S(𝔥*)^W = S(𝔷*) ⊗ S(𝔥_ss*)^W`; restriction is the tensor product of the identity and the
  semisimple restriction.
- Export `S(𝔤*)^G ≃ S(𝔥*)^W` as the composite, with the homogeneous-degree compatibility.
- Rational descent: for the pinned Chevalley model over `ℚ`, prove descent of the restriction
  matrix and isomorphism from `ℂ` to `ℚ` (the restriction map is defined over `ℚ`, and an
  isomorphism of finite-dimensional graded pieces defined over `ℚ` that becomes an isomorphism over
  `ℂ` is one over `ℚ`), and flat base change of the finite-degree rational coaction invariant
  kernels to any characteristic-zero field `k`. Identify the split Cartan and Weyl action under
  these maps.

**Compact form and matched torus.** Prove that `G(ℂ)` with the structure above satisfies the
hypotheses of LieGroups Layer 7's compact-real-form milestone: it is a connected finite-dimensional
complex Lie group whose Lie algebra `𝔤` is reductive with `Z(G)⁰(ℂ) ≃ (ℂˣ)^m`. Consume that
milestone for an embedded compact real form, and replace it by its identity component `K = K°`;
the identity component of a compact Lie group is open and has the same Lie algebra, so `K`
remains a compact real form, with `Lie(K) ⊗_ℝ ℂ ≃ 𝔤` through the realification comparison. Choose a
maximal torus `T_K` by LieGroups Layer 6. In the faithful matrix representation, compactness
bounds all positive and negative powers of each torus element. Prove this forces semisimplicity
and eigenvalues of modulus one; simultaneous diagonalization of the commuting family gives finitely
many integral torus characters. Prove faithfulness makes these weights generate `X*(T_K)`. Their
integral relation lattice defines an embedded algebraic torus `T ⊂ G`; prove it is the Zariski
closure of `T_K`, `Lie(T) = Lie(T_K) ⊗_ℝ ℂ`, `K ∩ T = T_K`, and maximality by the Cartan comparison.
Consume ReductiveGroups Layer 7's conjugacy of algebraic maximal tori to choose `g` with
`gT₀g⁻¹ = T`; conjugate `B₀` and every pinned root map by `g`. For this new pinning identify each
algebraic root's restriction to `T_K` with LieGroups Layer 6's compact character, the pair
`𝔤_α ⊕ 𝔤_(−α)` with the corresponding real compact root-plane complexification, and the coroot
through the normalized rank-one map. With `dχ_α = iα` and `α(α^∨) = 2` prove `dν_alg(1) = −iα^∨`
and `d(ν_alg|_(S¹))(i) = α^∨`; the complex rank-one differential sends `diag(1, −1)` to `−iα^∨` and
the compact one sends `diag(i, −i)` to `α^∨`. Match the chosen `x_(±α)` derivatives and `n_α`
through this same pinning and verify the character/cocharacter pairing. Prove the central summands
and both Cartan restrictions match. Establish `N_K(T_K)/T_K ≃ N_G(T)/T`: injectivity uses
`K ∩ T = T_K`; surjectivity uses Layer 6's compact rank-one representatives and the now matched
reflections. Retain the action on the Cartan dual and centre. Prove `K` is Zariski dense using
the holomorphic exponential chart: its restriction to `Lie(K)` agrees with the included
compact-group exponential, so under a real basis of `Lie(K)` and its complexification the chart
sends a real open box into `K`. A regular function vanishing on `K` pulls back to a holomorphic
function vanishing on that box; iterated one-variable uniqueness makes it zero on a complex
neighbourhood. Own the connected-manifold identity continuation: use finite-dimensional chart
analyticity (K3.0) and the normed-space identity theorem on connected chart balls, then overlapping
chart chains on the connected complex manifold to propagate this zero germ to `G(ℂ)`. Smooth `G`
is reduced; use §2.4's strong Nullstellensatz to obtain zero in `ℂ[G]`. Apply this separation to
coaction matrix entries in each finite homogeneous rational representation, obtaining
`V^G = V^(G(ℂ)) = V^K`. Through the realification and complexification maps and the matched root
data, identify the complexification of C5.1's real compact invariant polynomials with these complex
coaction invariants, intertwining the Cartan restriction, central factor and Weyl action; this
identifies C5.1's compact restriction with the algebraic restriction above. It is a comparison,
consumed by NilpotentOrbits, and is not the proof of the restriction isomorphism.

**Principal `sl₂`, exponents, slice and normal form.** Construct the principal `sl₂` triple
`(e, h = 2ρ^∨, f)` for the chosen oper-negative principal `f`. Here `ρ^∨` is the rational Cartan
element with `α_i(ρ^∨) = 1`, not an assumed cocharacter of every group. Prove `[h, e] = 2e`,
`[h, f] = −2f` and `[e, f] = h`, so the principal grading is `ad(ρ^∨) = ad(h)/2`. Define the
semisimple exponents `d_i` as its integer eigenvalues on `ker(ad e)`, with multiplicities; central
directions contribute degree `0` separately. Construct a homogeneous basis `p_i` of
`V_can = ker(ad e) ⊂ 𝔟` and prove `𝔟 = [f, 𝔫] ⊕ V_can` by the `sl₂` decomposition (Frenkel,
§4.2.4, pp. 112–113, lines 4991–5010; Kostant, *Lie group representations on polynomial rings*,
cited by locator, uncertified). Construct the principal slice `f + V_can` and prove its map to the
adjoint quotient is an isomorphism, meeting each regular geometric orbit once. Prove the
restriction's differential and graded inverse using this complement, then homogeneous polynomial
generators of `S(𝔤*)^G` of degrees `d_i + 1`. Establish their equality with the root-system
exponent convention through this constructed principal grading. Define the regular locus by
minimal centralizer dimension; prove codimension `≥ 3` of its complement in positive semisimple
rank by the Jordan/centralizer and rank-one stratum calculation, and prove regular nilpotents form
one geometric orbit containing `f`, with their simple-component criterion in `𝔫` and unique
containing Borel. Retain central affine factors, all characteristic-zero descent and nonreduced
`R` uses. These invariant/slice theorems are finite geometric construction targets, independent
of the quantum centre. Prove each `d + f + v(t)` has a unique `N((t))` gauge carrying it into
`d + f + Σ q_i(t) p_i`, functorially over every `R`, with regular `O_R` version via `N[[t]]`
(Frenkel, Lemma 4.2.2, line 5011, after Drinfeld–Sokolov). The root-height algorithm terminates
coefficientwise; prove existence, uniqueness, freeness and recovery of the gauge element.

- Exports consumed downstream: the fixed carrier, topology, atlas and tangent/counit bracket
  comparison of `G(ℂ)`; connectedness; the central-torus/closed-derived/finite-isogeny dictionary;
  `exp_G`; the restriction isomorphism `S(𝔤*)^G ≃ S(𝔥*)^W` with its rational descent; the matched
  compact torus and pinning with `V^G = V^K`; the principal triple, exponents, slice, regular
  locus, regular-nilpotent orbit, simple-component criterion and unique Borel; the
  Drinfeld–Sokolov normal form with its gauge.

**Checks.**

- `𝔰𝔩₂`: `S(𝔤*)^G = ℂ[det]`, of degree `2 = d₁ + 1`; restriction to `𝔥` sends `det` to `−h²`, and
  `S(𝔥*)^W = ℂ[h²]` for `W = ℤ/2` acting by `h ↦ −h`. The principal triple is the standard one,
  `ρ^∨ = h/2`, `ker(ad e) = ℂe` of degree `1`, the slice is `f + ℂe = {[[0, q], [1, 0]]}` with
  `det = −q`, and the complement of the regular locus is `{0}`, of codimension `3`.
- `𝔤𝔩₂`: the central direction adds the degree-one invariant `tr`; `S(𝔥*)^W = ℂ[h₁ + h₂, h₁h₂]`
  has generators of degrees `1, 2`, matching exponents `0` (central) and `1`. `𝔰𝔩₃`: exponents
  `1, 2`, generator degrees `2, 3`, `dim ker(ad e) = 2 = rank`, and `1 + 2 = 3` is the number of
  positive roots.
- Connectedness is needed for `V^G = V^𝔤`: for `G = μ₂ ⊂ 𝔾_m` acting on `ℂ[x]` by `x ↦ −x`,
  `𝔤 = 0` so every polynomial is `𝔤`-invariant, while the `G`-invariants are the even polynomials.
- Torus matching: in `𝔾_m(ℂ) = ℂˣ`, bounded positive and negative powers force `|z| = 1`; the
  Zariski closure of `S¹` is `𝔾_m`, and its characters restrict to `z ↦ z^n`. A finite subgroup
  `μ_n` also has bounded powers but Zariski closure `μ_n`: the maximal-torus hypothesis, not
  boundedness alone, produces the algebraic torus.
- Realification: for `G = 𝔾_m`, the realified Lie algebra is `ℝ²`, while `Lie(S¹) = iℝ`
  complexifies to `ℂ`; `exp_G = exp : ℂ → ℂˣ` has derivative `1` at `0` and sends the real box
  `i(−a, a)` into `S¹`.
- Drinfeld–Sokolov normal form for `𝔰𝔩₂`: by §4.2's computation, `d + [[a, b], [1, −a]] dt`
  has the unique `N((t))`-representative `d + [[0, b + a² + a′], [1, 0]] dt` with gauge
  `[[1, −a], [0, 1]]`; for `a = t`, `b = 0` the coordinate is `q = t² + 1`. Over `R = ℂ[ε]/ε²` with
  `a = ε t⁻¹`, `b = 0`: `q = ε² t⁻² − ε t⁻² = −ε t⁻²`.
- Regular nilpotents in `𝔰𝔩₂` are the nonzero nilpotents, one orbit containing `f`; the zero
  matrix is nilpotent with centralizer of dimension `3`, not regular.

*Needs:* §2.4; §4.2; ReductiveGroups Layers 1–4, 6–9; LieHighestWeight Layer 7; LieGroups
Layers 0, 6, 7; ComplexManifolds Milestone 1; ComplexKahlerGeometry K1, K3.0; CharacteristicClasses
C5.1 (comparison only); Mathlib `GroupLieAlgebra`, `LeftInvariantDerivation`, `Matrix.exp`;
Tau Ceti counit derivations and gluing.

### 4.4 Regular and punctured opers; central isogenies (F4.4)

Construct `Op_G(D)` and `Op_G(D×)` as their regular and punctured coefficient functors and
identify them with the intrinsic moduli for adjoint `G` (Frenkel–Gaitsgory, *Local geometric
Langlands correspondence and affine Kac–Moody algebras*, §1). Prove the regular inclusion is a
monomorphism and a closed immersion into every applicable pole-bound stage. Include product groups
and tori. For a semisimple central isogeny `G → G_ad`, construct the forgetful functor of
intrinsic oper groupoids and identify its fibre over an adjoint oper with lifts of its underlying
connection and Borel reduction; build the obstruction gerbe and its band `Z(G)`, and the action
of the Picard groupoid of `Z(G)`-torsors on its lifts when nonempty. For reductive `G` the
projection `G → G_ad` has possibly positive-dimensional centre: construct the lifting obstruction
with central connection data. When that obstruction vanishes, identify the nonempty lift groupoid
as a torsor under central torsors with connection, with horizontal `Z(G)` as its automorphism
band. Prove horizontal central automorphisms are the stabilizers of a lift. A torus oper is
exactly a torus connection. This comparison never replaces the intrinsic nonadjoint oper stack by
an adjoint coefficient set.

- `Op_G(D)(R) ⊂ Op_G(D×)(R)` is the locus of Drinfeld–Sokolov coordinates in `R[[t]]`, a closed
  immersion into each stage `Op_(≤N)` of Layer 5.
- The fibre of `Op_G(D×) → Op_(G_ad)(D×)` over a point, when nonempty, is a torsor under the
  groupoid of `Z(G)`-torsors with connection over `D_R×`, with automorphisms the horizontal `Z(G)`.
- For a torus `T`, `Op_T(D×)(R) = 𝔱 ⊗ F_R dt` with the trivial groupoid structure.

**Checks.**

- `SL₂ → PGL₂` over `ℂ((t))`: the `PGL₂`-oper `d + [[0, q], [1, 0]] dt` has the two
  non-isomorphic `SL₂`-lifts `d + [[0, q], [1, 0]] dt` and
  `d + [[−1/(2t), tq], [t⁻¹, 1/(2t)]] dt`, the second obtained by the gauge `diag(√t, 1/√t)`,
  which is not in `SL₂(ℂ((t)))`; they differ by the `μ₂`-torsor with connection `d − (1/(2t)) dt`,
  whose residue `−1/2` is not an integer, so it is not gauge-trivial. Both have unit `(2, 1)`-entry,
  so both are opers on `D×`; only the first is regular.
- Over `ℂ[[t]]` every `μ₂`-torsor is trivial, so a regular `PGL₂`-oper has a unique regular
  `SL₂`-lift up to isomorphism.
- `T = 𝔾_m`: `Op_T(D×)(R) = F_R dt`, and `Op_T(D)(R) = O_R dt` is the closed subfunctor of series
  with no polar part.

*Needs:* §§4.1–4.3; §3.4; ReductiveGroups Layer 6; SchemeAndStackFoundations §§1.14–1.18 for the
gerbe and Picard groupoid.

### Examples

`PGL₂`: opers are `d + [[0, q], [1, 0]] dt`, their normalization, their `SL₂`-lifts and the
projective-connection model of Layer 5. `𝔰𝔩₂`, `𝔤𝔩₂` and `𝔰𝔩₃` invariants, exponents and slices
as above. `μ₂ ⊂ 𝔾_m` as the disconnected counterexample to `V^G = V^𝔤`.

### Dependencies

Layers 2–3, ReductiveGroups Layers 1–9, LieHighestWeight Layer 7, LieGroups Layers 0, 6, 7,
ComplexManifolds Milestone 1, ComplexKahlerGeometry K1 and K3.0, CharacteristicClasses C5.1 for the
comparison only. The order inside §4.3 is lower dictionary → Chevalley restriction (which uses only
the lower dictionary and LieHighestWeight) → compact form and matching → principal `sl₂`, slice
and normal form (which use the restriction isomorphism and the lower dictionary, never the
compact form).

## Layer 5: coordinates, functions and worked operators (F5)

### 5.1 The coordinate action on opers (F5.1)

Construct pullback of opers by `Aut(O)`. For adjoint `G` rescale by `ρ^∨(φ′)` after substituting
`t ↦ φ(t)`, then reapply the unique Drinfeld–Sokolov gauge (Frenkel, §4.2.3, equation (4.2-3),
pp. 110–111, line 4913); prove the resulting group action, coefficient formulas, continuity and
invariance of the regular locus. Prove coordinate independence by gluing this action over the
torsor of formal coordinates on a smooth curve. In rank one the inhomogeneous term is projective;
higher coefficients transform triangularly, not all as primary tensor densities.

- The action is a right action of `Aut(O)(R)` on `Op_G(D×)(R)`, natural in `R`, preserving
  `Op_G(D)(R)`.
- The induced `H`-bundle of an oper is `ρ^∨`-twisted canonical: its transition function under
  `t = φ(s)` is `ρ^∨(φ′(s))` (Frenkel, Lemma 4.2.1, line 4985).
- The infinitesimal action of `ε(t)∂_t` on the coordinate `q_i` of degree `d_i + 1` is
  `ε q_i′ + (d_i + 1) ε′ q_i` plus lower-order corrections from the gauge, with the Schwarzian term
  only in the degree-two coordinate.

**Checks.**

- Rescaling `φ = at`: the Schwarzian of `at` vanishes, so in rank one `q^φ(t) = a² q(at)`, with
  `ρ^∨(a) = [diag(a^(1/2), a^(−1/2))] = [diag(a, 1)]` in `PGL₂`.
- Cocycle of the Schwarzian: for `φ = at`, `ψ = t + t²`, `{φ∘ψ, t} = {ψ, t} = −6/(1 + 2t)²`,
  since the Schwarzian is invariant under affine post-composition and `{φ, ψ}(ψ′)² = 0`; the
  general law `{φ∘ψ, t} = {φ, ψ}(ψ′)² + {ψ, t}` is what makes the pullback an action.
- The identity coordinate acts trivially, and `(q^φ)^ψ = q^(φ∘ψ)` by §1.2's contravariance; the
  wrong order would give `q^(ψ∘φ)`, which for `φ = 2t`, `ψ = t + t²` differs already on the
  substitution.

*Needs:* §1.2; §§4.2–4.3; ReductiveGroups Layer 4 for `ρ^∨`.

### 5.2 Oper function algebras (F5.2)

For rank `ℓ` use stages `Op_(≤N) ≃ (t^(−N) R[[t]])^ℓ` and their closed inclusions. Define their
coordinate algebras `A_N = k[q_(i,j) : 1 ≤ i ≤ ℓ, j ≥ −N]`, with restriction `A_(N+1) → A_N`
sending the newly allowed negative coefficients to zero. Construct `Fun Op(D×) = lim_N A_N` as a
complete separated topological `k`-algebra, with kernel-of-restriction neighbourhoods;
`Fun Op(D) = A_0` is a discrete polynomial algebra. Prove the representability of each stage, the
ind-affine presentation, its independence of uniform versus coordinatewise cofinal bounds,
evaluation at every `R`-point and naturality. For a finite tuple `q = (q_i) ∈ R((t))^ℓ`, construct
a common `N` with `coeff_j(q_i) = 0` for `j < −N`; define `eval_q : A →ₐ[k] R` by composing
`proj_N` with the native polynomial evaluation `X_(i,j) ↦ coeff_j(q_i)`. Prove equality of these
algebra maps for every admissible `N`, and `eval_q(q_(i,j)) = coeff_j(q_i)` for every integer `j`.
These evaluation, generator and stage-independence laws are the suppliers for central-character
fibres, with the given `Algebra k R` embedding. Restriction to regular functions is exactly
`proj_0`; evaluation at a regular tuple factors through it. Prove adjacent-stage compatibility,
upward closure of admissible bounds, the stage-kernel inclusion certifying discrete-target
continuity, and naturality under coefficientwise `k`-algebra maps `R → S`, including Artinian
targets. The conversion from an intrinsic adjoint oper to its tuple is the Drinfeld–Sokolov
coordinate identification of §4.3. Prove every stage projection `A → A_N` is surjective and
`A/ker(proj_N) ≃ A_N`, by constructing compatible polynomial lifts to the other stages. For
discrete test algebras `R`, prove the natural bijection
`Op(D×)(R) ≃ {χ : A →ₐ[k] R | Continuous χ}`: continuity makes `χ` kill a projection kernel,
stage representability gives its unique Laurent tuple, and cofinal compatibility makes it
independent of `N`. Classify regular-oper characters by power-series tuples in the same way.
This classification is for discrete targets; a general topological target need not annihilate any
projection kernel. Coordinate pullback is a continuous algebra automorphism. This is neither the
polynomial algebra in every Laurent coefficient nor functions on the coarse `Loc` quotient.
Construct continuous cotangent sheaves and derivations from their stage/completed presentations,
not unrestricted algebraic Kähler differentials of this inverse-limit ring. For a finite
`k`-module `V` the completed coefficient module is `V((t)) ⊗^! A`, explicitly
`lim_(M,N) (V((t))/t^M V[[t]]) ⊗ A_N`. It allows the pole bound to vary with `N`; the universal
oper is such a compatible family, not a Laurent series over `A` with one global lower bound.
Construct its universal connection and the completed differential maps used in Layer 8.

- `Fun Op(D×)` is a complete separated linearly topologized `k`-algebra with `A/ker(proj_N) ≃ A_N`,
  and `Fun Op(D) = A_0` is its discrete quotient by the ideal `I` generated by `q_(i,j)`, `j < 0`.
- `eval_q` is a continuous `k`-algebra map natural in `R`, and `q ↦ eval_q` is a bijection onto
  continuous characters for discrete `R`.
- The continuous cotangent module `Ω¹_cont` is the completed kernel of §8.2, with
  `d q_(i,j)` as topological generators and `[d f, d g] = d{f, g}` in Layer 7.

**Checks.**

- Rank one, `q = t⁻²`: `N = 2` is admissible, `eval_q(q_(−2)) = 1` and all other generators map to
  `0`; `N = 5` gives the same algebra map.
- The character `q_j ↦ 1` for all `j ∈ ℤ` is an algebra map `A → k` that kills no projection
  kernel; it is not continuous and corresponds to no Laurent series, which separates `Fun Op(D×)`
  from the polynomial algebra in all coefficients.
- Over `R = k[ε]/ε²`, the tuple `q = εt⁻⁷` has `eval_q(q_(−7)) = ε` and is not regular, while
  its reduction modulo `ε` is the regular oper `0`; regularity is tested on all of `R`.
- `Fun Op(D)` is discrete: the kernel of `proj_0` is open, and `A_0 = k[q_(i,j) : j ≥ 0]` is a
  polynomial algebra with no topology beyond the discrete one.

*Needs:* §4.3; §1.1 for `⊗^!`; Mathlib `MvPolynomial` evaluation.

### 5.3 `PGL_n` opers as scalar operators (F5.3)

For `G = PGL_n`, `n ≥ 2`, identify the upper-Hessenberg/`N` presentation (ones just below the
diagonal, zero farther below, trace zero) with monic scalar differential operators of order `n`
having zero `∂^(n−1)` coefficient, from `ω^((1−n)/2)` to `ω^((1+n)/2)` (Frenkel, §4.2.5,
equations (4.2-13)–(4.2-14), pp. 116–117, line 5176, and §4.1.2 for `n = 2`). For even `n`
specify a square root of `ω` for this scalar model and prove its projective independence; the
intrinsic `PGL_n`-oper needs no such choice. Construct cyclic flags and the inverse companion
presentation. Derive signs by eliminating horizontal sections, rather than declaring the source's
upper-triangular stars companion data.

- The elimination map is a bijection from the Hessenberg gauge classes to scalar operators with
  the stated symbols, natural under coordinate change on both sides.
- The companion matrix of a scalar operator is a `PGL_n`-oper, inverse to elimination.
- The two square roots of `ω` give the same space of operators (Frenkel, §3.5.7, p. 97).

**Checks.**

- `n = 2`: `d + [[0, q], [1, 0]] dt` with horizontal sections `y′ + Ay = 0` gives `y₁ = −y₂′` and
  `(∂² − q) y₂ = 0`, so `L_q = ∂² − q`.
- `n = 2` with diagonal `(a, −a)` and entry `q`: elimination gives `y₂″ − (q + a² + a′) y₂ = 0`,
  with no first-order term; this is the Drinfeld–Sokolov coordinate `q + a² + a′` of §4.2,
  computed independently.
- `n = 3`: the Hessenberg form `[[0, u, v], [1, 0, w], [0, 1, 0]]` with trace zero gives a monic
  third-order operator with zero `∂²` coefficient; a nonzero diagonal would contribute a `∂²`
  term, which the trace-zero condition removes.

*Needs:* §§4.2–4.3; §2.2.

### 5.4 The `PGL₂` model (F5.4)

For `PGL₂` pin `A_q = [[0, q], [1, 0]]` and `L_q = ∂² − q`. Prove
`q^φ = (φ′)² q(φ) − ½(φ‴/φ′ − (3/2)(φ″/φ′)²)` (Frenkel, §3.5.7, equation (3.5-12), p. 98,
line 4435). Compute the infinitesimal action `δ_ε q = ε q′ + 2ε′ q − ½ε‴` (Frenkel, equation
(3.5-11), line 4427), composition and inverse identities. For `q = 0` and `q = 1`, prove the opers
are distinct but their regular formal connections are gauge-isomorphic: solve `g′ = g A₀ − A₁ g`
with `g(0) = 1` and `det g = 1`, and pass its `SL₂` gauge to `PGL₂`. Define formal
`c(t) = Σ t^(2j)/(2j)!` and `s(t) = Σ t^(2j+1)/(2j+1)!`; verify the explicit gauge
`[[c − ts, −s], [−s + tc, c]]` by coefficient differentiation and `c² − s² = 1`. This is an actual
witness of noninjectivity of `Op → Loc`, including automorphisms, without the analytic
exponential.

**Checks.**

- With `g = [[c − ts, −s], [−s + tc, c]]`: `g(0) = 1`, `det g = c² − s² = 1`,
  `gA₀ − A₁g = [[−tc, −c], [ts, s]]` and `g′ = [[−tc, −c], [ts, s]]`, using `c′ = s`, `s′ = c`; so
  `gauge(g, A₀) = A₁`.
- `δ_ε q` for `ε = t`: `tq′ + 2q`, the weight-two scaling; for `ε = t³`, the Schwarzian term
  contributes `−3`.
- `q = 0` and `q = 1` have different coordinates `q_0 = 0` versus `q_0 = 1`, so `Op(D) → Loc(D)`
  is not injective on `ℂ`-points; the gauge `g` has nontrivial stabilizer contribution only through
  `±1`, the centre of `SL₂`.

*Needs:* §§5.1–5.3; §2.4's `regularGauge`.

### Examples

The rank-one coordinate action, its Schwarzian cocycle, and the `q = 0`/`q = 1` witness. The
discontinuous character `q_j ↦ 1` as a non-example for `Fun Op(D×)`. The `n = 2` and `n = 3`
Hessenberg eliminations and the agreement of the `n = 2` elimination with the Drinfeld–Sokolov
coordinate.

### Dependencies

Layers 1, 2 and 4; ReductiveGroups Layer 4; Mathlib polynomial evaluation. No Poisson or
representation-theoretic input.

## Layer 6: oper reduction over the punctured disc (F6)

### 6.1 The theorem and the finite-monodromy classification (F6.1)

Prove that every flat bundle for every complex connected reductive algebraic `G` over `ℂ((t))`
has an intrinsic oper reduction (Frenkel–Zhu, *Any flat bundle on a punctured disc has an oper
structure*, Theorem 1, frenkel-zhu line 67; Frenkel, *Langlands correspondence for loop groups*,
Conjecture 10.1.1, p. 310, line 12882, which this theorem settles). This is essential
surjectivity on `ℂ`-points; it is not a claim of a global section or of arbitrary `R`-family
surjectivity. Include triviality of `G`-torsors over `ℂ((t))` as a theorem (obtain, as in §6.4, the
procyclic absolute Galois group and cohomological dimension `≤ 1`, and Steinberg's `H¹`-vanishing
for connected linear groups over such a field, Steinberg, *Regular elements of semi-simple
algebraic groups*, Theorem 1.9, steinberg line 134), so the matrix quotient and the intrinsic
statement agree.

For the source's local arithmetic analogy, construct the finite-image classification of
continuous homomorphisms from its procyclic Galois group into `G(ℂ)`, with the usual complex
topology (Frenkel, §1.2.6, pp. 17–19, line 978). Consume §4.3's faithful continuous matrix realization and
the native `Matrix.linftyOpNormedRing` and `Matrix.linftyOpNormedAlgebra` real normed-algebra
structures on matrices; compare the native `Units` topology on invertible matrices with the complex
matrix-group topology. Native `ContinuousMonoidHom.exists_mem_nhds_one_forall_le_ker` supplies a
neighbourhood of `1` containing only subgroups killed by the homomorphism. Shrink it to a clopen
neighbourhood using `nhds_basis_clopen` and then consume
`IsTopologicalGroup.exist_openSubgroup_sub_clopen_nhds_of_one` (or native
`ProfiniteGrp.exist_openNormalSubgroup_sub_open_nhds_of_one`). The kernel contains that open
subgroup and is open; its compact discrete quotient is finite. Faithfulness gives finite image in
`G(ℂ)`. Identify the procyclic source with native `TauCeti.zHat`. Evaluate at `TauCeti.zHat.gen`
and use `TauCeti.zHat.hom_ext` for uniqueness into the Hausdorff target monoid `G(ℂ)`. For a
finite-order element give its finite cyclic subgroup the discrete compact totally disconnected
topological-group structure, apply `TauCeti.zHat.lift` there, use `lift_gen` and `lift_unique`
(or `liftEquiv`), and compose with its proved continuous inclusion into `G(ℂ)`. Prove the
resulting bijection with finite-order elements and compatibility with conjugacy. This supplies the
finite-monodromy side of the source's arithmetic/connection comparison; Layer 8 and
GeometricRepresentationCategories preserve it as motivation rather than an additional
unconditional representation-category equivalence. Do not infer the oper theorem from the
displayed quotient or from the finite-dimensional Kostant theorem.

- The theorem: for every connected reductive `G` over `ℂ` and every `A ∈ 𝔤((t))`, there is
  `g ∈ G(ℂ((t)))` with `gauge(g, A)` an oper matrix `Σ ψ_i f_i + v` with units `ψ_i` and
  `v ∈ 𝔟((t))`; equivalently `Op_G(D×)(ℂ) → Loc_G(D×)(ℂ)` is surjective.
- Continuous homomorphisms `ẑ → G(ℂ)` correspond bijectively to finite-order elements of `G(ℂ)`,
  compatibly with conjugation.

**Checks.**

- `G = 𝔾_m`: every connection `d + a dt` is an oper for the unique Borel, so the theorem is the
  identity; `H¹(ℂ((t)), 𝔾_m) = 0` since `ℂ((t))` is a field.
- Connectedness is needed for torsor triviality: `H¹(ℂ((t)), μ₂) = ℂ((t))ˣ/(ℂ((t))ˣ)² = ℤ/2`,
  generated by `t`.
- `G = 𝔾_m`: a homomorphism `ẑ → ℂˣ` sending the generator to `z` is continuous iff `z` is a root
  of unity, since the kernel must be open, hence of finite index.
- Noninjectivity persists: §5.4's `q = 0`, `q = 1` are distinct opers with isomorphic
  connections, so the theorem is essential surjectivity only.

*Needs:* §§6.2–6.5; §4.3; Tau Ceti `zHat` and no-small-subgroups; Mathlib matrix norms and open
subgroups.

### 6.2 Cyclic vectors and the `GL_n` flag/oper equivalence (F6.2)

Define a differential module over a differential field `(F, ∂)` as a finite-dimensional
`F`-vector space `V` with an additive map `D : V → V` satisfying `D(fv) = ∂(f)v + f·Dv`, and a
cyclic vector of `V` as a `v ∈ V` whose iterates `v, Dv, …, D^(n−1)v`, `n = dim V`, form a basis.
Prove the cyclic-vector theorem: if `F` has characteristic zero and `∂ ≠ 0`, every differential
module over `F` has a cyclic vector (Deligne, *Équations différentielles à points singuliers
réguliers*, Ch. II, Lemme 1.3, pp. 42–43, deligne-lnm163 lines 1367–1401: with `m` maximal such
that some `e` has `e, De, …, D^(m−1)e` independent and `t ∈ F` with `∂t ≠ 0`, the vectors
`e + λ t^k f` for rational `k` and scalars `λ` force `m = n`). Prove Katz's explicit form as a
second route: if `(n−1)!` is invertible in `F`, `∂t = 1`, `e` is a basis and `a_0, …, a_(n(n−1))`
are distinct constants, then one of the explicit candidates `c(e, t − a_i)` is cyclic (Katz,
*A simple algorithm for cyclic vectors*, Theorems 1 and 2, pp. 65–66, katz-cyclic lines 38–44).
Over `F = ℂ((t))` with `∂ = d/dt` the theorem is the `G = GL_n` case of §6.1 by an independent
proof (Frenkel–Zhu, Remark 1, frenkel-zhu lines 80–85). Prove the `GL_n` flag/oper equivalence: an
oper structure on a rank-`n` connection over `ℂ((t))` is a full flag with the transversality
condition, equivalently a cyclic vector up to the Borel gauge. Derive the lattice estimate:
`∇⁻¹(L)` is commensurable with `L` and its relative dimension is `≤ 0`. Spell out lattices as
`ℂ`-subspaces commensurable with an `O`-lattice and prove finiteness of the horizontal kernel.
FormalLaurentPuiseux supplies the field `ℂ((t))` and its derivation.

- Every differential module over a differential field of characteristic zero with `∂ ≠ 0` has a
  cyclic vector, hence a basis in which `D` is the companion matrix of one monic scalar
  differential equation of order `dim V` (Deligne, p. 50, deligne-lnm163 lines 1621–1631);
  neither hypothesis can be dropped.
- For `GL_n`, the oper reduction theorem is the cyclic-vector theorem; the Borel is the
  stabilizer of the flag `⟨v⟩ ⊂ ⟨v, ∇v⟩ ⊂ ⋯`.
- `[∇⁻¹(L) : L] ≤ 0` for every lattice `L`, with equality iff `L` is `∇`-stable up to the leading
  term.

**Checks.**

- Rank one: every nonzero vector is cyclic; the lattice `L = ℂ[[t]]` for `∇ = ∂ + t⁻²` has
  `∇⁻¹(L) = {f : f′ + t⁻²f ∈ ℂ[[t]]} = t²ℂ[[t]]`, of relative dimension `−2 ≤ 0`.
- `GL₂` with `∇ = ∂ + [[0, 0], [1, 0]]`: `e₁` is cyclic (`∇e₁ = e₂`), `e₂` is not
  (`∇e₂ = 0`); the flag `⟨e₁⟩ ⊂ ℂ((t))²` is the oper reduction, while `⟨e₂⟩` violates
  transversality.
- `∂ = 0` is excluded: on `V = F²` with `D = 0` no vector is cyclic, whatever the
  characteristic; a theorem without `∂ ≠ 0` is false.
- Characteristic zero is needed: over `F = 𝔽_p(t)` with `∂ = d/dt`, `∂^p` is a derivation
  vanishing on `𝔽_p[t]`, hence `∂^p = 0`; the trivial module `V = F^(p+1)`, `D = ∂` on
  coordinates, has `D^p v = 0` for every `v`, so no `v` has `p + 1` independent iterates.
- Katz's candidates for `n = 2` are `c(e, t − a) = e₀ + (t − a)(e₁ − De₀)`. On `ℂ((t))²` with
  `D = ∂` on coordinates, `e₀ = (1, t)` and `e₁ = (−t⁻¹, 0)` (a basis, of determinant `1`), the
  candidate at `a = 0` is `(1, t) + t(−t⁻¹, −1) = 0`, not cyclic, while at `a = 1` it is
  `(t⁻¹, 1)` with derivative `(−t⁻², 0)`, independent of it: no single translate serves every
  basis, and the theorem's `n(n − 1) + 1 = 3` translates do.
- The horizontal kernel of `∂ + a` on `ℂ((t))` is `ℂ` if `a ∈ dlog(ℂ((t))ˣ)` and `0` otherwise,
  finite in both cases.

*Needs:* FormalLaurentPuiseux L2; §2.2; Mathlib `Derivation` and `Module.Basis`.

### 6.3 Affine flag geometry, Cartan decomposition and the Kazhdan–Lusztig cycles (F6.3)

Construct loop Grassmannian and affine flag ind-schemes, bounded lattice charts, Iwahori and
minimal parahoric quotients, their projective stage presentations, and minimal-parahoric
`ℙ¹`-fibrations in the complex setting. Construct Schubert cells, their dimensions and closures,
complex realization, proper pushforward, and the affine Weyl action through the parahoric
correspondences. For general reductive `G` use ReductiveGroups Layer 1's faithful closed embedding
`G → GL_n` and consume Layer 6B's complex reductive coset-affineness theorem, including its fpqc
quotient and invariant-ring identification, to obtain `GL_n/G` affine. This roadmap owns the
subsequent closed reduction locus in lattice charts with the required quotient/descent proof.
Prove the complex loop Cartan decomposition `G(F) = ⊔_(λ dominant) G(O) t^λ G(O)` (Iwahori–Matsumoto,
§2). Prove the affine Weyl action's Coxeter relations and compatibility. Consume
AffineMorseLefschetz A4's compatible triangulation of projective pairs and Borel–Moore homology of
locally finite polyhedra; own the finite-stage comparison, projective-stage colimit and Schubert
fundamental-class calculations. Prove the Kazhdan–Lusztig 1988 §4 Lemma 6 specialization: each
top-dimensional irreducible component `X` of `X_A` gives nonzero `[X] ∈ H_(2 dim X)(Fℓ)`. Prove
Lemma 8's specialization that the nonzero affine-Weyl-stable image `V_A ⊂ H_(2d)(Fℓ)` generated by
these top cycles has a nonzero finite-Weyl invariant vector (Kazhdan–Lusztig, *Fixed point
varieties on affine flag manifolds*, §4, cited by locator, uncertified). On the simply connected
semisimple factor used in this proof stage, `Aut⁰(O)` is §1.2's `Aut(O)` on `ℂ`-points,
`Aut⁺(O) = ker(φ ↦ φ′(0))`, `I′ = ker(I → T(ℂ))` is the pro-unipotent radical (identify it with
`[I, I]`), and `Ã = t^(−r) A ∈ 𝔤(O)`. Convert §1.2's right substitution to a left action
`ρ_φ = σ_(φ⁻¹)` on coefficients and Hopf-valued loops. Use the semidirect product
`(g, φ)(h, ψ) = (g ρ_φ(h), φ∘ψ)`. For a coordinate path `φ_s(t) = t + sε(t) + O(s²)`, its induced
coefficient derivation is `D = −ε(t)∂`; prove the infinitesimal action and its Lie bracket with
this sign. Thus `D = t^(−r)∂` corresponds to coordinate tangent `ε = −t^(−r)`, which lies in
`Lie Aut⁺(O)` for `r ≤ −2`. Prove `Ad_(g,1)(B, D) = (Ad_g B − D(g)g⁻¹, D)` for every reductive `G`.
Prove this directly by differentiating the semidirect multiplication with Hopf-valued dual-number
points: the first component is `Ad_g B + g D(g⁻¹) = Ad_g B − D(g)g⁻¹`, interpreted by right
tangent translation. This proof includes central directions; equality of brackets with every
Lie-algebra element detects only the semisimple quotient. Compare with Frenkel–Zhu §5 Lemma 10
(frenkel-zhu line 348): `D = t^(−r)∂` lies in `Lie Aut⁰(O)` for `r ≤ −1`, while the pro-unipotent
fixed-locus stage here uses `r ≤ −2` and `Aut⁺(O)`. In particular, conjugating `(Ã, D)` by
`(g⁻¹, 1)` has first component `t^(−r) gauge(g⁻¹, A)`, so the same convention gives the gauge
equations used below. Prove `Aut⁰(O)` preserves `I` and every standard minimal parahoric `P_i`,
by its jet/root-subgroup equations. Define `j` as the proper closed-stage pushforward
`H_*(X_A) → H_*(Fℓ)`, followed by the ind-stage colimit. For
`v = (Ã, t^(−r)∂) ∈ Lie(I′ ⋊ Aut⁺(O))`, construct its `𝔾_a`-action on the affine flag stages and
identify `X_A^red` with its fixed locus. On the `P_i` quotient fixed locus obtain the fibrewise
`𝔾_a`-action on the `ℙ¹`-fibration. Construct Kazhdan–Lusztig 1980 §2's involution `σ_i` on
fixed-locus homology from this `𝔾_a`/`ℙ¹` geometry, including trivial/nontrivial fibre strata and
their gluing (Kazhdan–Lusztig, *A topological approach to Springer's representations*, §2, cited
by locator, uncertified); prove `σ_i² = 1` and `j σ_i = T_(s_i) j`, and the cancellation
`(1 + T_(s_i))[X] = 0` for a component saturated by its minimal-parahoric fibre. These specific
suppliers are targets of this layer; a generic algebraic topology reference supplies neither these
ind-scheme comparisons nor their cycle calculations.

- `Gr_G = LG/L⁺G` and `Fℓ_G = LG/I` are ind-projective; the lattice charts of bounded pole order
  are projective schemes and the Schubert cells are affine spaces of dimension the affine length.
- The affine Weyl group acts on `H_*(Fℓ)` through the parahoric correspondences, and `j` is
  equivariant.

**Checks.**

- `D = t^(−r)∂`: for `r = −1`, `t∂ ∈ Lie Aut⁰(O) = tℂ[[t]]∂` but `t∂ ∉ Lie Aut⁺(O) = t²ℂ[[t]]∂`;
  for `r = −2`, `t²∂` lies in both. This is the `r ≤ −1` versus `r ≤ −2` distinction.
- `Ad_(g⁻¹,1)(t^(−r)A, t^(−r)∂)` has first component
  `t^(−r)(g⁻¹Ag − (g⁻¹)′g) = t^(−r) gauge(g⁻¹, A)`, since `(g⁻¹)′ g = −g⁻¹ g′` and
  `gauge(h, A) = hAh⁻¹ − h′h⁻¹` with `h = g⁻¹`.
- `GL₁`: `Gr = ℤ` as a discrete set of lattices `t^n ℂ[[t]]`, the Cartan decomposition is
  `ℂ((t))ˣ = ⊔_n ℂ[[t]]ˣ t^n`, and the affine Weyl group is `ℤ` acting by translation.
- `SL₂`: the closed Schubert variety of `t^(α^∨)` in `Gr` is a two-dimensional quadric cone whose
  vertex is the base point `L₀ = ℂ[[t]]²`, the orbit of `t^(α^∨)` being its complement; the
  minimal-parahoric fibration `Fℓ → Gr` has `ℙ¹` fibres parametrizing lines in `L/tL`.

*Needs:* §§3.1–3.2, §3A.3; ReductiveGroups Layers 1, 6B, 7, 9; AffineMorseLefschetz A4; §1.2.

### 6.4 Deformed affine Springer fibres and the regular-point argument (F6.4)

For `A = Σ_(j≥r) A_j t^j` with `r ≤ −2` and nilpotent `A_r` (possibly zero), build the deformed
affine Springer fibres `Y_A` and `X_A` as the closed loci of loop lattice/flag points where
`gauge(g⁻¹, A)` has order `≥ r` and its leading term lies in the specified Borel (Frenkel–Zhu, §§3–4,
Theorem 4, frenkel-zhu line 193). Prove nilpotence, the identification of a regular-nilpotent
leading coefficient with a singleton flag fibre, the tangent-lattice dimension bound, and finite
dimension. Construct the pro-unipotent vector-field action used for the parahoric fixed-point
correspondences and prove that the top homology image is affine-Weyl stable. Establish existence
of a regular point by the nonzero fundamental-class/finite-Weyl-averaging argument. Include the
central/derived reduction to simply connected semisimple groups and all lattice and component
identifications. Consume §4.3's finite nilpotent-orbit/simple-component/unique-Borel theorems, and
prove the converse singleton-flag-fibre criterion consumed above for the deformed affine Springer
projection. Construct the convergent product of congruence gauges `exp(t^j X_j)` for a
regular-nilpotent leading coefficient using the principal `sl₂` splitting; prove convergence,
control of earlier coefficients and the nonvanishing simple-root oper condition. Combine with the
previous targets to prove Frenkel–Zhu's theorem for connected reductive `G` and compatibility
with the adjoint Drinfeld–Sokolov chart. Publish the theorem as essential surjectivity and retain
Layer 5's concrete failure of injectivity. This proof lane includes the prerequisites of the
published Frenkel–Zhu argument; neither the affine flag geometry nor its homological input is
assumed from the name of an existing roadmap.

- `X_A` is a closed finite-dimensional sub-ind-scheme of `Fℓ`, stable under the `𝔾_a`-action of
  `v`, with `X_A^red` its fixed locus.
- If some point of `X_A` has regular-nilpotent leading coefficient, then the gauge `exp(t^j X_j)`
  product converges and produces an oper matrix.

**Checks.**

- `SL₂`, `A = t^(−2) f`: the leading coefficient `f` is regular nilpotent, `X_A` is the single
  point of the flag fixed by `f`, and the oper condition holds already.
- `SL₂`, `A = t^(−2) h`: the leading coefficient at `r = −2` is semisimple, not nilpotent, so the
  construction does not apply at `r = −2`; it applies at `r = −3`, where the leading coefficient
  `A_(−3) = 0` is nilpotent (Frenkel–Zhu's choice of `r` below the pole order, frenkel-zhu
  lines 107–110), at the price of a larger `X_A`. No formal normal form enters.
- `A = 0` with `r = −2`: `X_0` contains every `t^λ I`, since `gauge(t^(−λ), 0) = λt⁻¹` has order
  `−1 ≥ −2`, but not the flag of `exp(t⁻³x)` for `x ∈ 𝔫`, whose gauge `3t⁻⁴x` has order `−4`; a
  definition without the order bound would make `X_A` all of `Fℓ` and infinite-dimensional.

*Needs:* §6.3; §4.3; §3.4.

### 6.5 Galois cohomological dimension and torsor triviality (F6.5)

Use FormalLaurentPuiseux L7's continuous profinite-group identification of the absolute Galois
group of `ℂ((t))` with native `TauCeti.zHat`. Import
`TauCeti.Topology.Algebra.Group.Profinite.ZHat.CohomologicalDimension` and use
`TauCeti.zHat.cohomologicalDimension_eq_one`; retain `cohomologicalDimensionAt_le_one` for nonzero
`p` and `cohomologicalDimensionAt_eq_one` under the prime hypothesis. Apply ProfiniteCohomology
Layer 1's restriction and compatible-pair cohomology maps along the specified profinite
isomorphism and its inverse. Construct the inverse equivalence of discrete torsion coefficient
modules and the resulting cohomology isomorphisms; Layer 11's defining vanishing criteria then
transport these dimension statements. `ℂ((t))` is perfect in characteristic zero. Construct the
nonabelian Galois/fpqc `H¹` dictionary and the Steinberg `H¹`-vanishing theorem in the stated
`ℂ((t))` connected-reductive specialization, including the derived/central-isogeny reduction; these
are targets here, not unowned arithmetic dependencies.

- `cd(Gal(ℂ((t))^sep/ℂ((t)))) = 1`, hence `H¹(ℂ((t)), G) = 1` for every connected linear `G`
  (Steinberg, Theorem 1.9).
- `H¹_fpqc(Spec ℂ((t)), G) ≃ H¹(Gal, G(ℂ((t))^sep))` for smooth affine `G`.

**Checks.**

- `H¹(ℂ((t)), 𝔾_m) = 0` by Hilbert 90; `H¹(ℂ((t)), μ_n) = ℂ((t))ˣ/n = ℤ/n`, generated by `t`,
  consistent with cohomological dimension one and inconsistent with dimension zero.
- `H²(ℂ((t)), μ_n) = 0`: the Brauer group of `ℂ((t))` vanishes, as cohomological dimension `≤ 1`
  predicts.
- The hypothesis `p ≠ 0` in `cohomologicalDimensionAt_le_one` is needed: at `p = 0` the statement
  is about the trivial coefficient.

*Needs:* FormalLaurentPuiseux L7; Tau Ceti `zHat` cohomological dimension; ProfiniteCohomology
Layers 1, 11; ReductiveGroups Layer 6.

### Examples

`𝔾_m` and `μ₂` as the connected and disconnected tests of torsor triviality; `GL₂` with the
nilpotent connection `∂ + f` as the cyclic-vector example; `SL₂` with `A = t^(−2) f` as the
singleton Springer fibre; the `r = −1`/`r = −2` witness for `Aut⁰(O)` versus `Aut⁺(O)`.

### Dependencies

Layers 1–5; FormalLaurentPuiseux L2 and L7; ReductiveGroups Layers 1, 6, 6B, 7, 9;
AffineMorseLefschetz A4;
ProfiniteCohomology Layers 1 and 11; Tau Ceti `zHat`. The order inside the layer is §6.5 and §6.2
first, then §6.3's flag geometry and Cartan decomposition, then §6.4, then §6.1's assembly. This
proof lane does not make opers depend on representation categories or critical centres.

## Layer 7: Drinfeld–Sokolov Poisson structure and continuous cotangent algebroids (F7)

### 7.1 Poisson brackets and cotangent Lie–Rinehart algebroids (F7.1)

Define an algebraic Poisson bracket by a `k`-bilinear alternating biderivation satisfying Jacobi.
Construct the cotangent Lie–Rinehart structure on `Ω¹_(A/k)` with `[da, db] = d{a, b}`, anchor
`da ↦ {a, −}`, and `[α, aβ] = a[α, β] + anchor(α)(a) β`. Use native `LieRinehartAlgebra` and its
morphisms. Extend the construction to complete coefficient algebras and Layer 1's sheaves of Tate
continuous differentials, proving continuity and descent. On `A = Fun Op(D×)` the global
continuous cotangent carrier is the completed kernel of §8.2 using `⊗^!` from §1.1; this is
already the reduced object, identified with the `N((t))`-reduction of the `Conn` action
algebroid; derivations mean the continuous submodule of `Derivation k A A`, whose closure under
`A`-scalar action and commutator is a target. Descend this native Lie–Rinehart structure to the
cotangent sheaf. On affine ordinary charts verify agreement with the native `KaehlerDifferential`
universal property.

- The cotangent algebroid of a Poisson algebra is a `LieRinehartAlgebra` over `A` whose anchor
  is the Hamiltonian map; Poisson morphisms induce algebroid morphisms.
- For a complete coefficient algebra with continuous bracket, the continuous cotangent module
  carries the same structure with continuous bracket and anchor.

**Checks.**

- `A = k[x, y]` with `{x, y} = 1`: `[dx, dy] = d{x, y} = 0`, `anchor(dx) = ∂_y`,
  `anchor(dy) = −∂_x`, and `[dx, x dy] = x[dx, dy] + anchor(dx)(x) dy = 0`.
- `A = k[x, y]` with `{x, y} = x` (the `ax + b` Lie–Poisson structure): `[dx, dy] = dx`, Jacobi
  holds trivially in two variables, and `anchor(dy)(x) = {y, x} = −x`.
- The zero bracket gives the abelian algebroid with zero anchor; the bracket `{x, y} = 1` on
  `k[x, y]/(x², y²)` in characteristic zero fails the biderivation law, since
  `{x², y} = 2x{x, y} = 2x ≠ 0 = {0, y}`.

*Needs:* Mathlib `LieRinehartAlgebra`, `KaehlerDifferential`; §1.1; §5.2.

### 7.2 The affine Poisson bracket, moment map and Hamiltonian reduction (F7.2)

Choose a nondegenerate invariant form `κ` on the finite semisimple algebra; for the dual-group
critical-centre interface fix `κ = κ₀∨`, the invariant extension of the inverse original Cartan
form. In rank one this is the trace form with `κ(h, h) = 2`. Construct `Conn`'s affine Poisson
bracket directly through residue pairing and `{H_x, H_y}(A) = H_[x,y](A) − Res κ(x dy)`. Prove
the formal cocycle, biderivation and Jacobi identities using continuous Laurent calculus, extend
continuously from coefficient functions, and identify with the affine Lie–Poisson dual hyperplane
(Frenkel, §8.3.2, pp. 246–247, line 10465; Frenkel–Gaitsgory, §4.3, lines 1810–1865). This direct
construction uses no completed enveloping algebra or quantum-centre theorem. With
`H_x(A) = Res κ(A, x) dt` and central cocycle `−κ Res(x dy)`, the canonical Lie–Poisson
Hamiltonian anchor of `dH_x` is `+∇_ad x = x′ + [A, x]`. The tangent vector labelled by a left gauge
`x` instead acts by `−∇_ad x = [x, A] − x′`; consequently the cotangent-to-gauge identification
sends `dH_x` to the gauge tangent labelled `−x`. Prove these signs and the resulting bracket
compatibility explicitly. Construct the `N((t))` moment map, identify its `f`-level with
`f + 𝔟((t))`, prove its action free (Frenkel, Lemma 4.2.2 and the display following Lemma 8.3.2's
statement, lines 10495–10509), and construct Hamiltonian reduction and the induced continuous
bracket on `Fun Op(D×)` (Frenkel, Lemma 8.3.2, line 10512, for the coincidence with the vertex
Poisson structure). Prove well-definedness independent of invariant extensions and continuity
across cofinal pole bounds; arbitrary pole-bound stages need not themselves be Poisson quotients.
Establish `Aut(O)` equivariance.

- `{H_x, H_y} = H_[x,y] − Res κ(x dy)` is a continuous Poisson bracket on `Fun Conn`, and
  `A ↦ (B ↦ Res κ(A, B) dt + 1)` identifies `Conn` with the level-one hyperplane of the dual of
  the central extension.
- The Hamiltonian vector field of `H_x` at `A` is `∇_ad x = x′ + [A, x]`.
- The moment map for the `N((t))` gauge action is the projection `A ↦ A mod 𝔟((t))` paired with
  `𝔫((t))` through `κ`; the level `f` is the oper locus, the action on it is free, and the reduced
  bracket is the Drinfeld–Sokolov bracket.

**Checks.**

- Anchor sign: `{H_x, H_y}(A) = Res κ(A, [x, y]) − Res κ(x, y′) = Res κ([A, x] + x′, y)`, using
  invariance and `Res κ(x, y′) = −Res κ(x′, y)`; so the vector field of `H_x` is `δA = x′ + [A, x]`.
- Rank one, `𝔤 = ℂ` abelian with `κ = 1`: `{H_(t^m), H_(t^n)} = −Res(t^m · n t^(n−1) dt) =
  −n δ_(m+n,0)`, the Heisenberg bracket; the sign `+n` would come from `Res κ(dx y)` instead.
- The left-gauge tangent `[x, A] − x′` is minus the Hamiltonian vector field, so `dH_x`
  corresponds to the gauge label `−x`; with `x = 1` in rank one both are `±x′ = 0` and the
  identification is invisible, which is why the witness uses `x = t^m`.
- Freeness: for `𝔰𝔩₂` the stabilizer of `d + f + v dt` in `N((t))` is trivial by §4.2's
  computation, since `u = −a` is forced.

*Needs:* §§7.1; §§3.3–3.4; §§4.2–4.3; §1.1; ReductiveGroups Layer 6 for the invariant form.

### 7.3 Rank one: Virasoro, KdV and λ-brackets (F7.3)

In `PGL₂` with the rank-one normalization fixing Layer 5's `q`, calculate the Hamiltonian
operator `P_q = 2q∂ + q′ − ½∂³`. For `H_ε = Res(εq dt)`, `anchor(dH_ε)(q) = P_q ε`. With
`L_n = Res(t^(n+1) q dt)`, prove `{L_m, L_n} = (m − n) L_(m+n) − ½(m³ − m) δ_(m+n,0)`. For
`H = Res(q² dt)`, compute `q̇ = P_q(2q) = 6qq′ − q‴` and prove this KdV vector field is
infinitesimally gauge-class preserving. For every homogeneous Drinfeld–Sokolov generator `q_i`
construct the λ-brackets `{q_i {}_λ q_j}`, differential-polynomial coefficient formulas via the
reduction algorithm, and verify translation, sesquilinearity, both Leibniz rules and Jacobi;
identify their modes with the continuous coefficient-ring bracket. Construct the full continuous
`Der(F_R)` infinitesimal coordinate action (including Laurent vector fields that do not
exponentiate to pointed `Aut(O)`); prove its Hamiltonian rank-one formula and compatibility with
the pointed `Aut(O)` subgroup.

- `{H_ε, H_η} = Res(η P_q ε dt)`, and `P_q` is skew-adjoint for the residue pairing.
- The `L_n` span a Virasoro algebra of central charge `−6` in this normalization
  (`−½(m³ − m) = −(6/12)(m³ − m)`).

**Checks.**

- `m = 1`, `n = −1`: `{L₁, L₋₁} = 2L₀`, no central term since `m³ − m = 0`; `m = 2`, `n = −2`:
  `{L₂, L₋₂} = 4L₀ − ½(8 − 2) = 4L₀ − 3`.
- From `P_q`: `P_q(t^(m+1)) = 2(m+1) q t^m + q′ t^(m+1) − ½(m+1)m(m−1) t^(m−2)`, and
  `Res(t^(n+1) · (2(m+1) q t^m + q′ t^(m+1)) dt) = 2(m+1) L_(m+n) − (m+n+2) L_(m+n) = (m−n) L_(m+n)`
  after integrating `q′` by parts; the central term is `−½(m³ − m) Res(t^(m+n−1) dt)`.
- `P_q(2q) = 4qq′ + 2qq′ − q‴ = 6qq′ − q‴`; with `P_q = 2q∂ + q′ + ½∂³` one would get
  `6qq′ + q‴`, a different flow.

*Needs:* §7.2; §§5.2, 5.4.

### 7.4 The coisotropic regular locus (F7.4)

Prove `Op(D) ⊂ Op(D×)` coisotropic: its defining ideal `I` satisfies `{I, I} ⊂ I`
(Frenkel–Gaitsgory, Lemma 4.4.1, line 1880). Construct its conormal Lie–Rinehart algebroid, action
on `Ω¹_(Op(D))`, and normal/conormal exact sequences. Prove the normal module is locally
projective/discrete from the negative Drinfeld–Sokolov coefficient decomposition, supplying the
hypothesis used in the general conormal theorem. It is not generally a Poisson ideal: do not impose
`{I, A} ⊂ I` or invent an inherited unrestricted Poisson bracket on `Fun Op(D)`. The
vacuum-centre comparison consumes the commutative regular-oper algebra and the relevant conormal
action.

- `I` is generated by the coordinates `q_(i,j)`, `j < 0`; `{I, I} ⊂ I`, and `I/I²` is the
  conormal module with the induced Lie–Rinehart bracket.

**Checks.**

- Rank one: `L_n = q_(−n−2)`, so `L_n ∈ I` iff `n ≥ −1`. For `m, n ≥ −1`, `(m − n) L_(m+n)` has
  `m + n ≥ −2` with coefficient `0` when `m = n = −1`, and the central term `½(m³ − m) δ_(m+n,0)`
  vanishes for `m ∈ {−1, 0, 1}`: `{I, I} ⊂ I` on generators.
- `L₂ ∈ I` and `L₋₂ = q₀ ∉ I`: `{L₂, L₋₂} = 4L₀ − 3` with `L₀ = q_(−2) ∈ I` restricts to `−3 ≠ 0`
  on `Op(D)`, so `I` is not a Poisson ideal.
- `L₋₁ = q_(−1) ∈ I` and `{L₋₁, L₋₂} = L₋₃ = q₁ ∉ I`: a second witness that `{I, A} ⊄ I`.

*Needs:* §§7.2–7.3; §5.2.

### 7.5 Miura opers, screenings and the completed classical W-algebra (F7.5)

Construct Miura opers (an oper plus a horizontal opposite Borel reduction in generic relative
position), the `ρ^∨`-twisted Cartan-connection description, and the Miura map into
Drinfeld–Sokolov opers, including coordinate transformations and extension loci (Frenkel, §8.2.1,
pp. 233–234, line 9938, and Proposition 8.2.2, line 10011). Construct the classical Heisenberg
differential-polynomial algebra on Cartan generators, its λ-bracket from the chosen invariant
form, and the Poisson-vertex-algebra translation, Leibniz and Jacobi identities. For every simple
root construct the exponential-charge module and classical screening derivation by the root
pairing (Frenkel, §8.2.3, equations (8.2-7)–(8.2-10), lines 10156–10202), its commutation with
translation, and its kernel. Prove the Miura map is Poisson for every split adjoint semisimple
type by the Drinfeld–Sokolov/Miura reduction comparison, including the Kupershmidt–Wilson
factorization statement in type A. Construct its generic fibre as the open opposite-flag cell for
regular-disc opers and Miura reductions transverse at `t = 0`, its simply transitive `N`-action
and coordinate algebra; prove the screening derivations are the simple-root infinitesimal gauge
flows. Construct faithfully flat descent of invariant functions, generation of `N` by those root
flows, and the principal-grading character comparison between the invariant differential-polynomial
algebra and the Drinfeld–Sokolov generators (including coefficientwise finite graded dimensions).
Use these to prove that the Miura pullback is injective and identifies the regular
differential-polynomial oper algebra with the intersection of the dual-root screening kernels
(Frenkel, Proposition 8.2.3, line 10208).

Complete the classical commutative differential vertex algebra `W_cl` of regular opers over the
characteristic-zero field `k` to the punctured algebra as follows; no quantum critical-centre
theorem and no mode functor of another roadmap enters. For the Drinfeld–Sokolov generator `w_i`
of degree `d_i + 1` write its field `Y(w_i, z) = Σ_(a∈ℤ) w_i[a] z^(−a−1)`. In the commutative
mode algebra impose translation `(Tw)[a] = −a w[a−1]` and the normally ordered product relations.
Prove the basic generator modes give a dense polynomial subalgebra `k[w_i[a] : 1 ≤ i ≤ ℓ, a ∈ ℤ]`,
and complete with the coefficient ideals `J_N = (w_i[a] : a ≥ N)`, `N ≥ 0`. Construct the
continuous algebra isomorphism `lim_N k[w_i[a] : a < N] ≃ Fun Op(D×)`, `w_i[a] ↦ q_(i,−a−1)`,
using §5.2's stage projections; both adjacent-stage maps kill the newly allowed coefficient, and
regular restriction is the `N = 0` projection. Prove coefficient finiteness, translation, product,
Poisson/mode and `Aut(O)` compatibility with this topology. The map completes the regular `W_cl`
algebra through its modes; it does not extend the regular charged screenings as ordinary
continuous derivations on every punctured Cartan-current algebra or interchange their kernels with
an arbitrary inverse limit. Pin root charges and contractions using the inverse Cartan form `κ₀∨`
on the dual Cartan, then extend it invariantly to the dual Lie algebra. It is not independently
normalized to long roots of length two on the dual root system. In rank one take
`A_Miura = [[−u, 0], [1, u]]`, so the Heisenberg current `b` maps to `−u`,
`(∂ − u)(∂ + u) = ∂² − q` and `q = u² − u′`. Prove its Poisson/Miura transformation and derive
each sign from Layers 5–7. On associated graded prove the all-degree sign adapter
`P(b) ↦ P(−u)`, equal to `(−1)^d` on a homogeneous invariant of degree `d`; include the cubic
`−tr(u³)` test in type `A₂`. A quadratic rank-one check alone does not fix this sign. This
screening-kernel identification is the exact classical supplier for AffineLieAlgebras' free-field
proof of the vacuum critical-centre theorem; AffineLieAlgebras owns the comparison of this
completion with its own generic mode completion.

- The Miura map `MOp_gen → Op` is a Poisson map of differential-polynomial algebras in the
  regular case, injective on functions, with image the intersection of the screening kernels.
- `lim_N k[w_i[a] : a < N] ≃ Fun Op(D×)` is a continuous isomorphism of topological `k`-algebras
  compatible with `T`, the mode bracket and `Aut(O)`.

**Checks.**

- Rank one: the gauge `[[1, u], [0, 1]]` carries `d + [[−u, 0], [1, u]] dt` to the normalized
  form with `q = b + a² + a′ = 0 + u² − u′`, by §4.2's formula with `a = −u`, `b = 0`; and
  `(∂ − u)(∂ + u) f = f″ + (u′ − u²) f`, so `L_q = ∂² − (u² − u′)` agrees.
- The screening for `𝔰𝔩₂` in the current `u`: the infinitesimal gauge `[[1, εx], [0, 1]]` sends
  `[[−u, 0], [1, u]]` to `[[−u + εx, 2uεx − εx′], [1, u − εx]] + O(ε²)`, so it preserves the Miura
  form exactly when `x′ = 2ux`, and then acts by `δu = −x`. Hence `δ(u² − u′) = −2ux + x′ = 0`
  while `δu = −x ≠ 0`: the screening derivation kills the oper coordinate and its derivatives but
  not `u`, so its kernel is the oper algebra and not the Heisenberg algebra. The factor `2` is the
  Cartan matrix entry, as in Frenkel's (8.2-8)–(8.2-10).
- Mode dictionary: `w[a] ↦ q_(−a−1)`; the translation relation `(Tw)[a] = −a w[a−1]` corresponds
  to `(q′)_(−a−1) = (−a) q_(−a)`, the coefficient of `t^(−a−1)` in `q′`, so the sign is forced by
  differentiation, not chosen.
- `J_N` for `N = 0` is `(w[a] : a ≥ 0) = (q_(j) : j ≤ −1)`, the ideal `I` of regular opers; the
  stage `N` quotient is `A_N` with `q_j`, `j ≥ −N`.
- Sign adapter: in type `A₁` the quadratic invariant `b²` maps to `u²`, invisible to the sign;
  in type `A₂` the cubic invariant `tr(b³)` maps to `−tr(u³)`, which the adapter `(−1)^3` records
  and a quadratic test cannot.

*Needs:* §§7.1–7.4; §§4.2–4.3; §5.2; ReductiveGroups Layers 6–7 for the opposite Borel and the
open cell; Mathlib `MvPolynomial`.

### Examples

The Heisenberg bracket `{H_(t^m), H_(t^n)} = −n δ_(m+n,0)` as the sign witness; the Virasoro
relations and `{L₂, L₋₂} = 4L₀ − 3`; the KdV flow `6qq′ − q‴`; the rank-one Miura transform
`q = u² − u′` and its screening.

### Dependencies

Layers 1, 3, 4 and 5; Mathlib `LieRinehartAlgebra`; ReductiveGroups Layers 6–7. Nothing from
AffineLieAlgebras: §7.5's completion is constructed here, and the comparison with the quantum
side is AffineLieAlgebras' target.

## Layer 8: isomonodromy groupoid and exported interfaces (F8)

### 8.1 The isomonodromy groupoid (F8.1)

Define `IsomOp` as the 2-fibre product `Op(D×) ×_(Loc(D×)) Op(D×)`. Its arrows are isomorphisms
of underlying connections, without requiring preservation of the Borel reductions
(Frenkel–Gaitsgory, §4.1, lines 1746–1758). In Drinfeld–Sokolov representatives these are
`(q, q′, g)` with `gauge(g, A_q) = A_(q′)`; composition is multiplication of gauges. Construct its
ind-formal presentations and base-change/descent laws. This is a full restriction/pullback of the
connection groupoid, not an action of `LG` on the slice and not the groupoid of oper isomorphisms
of Layer 4.

- `IsomOp` is a groupoid in ind-schemes over `Op(D×)` with source and target the two
  projections, unit `(q, q, 1)`, inverse `(q′, q, g⁻¹)` and composite of `(q, q′, g)` and
  `(q′, q″, h)` equal to `(q, q″, hg)`.
- Two triples `(q₁, q₁′, g₁)` and `(q₂, q₂′, g₂)` represent the same arrow iff
  `g₂ = n′ g₁ n` for `n, n′ ∈ N((t))` with `gauge(n, A_(q₂)) = A_(q₁)` and `gauge(n′, A_(q₁′)) = A_(q₂′)`.

**Checks.**

- `G = 𝔾_m`: objects are `d + a dt`, arrows `(a, a − dlog g, g)`, and composition is `hg`; the
  automorphisms of an object are the constants `ℂˣ`.
- The arrow `(0, 1, g)` of §5.4 between the opers `q = 0` and `q = 1` of `PGL₂` is a non-identity
  arrow between distinct objects, so `IsomOp` is not the trivial groupoid of the slice.
- `(q, q, g)` with `g ∈ N((t))` and `gauge(g, A_q) = A_q` forces `g = 1` by §7.2's freeness, so
  the unit arrow has a unique Drinfeld–Sokolov representative with `g = 1`.

*Needs:* §3.4; §§4.2–4.4; §5.2; SchemeAndStackFoundations §1.18 for 2-fibre products.

### 8.2 Formal smoothness and the source-fixed differentiation (F8.2)

Prove formal smoothness of source and target by the oper transversality lifting argument for every
square-zero extension of `R` (Frenkel–Gaitsgory, Proposition 4.1.1 and §4.2, lines 1764–1784).
Construct its source-tangent-at-unit Tate algebroid, bracket first by `N((t))`-reduction of the
`Conn` action algebroid `𝔤((t)) ⊗^! Fun(Conn)`, with moment constraints and bracket descent, and
the anchor (Frenkel–Gaitsgory, Lemmas 4.3.1–4.3.2, lines 1825–1865). Identify it with the
source-tangent-at-unit carrier by formal smoothness, and with right-invariant relative vector
fields. For the left gauge action on `Conn`, constant gauge labels have the opposite of the native
convolution loop bracket: their fundamental vector fields satisfy `[F_x, F_y] = −F_[x,y]`. Prove
this convention comparison; `Lie(LG)` itself retains the native loop bracket. For every
`p ∈ Op(R)`, identify source-fixed arrows over `R[ε]/ε²` whose reduction is the identity at `p`
with the computed source-tangent module. Construct target differentiation and its equality with
the anchor. Over `R[ε, η]/(ε², η²)`, retain the mixed `εη` term and compare the composable flow
sequence `x, y, −x, −y`, whose `Conn` gauge product is `g_y⁻¹ g_x⁻¹ g_y g_x`. For constant gauge
labels its mixed coefficient is `−[x, y]`; for sections before reduction prove the bracket formula
`[x, y]_source = −[x, y]_native + anchor(x)(y) − anchor(y)(x)`. Include shifting intermediate
targets, variable-section derivatives, identity/units, and independence of representatives after
`N`-reduction. Prove this two-parameter comparison yields precisely the native Lie–Rinehart
bracket, anchor and Leibniz rule on the completed kernel, with relative base change and
evaluation-stage independence. This single source-fixed differentiation supplier feeds
GeometricRepresentationCategories R5's relative differentiation question. At `∇ = ∂ + A` use
`T Op = coker(∇_ad : 𝔫((t)) → 𝔟((t)) dt)` and `Lie IsomOp = ker(∇_ad : (𝔤/𝔫)((t)) → (𝔤/𝔟)((t)) dt)`
(Frenkel–Gaitsgory, equations (4.2)–(4.3), lines 1788–1794); globally replace each coefficient
space by its `⊗^! Fun Op` module from §5.2, using the compatible universal connection; prove these
maps are well-defined quotient maps and residue identifies the continuous cotangent with the
latter kernel (Frenkel–Gaitsgory, equation (4.4), line 1798). Our anchor sends the class `x` to
`−∇_ad x = [x, A] − x′` in the displayed cokernel. The residue cotangent identification sends
`dH_x` to the class of `−x`, so its anchor is `+∇_ad x` as in §7.2; prove the pairing sign and
bracket comparison, including variable sections. Prove an isomorphism of native Lie–Rinehart
algebroids, including the bracket, anchor and `Aut(O)` action, not just an equality of tangent
dimensions.

- `s, t : IsomOp → Op(D×)` are formally smooth; `Lie IsomOp` is a Tate vector bundle over
  `Op(D×)` with fibre `ker(∇_ad)` as displayed, and `Ω¹_cont(Op(D×)) ≃ Lie IsomOp` as
  Lie–Rinehart algebroids.
- The anchor of `Lie IsomOp` is the class of `x ↦ −∇_ad x` in `T Op`; under residue duality it is
  the Hamiltonian anchor of §7.2.

**Checks.**

- `𝔰𝔩₂` at `∇ = ∂ + f + q e`: `∇_ad(x e) = x′ e − x h`, so in `coker(𝔫((t)) → 𝔟((t)))` the class of
  `α h + β e` is `(β + α′) e`; `T Op ≃ ℂ((t))` by `δq = δb + δa′`, the linearization of §4.2's
  `q = b + a² + a′` at `a = 0`.
- Same `∇`: for `y = y_f f + y_h h + y_e e`, the `𝔤/𝔟`-component of `∇_ad y` is
  `(y_f′ + 2y_h) f`, so `Lie IsomOp ≃ ℂ((t))` by `y_f`, with `y_h = −y_f′/2` modulo `𝔫`; the rank
  agrees with `Ω¹_cont(Op) ≃ ℂ((t)) dt`.
- Two-parameter witness: `(1 − ηy)(1 − εx)(1 + ηy)(1 + εx) = 1 − εη[x, y]`, so the mixed
  coefficient of `g_y⁻¹ g_x⁻¹ g_y g_x` is `−[x, y]` for constant labels; the opposite order of
  factors would give `+[x, y]`.
- Fundamental vector fields of the left action are an anti-homomorphism: for constant labels
  `F_x(A) = [x, A]` is linear in `A`, so `[F_x, F_y](A) = [y, [x, A]] − [x, [y, A]] = −[[x, y], A] =
  −F_[x,y](A)` by Jacobi; for `𝔾_m` both sides vanish, so the witness must be non-abelian, for
  instance `x = e`, `y = f` in `𝔰𝔩₂`, where `[F_e, F_f] = −F_h`.

*Needs:* §8.1; §§7.1–7.2; §5.2; §3.3; §1.1.

### 8.3 Regular opers and the conormal algebroid (F8.3)

Restrict to regular opers, prove every punctured horizontal isomorphism between regular
connections extends uniquely to the disc, and identify this regular groupoid with the 2-fibre
product over `BG` of fibres at `t = 0` (Frenkel–Gaitsgory, §4.4, Lemma 4.4.2, lines 1894–1907).
Identify its Lie algebroid with §7.4's conormal Lie–Rinehart algebroid through the
residue/negative-label comparison of §8.2, and preserve the anchor, bracket and stabilizers. No
simply-connected integration hypothesis is inserted into this formal algebraic construction.

- `IsomOp^reg = Op(D) ×_(BG) Op(D)`, with `Lie IsomOp^reg ≃ N*_(Op(D)/Op(D×))` as Lie–Rinehart
  algebroids over `Op(D)`.

**Checks.**

- `𝔾_m`: a horizontal isomorphism `g ∈ ℂ((t))ˣ` between `d + a dt` and `d + b dt` with
  `a, b ∈ ℂ[[t]]` has `dlog g = a − b ∈ ℂ[[t]] dt`, so `g ∈ ℂ[[t]]ˣ`; the extension to the disc is
  `g` itself and is unique.
- The `𝔾_m` regular groupoid is the pair groupoid of fibres at `0` twisted by `BG = Bℂˣ`: two
  regular connections are isomorphic by the unique `g` with `g(0) = 1` (§2.4's bijection), so the
  automorphisms are `ℂˣ`.
- Rank one conormal: `N*` has topological generators `dq_j`, `j < 0`, with bracket induced by
  the Virasoro relations of §7.3 on `I/I²`.

*Needs:* §§8.1–8.2; §7.4; §2.4's `regularGauge_constantCoeff_bijective`.

### 8.4 Exported contracts (F8.4)

Export exact contracts: regular polynomial and punctured completed oper function algebras,
evaluation characters, their topologies and coordinate action; the normalized Drinfeld–Sokolov
Poisson bracket and continuous cotangent algebroid; `IsomOp` with source/target/composition and
its differentiation comparison; the regular inclusion and conormal action; and Layer 6's
essential-surjectivity theorem. AffineLieAlgebras owns the completed universal enveloping algebra
and the Feigin–Frenkel isomorphism, including comparison with the deformation
`κ_ε = κ_c + ε κ₀`, where `κ_c = −½ Killing` and `κ_c|_(𝔤_i) = −h_i^∨ κ₀,i` on each simple ideal;
take `κ₀` and its inverse dual form factorwise. It uses the central cocycle `−κ_ε Res(f dg)` and
`{z, w} = ([z̃, w̃]/ε) mod ε`. Its comparison must calculate the dual invariant form and exact
rank-one scalar and sign relative to Layer 7, never assert equality only up to an unspecified
scalar. The form on the dual Cartan is the inverse of `κ₀` on the original Cartan. In rank one
`κ₀(h, h) = 2` and the normalized Segal–Sugawara generator `S = (1/2) Σ :J^a J_a:` must map
modewise to `L_n = Res(t^(n+1) q dt)`, giving the displayed `−1/2` central term. Layer 7 is
constructed independently of that comparison so the two roadmaps have no dependency cycle.

**Checks.**

- The exported `L_n` satisfy `{L_m, L_n} = (m − n) L_(m+n) − ½(m³ − m) δ_(m+n,0)`; a consumer
  whose Segal–Sugawara normalization produces `+½(m³ − m)` has the wrong sign of `κ₀` or of the
  residue cotangent identification.
- Rank-one dictionary: with `κ₀(h, h) = 2` and `α(h) = 2`, the functional `κ₀(h, −)` equals `α`,
  so the inverse form on the dual Cartan has `κ₀∨(α, α) = κ₀(h, h) = 2`; a normalization giving
  `κ₀∨(α, α) = 1` or `1/2` is a different form and changes the central term.
- Every exported object is defined over the characteristic-zero field `k` of the Conventions,
  with `ℂ` only in Layer 6; a consumer over `ℚ` may use Layers 5, 7 and 8 without Layer 6.

*Needs:* Layers 5–7; §§8.1–8.3.

### Examples

The `𝔾_m` isomonodromy groupoid and its regular part; the `𝔰𝔩₂` tangent and algebroid
computations; the two-parameter commutator witness; the rank-one Segal–Sugawara dictionary.

### Dependencies

Layers 1, 3, 4, 5 and 7; SchemeAndStackFoundations §1.18. Nothing from AffineLieAlgebras or
GeometricRepresentationCategories.

## Downstream consumers

- **AffineLieAlgebras** consumes Layers 1–8: the original `G(R((t)))` and congruence subgroups
  `K_N`, the dual group `G^∨`, regular and punctured Drinfeld–Sokolov opers, the coordinate action,
  function algebras, Miura transforms and the classical W/screening comparison of §7.5, and the
  finite Chevalley restriction, generators of degrees `d_i + 1`, Kostant regular/slice theorem and
  codimension of the nonregular locus of §4.3. It owns the completed enveloping algebra, the
  Feigin–Frenkel isomorphism and the comparison of its mode completion with §7.5's.
- **GeometricRepresentationCategories R3–R5** consumes Layers 3–8: the original and dual loop
  groups and congruence subgroups, dual opers, their function algebra, coordinates, evaluation,
  `IsomOp` and its cotangent Lie-algebroid comparison. R3 uses the continuous-character
  classification of §5.2; R4 states the complex-point categorical-lift conjecture as a coherent
  action on the central-character categories along `IsomOp(ℂ)`, commuting with the original
  `G((t))` action, including units and composition (Frenkel, Conjecture 10.1.2, p. 310,
  line 12936); R5 separately states the relative/infinitesimal Artinian-complex-algebra refinement
  and its differentiation question, consuming §8.2's source-fixed tangent and mixed-commutator
  supplier. Relative base-change constraints are part of that refinement, not silently included in
  the pointwise conjecture; R5's relative refinement is a named question, not an existence claim.
  The unrestricted lift is a conjecture statement, not a theorem demanded here. The dual gauge
  group in `IsomOp` and the original group acting fibrewise on module categories are distinct.
- **NilpotentOrbits** consumes §2.4 and the lower dictionary of §4.3 (Maurer–Cartan rank, fixed
  atlas, tangent/counit bracket comparison, connectedness, central-torus/closed-derived/finite-isogeny
  dictionary), then §4.3's compact-form matching, Zariski density and coaction comparison, the
  restriction isomorphism with its rational descent, and the finite principal triple, exponents,
  Kostant slice and regular-nilpotent/simple-component/unique-Borel theorems.
- **ReductiveGroups Layer 11** consumes §4.3's lower smooth/holomorphic dictionary for its
  analytic charts; **SchubertGeometry** and **ComplexKahlerGeometry** consume §2.4's fixed-model
  comparison.
- **KacMoody KM8A** consumes Layer 3A's polynomial and formal loop functors, Iwahori and positive
  subgroups, full-cocharacter normalizer quotients and positive-orbit comparison, and compares its
  minimal derived affine group with them.
- **PadicDifferentialEquationsAndRigidCohomology §§RD.1.2–RD.1.7 and §RD.6.52a** consume §6.2's
  cyclic-vector theorem, at its full generality of differential fields of characteristic zero with
  nonzero derivation, for its `p`-adic differential fields and for `F((t))`; its formal normal
  forms, slopes and ramified descent over `F((t))` are its own.

## References

- B. Kostant, [*Lie group representations on polynomial rings*](https://doi.org/10.1090/S0002-9904-1963-10980-5),
  Bull. Amer. Math. Soc. 69 (1963): principal `sl₂`, invariant degrees and slice geometry
  (uncertified, cited by locator). C. Chevalley,
  [*Invariants of finite groups generated by reflections*](https://doi.org/10.2307/2372597),
  Amer. J. Math. 77 (1955): the polynomial invariant model (uncertified).
- D. Kazhdan and G. Lusztig, *A topological approach to Springer's representations*, Adv. Math.
  38 (1980), 222–228, §2, and [*Fixed point varieties on affine flag manifolds*](https://doi.org/10.1007/BF02787119),
  Israel J. Math. 62 (1988), §4, Lemmas 6 and 8: the two geometric suppliers of Layer 6 (both
  uncertified, cited by locator).
- R. Steinberg, [*Regular elements of semi-simple algebraic groups*](https://www.numdam.org/item/PMIHES_1965__25__49_0/),
  Publ. Math. IHÉS 25 (1965), Theorem 1.9: `H¹`-vanishing for connected linear groups over a
  perfect field of cohomological dimension `≤ 1`. Y. Matsushima, *Espaces homogènes de Stein des
  groupes de Lie complexes*, Nagoya Math. J. 16 (1960): coset affineness, with ReductiveGroups 6B
  owning the algebraic quotient construction (uncertified).
- N. Iwahori and H. Matsumoto, [*On some Bruhat decomposition and the structure of the Hecke rings
  of p-adic Chevalley groups*](https://www.numdam.org/item/PMIHES_1965__25__5_0/), Publ. Math.
  IHÉS 25 (1965), §§1–2: the affine Weyl group and the Cartan and Iwahori–Bruhat decompositions.
- V. Drinfeld, [*Infinite-dimensional vector bundles in algebraic geometry (an introduction)*, v4](https://arxiv.org/abs/math/0309155v4),
  §3: elementary and Tate modules and lattices (§§3.2.1–3.2.3), Theorem 3.3 (categorical flat
  descent), Lemma 3.9 and Theorem 3.10 (topologically nilpotent automorphisms and finite projective
  Laurent modules), Theorem 3.11 (coefficient-ring fpqc descent). Layers 1 and 3 construct these
  topological and descent interfaces and their connection and Hopf comparisons.
- V. Drinfeld and V. Sokolov, [*Lie algebras and equations of Korteweg–de Vries type*](https://www.mathnet.ru/eng/intd72),
  J. Soviet Math. 30 (1985), 1975–2036: principal grading, Drinfeld–Sokolov reduction and the
  Miura transformation (uncertified, cited by locator). The all-`R` formal/gauge, descent and sign
  comparisons are the targets of Layers 1–7.
- E. Frenkel, [*Langlands correspondence for loop groups*](https://math.berkeley.edu/~frenkel/loop.pdf),
  Cambridge Studies in Advanced Mathematics 103 (2007): §1.2 (flat bundles and Langlands
  parameters), §§3.5.3–3.5.7 (coordinate changes, projective connections, the Schwarzian),
  §§4.1–4.2 (opers, gauge classes, coordinate action, canonical representatives, `sl_n`
  realization), §§8.2–8.3 (Miura opers, screenings, the Drinfeld–Sokolov Poisson structure),
  §10.1 (opers versus local systems).
- E. Frenkel and D. Gaitsgory, [*Local geometric Langlands correspondence and affine Kac–Moody
  algebras*](https://arxiv.org/abs/math/0508382), §1 (opers), §4 (the isomonodromy groupoid, its
  tangent and cotangent algebroids, Drinfeld–Sokolov reduction, regular opers), §19 (Tate vector
  bundles on ind-schemes).
- E. Frenkel and X. Zhu, [*Any flat bundle on a punctured disc has an oper structure*](https://arxiv.org/abs/0811.3186),
  Math. Res. Lett. 17 (2010): Theorem 1, Theorem 4, §5 Lemma 10, the reductive theorem and the
  explicit proof suppliers of Layer 6.
- P. Deligne, [*Équations différentielles à points singuliers réguliers*](https://publications.ias.edu/sites/default/files/Number9.pdf),
  Lecture Notes in Math. 163 (1970), Ch. II, Lemme 1.3: the cyclic-vector theorem over a
  differential field of characteristic zero with nonzero derivation. N. Katz,
  [*A simple algorithm for cyclic vectors*](https://web.math.princeton.edu/~nmk/old/simplealgorithm.pdf),
  Amer. J. Math. 109 (1987), 65–70, Theorems 1–2: the explicit cyclic candidates of §6.2.
- K. Česnavičius, [*The affine Grassmannian as a presheaf quotient*, v3](https://arxiv.org/abs/2401.04314v3),
  Theorems 16, 17 and 19; K. Česnavičius and R. Fedorov,
  [*A toral version of the Grothendieck–Serre conjecture*, v3](https://arxiv.org/abs/2311.08660v3),
  Theorem 4.2: the polynomial/formal quotient comparison and the `ℙ¹` triviality input of
  Layer 3A.
- The Stacks project, [Definition 10.133.1 (09CI), Lemma 10.133.3 (09CK), Lemma 10.133.9 (0H90)](https://stacks.math.columbia.edu/tag/09CH):
  differential operators and modules of principal parts over arbitrary commutative rings.
- G. Rinehart, *Differential forms on general commutative algebras*, Trans. Amer. Math. Soc. 108
  (1963), Theorem 3.1: the Lie–Rinehart PBW theorem (uncertified, cited by locator); Mathlib's
  [Lie–Rinehart definitions](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/LieRinehartAlgebra/Defs.lean).
