# Roadmap: arithmetic Galois representations and conductors

**Summary.** This roadmap builds the representation theory of absolute Galois groups that modularity
statements consume: continuous representations of `G_F` on finitely generated projective modules
over topological coefficient rings, their integral models and residual representations, their
restrictions to decomposition groups with Frobenius polynomials and Weil–Deligne representations,
local factors and local constants, Artin and Swan conductors, the classification of residual images
in rank two, recognition of a semisimple representation by the characteristic polynomials of
Frobenius elements, the Tate modules of elliptic curves and abelian varieties,
and the dimension-general calculus of powers, adjoints, polarisations and residual-image conditions
used by automorphy lifting. We want it because every automorphy lifting theorem, every compatible
system and every conductor computation in the Caraiani–Newton programme is stated in these terms,
and the exact normalisations (arithmetic Frobenius, the sign of the Weil–Deligne relation, the
Hodge–Tate weight of the cyclotomic character, the tame and wild parts of the conductor, the
trace-zero adjoint versus the adjoint modulo scalars) are where informal arguments go wrong.

The output of the roadmap is always an actual continuous homomorphism

```text
ρ : G_F → GL(M)
```

with its topology, never a list of Frobenius traces of unspecified realisability. It is built on
Mathlib's `Field.absoluteGaloisGroup` with its Krull topology, Mathlib's `Representation` and
`ContRepresentation`, Tau Ceti's local inertia, Frobenius, cyclotomic and tame characters, its
finite-group representation theory, Haar probability and abelian-variety carrier, and on the Tau
Ceti roadmaps for local fields, class field theory, Chebotarev density and elliptic curves. Its end
theorems are the recognition theorem for semisimple representations by Frobenius characteristic
polynomials (Layer 5), the Tate-module representation and pairing adapters (Layer 6), and
the residual-image criteria (absolute irreducibility of odd representations, adequacy, enormous
image) in the exact form the Taylor–Wiles method needs (Layers 4 and 7).

`README.md` is normative. [`Suggested.lean`](Suggested.lean), in the namespace
`TauCetiRoadmap.ArithmeticGaloisRepresentations`, states headline theorems against the pinned
Mathlib and Tau Ceti, with small definitions on their native carriers where needed; it is not
exhaustive. A target's *Lean:* note names its compiled headline statements; an identifier in
italics is a proposed name for an interface the target introduces. The Lean module docstring
names the endpoints whose objects have no Mathlib or Tau Ceti carrier. Every roadmap definition comes with the API it needs and with
Checks that a plausible wrong definition fails; every theorem carries its exact hypotheses,
its source, and the earlier statements or library declarations it rests on.

## Scope and ownership

The roadmap owns:

- the arithmetic API on EtaleCohomologyFoundations §F.4.0's shared `ContinuousRep Γ A M`
  and integral models: determinant characters, framings, characteristic polynomials and invariants
  under coefficient extension, twisting, duals, tensor products, internal Hom, Tate twists and
  continuous induction; coefficient-field and integral descent, reduced-building comparison,
  semisimplification, absolute irreducibility, Brauer–Nesbitt,
  reduction and the residual semisimplification, Teichmüller lifts, coefficient twists, and descent
  to a finite coefficient field, and connected-reductive complete reducibility, Levi
  semisimplification and field/DVR closed-orbit quotients for residual representations (Layer 1);
- decomposition and inertia groups at the places of a number field and the restriction of a global
  representation to them, unramified and tamely ramified representations and the ramification set,
  Frobenius characteristic polynomials, unramified characters, Dirichlet characters as Galois
  characters, abbreviations of PadicLocalLanglandsForGL2Qp §0.3's fundamental characters
  over finite residue fields, the arithmetic adapter
  to SmoothRepresentationsOfLocalGroups' Frobenius-semisimplified Weil–Deligne parameter,
  the `ContinuousRep` monodromy specialization of §2.4, local Euler factors,
  their finite-image comparison with the adelic convergence factors in §2.5a,
  the monodromy filtration and pair purity, with *WeilDeligneRep.IsWeilNumber* as the canonical
  shared natural-base scalar predicate, and Deligne–Langlands local constants (Layer 2).
  The downstream client DeligneWeightsAndPurity §0.19 owns the real-base adapter comparison
  and the ordinary/graded-purity comparison;
- the extension of the finite-local-field ramification theory to complete discretely valued
  fields with arbitrary perfect residue field in both characteristics (lower numbering, the
  different, Herbrand functions, Hasse–Arf, the absolute upper filtration, finite-separable
  transition functions and the completed maximal-unramified comparison, §3.0), representation
  break decompositions on that absolute upper-numbering filtration of `G_K`, the derived eventual
  Herbrand formula used for induction, unit-filtration reciprocity at every depth for nonarchimedean
  local fields and the representation-theoretic character-conductor comparison it gives, Swan and
  Artin conductors with
  integrality, induction and twist formulas, the conductor of a Weil–Deligne representation,
  global conductors and the prime-to-`p` conductor `N(ρ̄)`, and the behaviour of conductors under
  reduction (Layer 3);
- complex conjugations and oddness, the finite subgroups of `GL₂` and `PGL₂` over finite fields
  (Borel and Cartan subgroups, Dickson's classification, Serre's propositions), dihedral and bad
  dihedral residual images, and the behaviour of residual images under restriction (Layer 4);
- density of Frobenius elements and Chebotarev recognition by Frobenius characteristic polynomials,
  the rank-two trace–determinant comparison, the image algebra, trace field, Brauer class and Schur
  index of an absolutely irreducible representation with the descent obstruction, Haar-measure forms
  of the density theorem, Carayol's lemma, potentially abelian representations and recognition for
  lisse sheaves on curves over finite fields (Layer 5);
- the arithmetic adapter of the supplied geometric `ℓ`-adic Tate module as a continuous representation, its residual
  representation, determinant through the Weil pairing, oddness, isogeny compatibility, the
  comparison with the elliptic Tate module, the Tate curve, general local Euler factors,
  `λ`-adic Tate modules for real multiplication, compact-image criteria and Serre's wild bound (Layer 6);
- continuous symmetric, exterior and tensor powers, tensor induction and restriction of scalars,
  the adjoint, trace-zero adjoint and adjoint modulo scalars with the trace pairing, similitude
  groups and the Clozel–Harris–Taylor group `𝒢_n`, polarised representations with their sign and
  oddness in every dimension, `GSp₄`-valued representations, Zariski closures of images and strong
  irreducibility, finite-group cohomology of `GL₂`-type images, Clebsch–Gordan modulo `p`, adequate
  and enormous subgroups with their verification lemmas, the `GSp₄` image conditions, and the
  Taylor–Wiles image conditions (Layer 7).

It leaves to EtaleCohomologyFoundations §F.4.0 the jointly continuous finite-projective
representation carrier, its isomorphisms, rank-one characters and coefficient extension, the
compact-closure criterion for stable lattices, and integral models with continuous restricted
action, generic-fibre, homothety, saturation, duality and commensurability API. Its §F.3a owns
the henselian-trait/local-field tame-character comparison and its restriction and conjugation laws.
Layers 1 and 2 consume these shared interfaces. PadicMeasuresIwasawaAlgebras §5.1 owns the
ring-level determinant line and its endomorphism maps for every finite projective module;
EtaleCohomologyFoundations §F.10.3 owns their scalar realization through `End(det M) ≅ A`.
Section 1.1 bundles the action on that line, uses its scalar for determinant characters and proves
the arithmetic continuity and representation-operation comparisons. The line representation
retains its projective carrier; identifying its action with a scalar does not trivialize the line.

It leaves to named suppliers, and never rebuilds: the Krull topology, the separable closure and the
Galois correspondence (Mathlib); finite-group representation theory, induction and restriction,
Clifford theory, Brauer induction, projective representations and the Schur multiplier
(`TauCetiRoadmap.RepresentationTheory`); Artin–Wedderburn and central simple algebras
(`RepresentationTheory/SemisimpleAlgebras`, Tau Ceti's Brauer group and index); the finite-level
lower and upper ramification filtrations, Herbrand functions, the different, Hasse–Arf,
inertia, wild inertia and the tame quotient for nonarchimedean local fields
(`TauCetiRoadmap.LocalFieldsRamification` Layers 3–4); the local inertia and
wild inertia subgroups of `G_K`, arithmetic Frobenius lifts, the cyclotomic character and the
`ℓ`-adic tame character (Tau Ceti); the local Weil group, its degree map, the local Artin map,
`normResidue` and `characterConductorExp` (`TauCetiRoadmap.ClassFieldTheory` Layers 7 and 9).
The extension of the ramification filtrations to arbitrary perfect residue fields is §3.0 here,
and unit-filtration reciprocity at every depth is §3.2 here; Sections 3.1–3.2 use them for
representation breaks and conductors.
Other supplied inputs are
completions and decomposition-group embeddings of a number field
(`TauCetiRoadmap.NumberFieldArithmetic`); the Chebotarev density theorem for finite Galois
extensions (`TauCetiRoadmap.Chebotarev`, `TauCetiRoadmap.ArithmeticDirichletSeries`); continuous
cohomology of profinite groups (`TauCetiRoadmap.ProfiniteCohomology`); torsion, the Weil pairing,
the Tate curve and isogenies for Weierstrass curves
(`TauCetiRoadmap.EllipticCurves`); abelian varieties at field level, duals and polarisations
(`TauCetiRoadmap.JacobianChallenge`); algebraic groups, their Lie algebras and closed subgroups, and
the reductive classification (`TauCetiRoadmap.ReductiveGroups`, ReductiveGroupsPartII); determinant
laws, Cayley–Hamilton algebras, Chenevier's reconstruction and the classical Ribet lattice
(IntegralHeckeAndGaloisDeterminants). AbelianSchemesAndArithmeticModuli A3, A4.1 and A6.10–A6.12 supply abelian-scheme torsion,
isogenies, intrinsic and polarised Weil pairings, the geometric Tate module and its continuous
Galois action, and endomorphism polynomials. Layer 6 packages these in `ContinuousRep` and proves
arithmetic consequences. Lie-theoretic semisimplicity is a target of §7.6.
Crystalline and finite-flat conditions on Tate modules and automorphic `ε`-factors belong to their owners.
LFunctions Layers 0, 5–6 supply primitive finite-order and algebraic Hecke functions, completions,
continuation and functional equations on GlobalNumberFields' characters. Section 2.7 owns arithmetic
character constants defined by finite Gauss sums, the standard-test-function evaluations, the
algebraic Hecke zeta-integral comparison and the finite-sum root-number product formula. Its
finite-order Hecke functional equation is the supplied Layer 5 interface. The downstream
AutomorphicLFunctionsAndLocalFactors AL.1 owns `rank-one-local-functional-equation`, including
the comparison of its analytic constant with *tateLocalConstant*, and
`hecke-l-functional-equation`, the scalar endpoint for all continuous unitary Hecke characters
from AL.2's `global-godement-jacquet` at `n = 1`. The downstream
AutomorphicSpectralTheory §1.15c owns `unitary-hecke-functional-equation` via Eisenstein
continuation. With the same primitive conductor and archimedean factors, the two constructions
agree on `Re(s) > 1` and hence as meromorphic germs, with the same root number `W_H`.
AdelicAlgebraicGroups AA.2.4 supplies
finite-image Artin factors, induction and meromorphic assembly; §2.5a owns their comparison with
the geometric-Frobenius local polynomials on the dual ℓ-adic representation, and §2.7 proves their
completed functional equation with these local constants. CFSGBasicProperties T1–T2 supplies finite
fixed-point root calculus and simplicity; §7.12 owns the Hermitian matrix and projective-quotient
comparison with its valid twisted type-A carriers.
The function-field recognition statements used here are targets of §5.13.

The following ownership boundaries locate the geometric and period-theoretic interfaces.

| Mathematics | Owner and section |
| --- | --- |
| Equation-level prime-to-residue-characteristic torsion specialization and its elliptic-scheme comparison | §6.1 here, `prime-to-residue-characteristic-torsion-specialization` and `weierstrass-scheme-torsion-specialization-comparison` |
| General abelian-scheme finite-étale specialization, good-reduction Frobenius and its reciprocal Euler polynomial | NeronModelsAndSemistableAbelianVarieties §§5.0a–5.0c; the elliptic specialization agrees with §6.1's equation-level reduction |
| Potential good reduction | NeronModelsAndSemistableAbelianVarieties §5.1a |
| Elliptic conductors, special fibres, étale Euler characteristics, determinant of cohomology and Ogg's formula | NeronModelsAndSemistableAbelianVarieties §§5.3a–5.3e |
| Elliptic conductor bounds, residual conductors and Mathlib local-polynomial comparison | NeronModelsAndSemistableAbelianVarieties §§5.3g–5.3i |
| Serre's independence and Noot's specialization | NeronModelsAndSemistableAbelianVarieties §6.0 |
| Finite-coefficient period functors, labelled Sen operators, character criteria, tensor-product strong irreducibility and Hodge–Tate lifts | FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P7.1–R07.P7.5 |
| Finite-extension crystalline periods, fundamental sequences, fixed fields and realization predicates | FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P2–R07.P5a |
| Completion, Galois action, normalized traces and topological period foundations | PadicPeriodRings §§1.1–1.5, 2, 4.1–4.3 |

Already in Mathlib, hence cited and not rebuilt: `Matrix.ProjectiveSpecialLinearGroup.rank_two_simple'`
(simplicity of `PSL₂` over a field with more than three elements), `AlgHom.IsArithFrobAt` (arithmetic
Frobenius at a prime), `Representation.IsSemisimpleRepresentation`, `skewAdjointMatricesSubmodule`
(the Lie algebra `sp/so` of a form), `Matrix.symplecticGroup`, `IsNilpotent.exp` and Mathlib's
`groupCohomology`.

Already in Tau Ceti, hence cited and not rebuilt: profiniteness of `Field.absoluteGaloisGroup F` (its
`CompactSpace` and `TotallySeparatedSpace` instances, through
`TauCeti.absoluteGaloisGroupRestrictEquiv`); the local inertia and wild inertia subgroups
`TauCeti.inertiaSubgroup`, `TauCeti.wildInertiaSubgroup`; arithmetic Frobenius lifts
`TauCeti.IsArithFrobeniusLift` with `TauCeti.exists_isArithFrobeniusLift`; the `ℓ`-adic cyclotomic
character `TauCeti.localCyclotomicCharacter` and its continuous form
`TauCeti.continuousLocalCyclotomicCharacter` (for every field, despite the name), with
`TauCeti.IsArithFrobeniusLift.coe_localCyclotomicCharacter` (`χ_ℓ(Φ) = q`); `ℤ_ℓ(1)` as
`TauCeti.PadicTateTwist` with its Galois action; the `ℓ`-adic tame character
`TauCeti.inertiaPadicTameCharacter` with its surjectivity and conjugation formulas; the Teichmüller
lift `TauCeti.teichmullerLift`; the base change and character twist of abstract representations
`Representation.baseChange`, `Representation.charTwist`; symmetric, exterior and tensor powers
`Representation.symmetricPower`, `Representation.exteriorPower`, `Representation.tensorPower` and
tensor induction `Subgroup.tensorInducedRepresentation`; the index of a central simple algebra
`TauCeti.Algebra.index`; the Zariski closure of a subgroup of rational points
`TauCeti.HopfIdeal.vanishingIdeal`; and the Tate module of an elliptic Weierstrass curve with its
continuous Galois representation, Weil pairing and determinant (`TauCeti.TateModule`,
`WeierstrassCurve.tateModuleGaloisRepresentation`, `WeierstrassCurve.tateModuleWeilPairing`,
`TauCeti.det_tateModuleGaloisRepresentation`). The variants kept here differ in one clause each: the
continuous powers and tensor induction add the module topology, joint continuity, finite projectivity
and rank; the Tate module adapters consume AbelianSchemesAndArithmeticModuli A4.1 in every dimension,
with an elliptic comparison in dimension one.

Already stated by IntegralHeckeAndGaloisDeterminants, hence cited: the classical Ribet lattice (§1.4,
*Classical Ribet lattice*), determinant laws and Chenevier's reconstruction (Layers 0 and 1 of that
roadmap). Local Galois groups of `p`-adic fields as abstract groups, their cyclotomic orientation and
generator ranks are `TauCetiRoadmap.LocalGaloisGroups`; this roadmap uses nothing from it and
introduces no second local cyclotomic character.

## Conventions

- `F` is a field and `G_F = Field.absoluteGaloisGroup F` with its Krull topology, a profinite group
  (Tau Ceti's instances). Over an imperfect field the Galois correspondence is that of the separable
  closure. `Γ` denotes an arbitrary profinite group when no field is involved.
- `A` is a commutative topological ring with continuous ring operations. The standard coefficient
  tiers are a finite extension `E` of `ℚ_ℓ` with its valuation topology; a finite field or
  `F̄_p = AlgebraicClosure (ZMod p)` with the discrete topology; a complete Noetherian local ring with
  finite residue field and its maximal-adic topology; `ℚ̄_ℓ = PadicAlgCl ℓ` with the topology of its
  absolute value; and `ℂ` with its usual topology.
- A continuous representation is a finitely generated projective `A`-module `M` with the module
  topology (`IsModuleTopology A M`) and an `A`-linear action of `Γ` such that the action map
  `Γ × M → M` is jointly continuous. Joint continuity is strictly stronger than continuity of each
  operator; Mathlib's `ContRepresentation` asks only for the latter. Witness: the character
  `a ↦ (1+ℓ)^a` of `ℤ_ℓ` on `ℚ_ℓ` with the discrete topology is a `ContRepresentation` whose kernel
  `{0}` is not open, so it is not jointly continuous.
- Determinants of representations on projective modules use EtaleCohomologyFoundations §F.10.3's
  scalar of the determinant-line action, on PadicMeasuresIwasawaAlgebras §5.1's rank-decomposed
  invertible line. At constant rank this is the top exterior-power action. The raw
  `LinearMap.det` is `1` on a module without a finite basis; on the zero module
  the determinant is the trivial character, and on `ℤ_ℓ(1)` it is `χ_ℓ`. The headline
  signatures that use `LinearMap.det` have finite-dimensional field carriers, where the two agree.
- Frobenius is **arithmetic** unless the name says `Geom`. A Frobenius lift at a finite place `v` is
  any element of the decomposition group inducing `x ↦ x^{q_v}` on the residue field; its conjugacy
  class modulo inertia is `Frob_v`. The Frobenius characteristic polynomial at an unramified place is
  `P_v(ρ, X) = det(X − ρ(Frob_v))`; the local Euler factor is
  `det(1 − ρ(Frob_v^{-1}) q_v^{-s} | V^{I_v})^{-1}`, written with the geometric Frobenius
  `Frob_v^{-1}` so that it agrees with the usual `L`-function. Witness: for `F = ℚ` and `ρ = ℤ_ℓ(1)`,
  `χ_ℓ(Frob_p) = p`, so `P_p(ℤ_ℓ(1), X) = X − p` (with a geometric lift it would be `X − p^{-1}`), and
  the Euler factor is `(1 − p^{-1-s})^{-1}`, so `L(ℚ_ℓ(1), s) = ζ(s + 1)`.
- The Weil–Deligne relation is `r(w) N r(w)^{-1} = q^{deg w} N` for `w` in the Weil group, where the
  degree of an arithmetic Frobenius lift is `1` (the normalisation of `TauCetiRoadmap.ClassFieldTheory`
  layer 9); equivalently the tame character satisfies `t_ℓ(g σ g^{-1}) = χ_ℓ(g) t_ℓ(σ)`. Witness: the
  special representation `Sp(2)` has a basis `e₀, e₁` with `N e₀ = e₁`, `N e₁ = 0`, `r(Φ) e₀ = e₀` and
  `r(Φ) e₁ = q e₁` for an arithmetic Frobenius lift `Φ`; then
  `r(Φ) N r(Φ)^{-1} e₀ = r(Φ) e₁ = q e₁ = q N e₀`, which is the stated relation and not its inverse.
  The relation with a geometric lift has `q^{-deg w}`; no statement copies the geometric form
  unchanged.
- The `ℓ`-adic cyclotomic character `χ_ℓ : G_F → ℤ_ℓ^×` is Tau Ceti's `localCyclotomicCharacter`
  (Mathlib's `cyclotomicCharacter` on the automorphism of `F̄`) for `char F ≠ ℓ`; for `char F = ℓ`
  it is trivial, so the hypothesis is never dropped. `ℤ_ℓ(1)` is the Tate module of the roots of
  unity with this action, `M(n)` is the twist by `χ_ℓ^n`, so `M(1)^∨ ≅ M^∨(−1)`, and `χ_ℓ` has
  Hodge–Tate weight `+1`, so `ℚ_ℓ(−1)` has weight `−1`; the rational Tate module of an elliptic curve
  has weights `0` and `1`, and its dual `H¹` has weights `0` and `−1`. Witness: dualising the two
  weights negates them, while `det V_ℓE = ℚ_ℓ(1)` has weight `1`. The Weil pairing on the Tate module
  of an abelian variety is alternating with `e(gx, gy) = χ_ℓ(g) e(x, y)`, so the determinant of
  `T_ℓ A` is `χ_ℓ^g`, not `χ_ℓ^{-g}`.
- Conductors are defined for representations whose coefficient characteristic differs from the
  residue characteristic `p` and whose wild inertia image is finite; the Artin conductor is the sum
  of the tame term `codim V^{I}` and the Swan conductor, the Swan conductor is additive on exact
  sequences and the Artin conductor is superadditive; the conductor of a Weil–Deligne representation
  adds the monodromy term `dim V^{I} − dim (ker N)^{I}`, where `V^{I}` is the invariants of `r`
  restricted to inertia. Witnesses: the quadratic character of `ℚ_p(√p)/ℚ_p` for odd `p` has
  `χ(G^0) ≠ 1` and `χ(G^u) = 1` for `u > 0`, so its Artin conductor is `1` (tame term `1`, Swan `0`);
  the Weil–Deligne representation `Sp(2)` of the Tate curve has `r` trivial on inertia, `V^{I} = V`
  of dimension `2`, `ker N` of dimension `1`, hence conductor `0 + 0 + (2 − 1) = 1`, the conductor
  exponent of multiplicative reduction. Section 3.1 uses §3.0's ramification filtration over
  complete discretely valued fields with arbitrary perfect residue field for representation breaks
  and Swan conductors.
- A complex conjugation at a real place `v` of a number field `F` is an element `c ∈ G_F` with
  `ι ∘ c = conj ∘ ι` for some embedding `ι : F̄ → ℂ` above `v` (`GaloisRep.IsComplexConjugation`).
  Oddness of a rank-two representation is `det ρ(c_v) = −1` for every complex conjugation at every
  real place (`ℤ_ℓ(1) ⊕ ℤ_ℓ` is odd since `χ_ℓ(c) = −1`; the trivial rank-two representation is
  even); oddness of a polarised representation in dimension `n` is a sign condition at each real
  place and is not reduced to the rank-two test. Over `F₂` the condition `det ρ̄(c) = −1 = 1` holds
  for every `ρ̄`, so oddness is stated for coefficient rings in which `−1 ≠ 1`, or as the sign
  condition of Layer 7, which is not vacuous over a non-reduced ring of characteristic two.
- Adequacy, enormousness and the `GSp₄` "vast" and "tidy" conditions are distinct predicates with
  separate verification lemmas; the trace-zero adjoint `ad⁰` and the quotient `ad/scalars` are
  distinct carriers, and when `p ∣ n` the statements that need the splitting `ad = ad⁰ ⊕ scalars`
  carry that hypothesis explicitly.
- Universe conventions: coefficient rings and modules live in one universe; groups in a possibly
  different one; the statements about group cohomology use Mathlib's `Rep`, which needs the group,
  the coefficients and the module in one universe, and are made with `Type`. The abelian-variety
  carrier is Tau Ceti's `AlgebraicGeometry.AbelianVariety K`.

## Exact supplier contracts

### From Mathlib

`Field.absoluteGaloisGroup` (with `Field.absoluteGaloisGroup.mapOfAlgebra`); `Representation` and
`ContRepresentation` with `Representation.coind`, `Representation.coindV`, `Representation.dual`,
`Representation.tprod`, `Representation.linHom`, `Representation.invariants`,
`Representation.IsSemisimpleRepresentation`, `ContRepresentation.coind` and `Rep.indCoindIso`;
`IsModuleTopology`; `Module.Projective`, `Module.Finite`, `Module.Invertible`, `Module.rankAtStalk`,
`Module.rankAtStalk_eq_finrank_tensorProduct`, `exteriorPower.alternatingMapLinearEquiv`;
`LinearMap.det`, `LinearMap.charpoly`, `LinearMap.charpoly_baseChange`, `LinearMap.trace`,
`dualTensorHomEquiv`, `LinearMap.IsPerfPair`; `cyclotomicCharacter` and `modularCyclotomicCharacter`;
`PadicAlgCl` (with its `valued` instance), `PadicInt`, `IsNonarchimedeanLocalField` and
`IsNonarchimedeanLocalField.isCompact_closedBall`; `IsKrasner.krasner`; `AlgHom.IsArithFrobAt`,
`AlgEquiv.mapIntegralClosure`, `AddSubgroup.inertia`; adic completions, `NumberField.InfinitePlace`,
`NumberField.IsCMField.complexConj`, `NumberField.Set.HasDirichletDensity`;
`IsCyclotomicExtension.Rat.galEquivZMod`, `DirichletCharacter`, `legendreSym`, `jacobiSym`; the matrix
groups `Matrix.GeneralLinearGroup`, `Matrix.SpecialLinearGroup`, `Matrix.ProjGenLinGroup`,
`Matrix.ProjectiveSpecialLinearGroup` with `Matrix.ProjectiveSpecialLinearGroup.rank_two_simple'` and
`Matrix.SL2.commutator_eq_top`, `Matrix.symplecticGroup`, `Matrix.J`, `skewAdjointMatricesSubmodule`,
`Matrix.card_GL_field`, `Matrix.trace_eq_neg_charpoly_coeff`, `Matrix.aeval_self_charpoly`;
`IsNilpotent.exp`; `MonoidHom.transfer`, `Equiv.Perm.sign`, `Subgroup.goursat`, `DihedralGroup`,
`DoubleCoset.Quotient`; `CompositionSeries.jordan_holder`; `jacobson_density`,
`IsSemisimpleRing.exists_algEquiv_pi_matrix_divisionRing`, `BrauerGroup`, `Algebra.Etale`;
`MeasureTheory.distribHaarChar_mul`, `MeasureTheory.Subgroup.index_mul_measure`,
`MeasureTheory.Measure.measure_prod_null`, `BaireSpace`, `dense_iInter_of_isOpen`,
`ProfiniteGrp.ProfiniteCompletion.lift`, `ProfiniteGrp.exist_openNormalSubgroup_sub_open_nhds_of_one`,
`OpenNormalSubgroup`, `ContinuousEvalConst`; `Submodule.le_of_le_smul_of_le_jacobson_bot`,
`Module.free_of_flat_of_isLocalRing`, `Matrix.mem_range_scalar_of_commute_single`; `groupCohomology`
and `Rep`; `FDRep.char_orthonormal`, `InfiniteGalois.mem_bot_iff_fixed`; and `WeierstrassCurve` with
its points, `WeierstrassCurve.IsMinimal`, `WeierstrassCurve.minimal`,
`WeierstrassCurve.HasGoodReduction`, `WeierstrassCurve.HasMultiplicativeReduction`,
`WeierstrassCurve.HasAdditiveReduction`,
`WeierstrassCurve.hasGoodReduction_or_hasMultiplicativeReduction_or_hasAdditiveReduction`,
`WeierstrassCurve.localPolynomial` and `WeierstrassCurve.LFunction`. Each layer names the declaration
at the claim that uses it; where a Mathlib result is stated only for free modules or only for Galois
extensions, the layer says how the projective or separable case reduces to it.

### From Tau Ceti

Galois groups: the profiniteness instances on `Field.absoluteGaloisGroup` and
`absoluteGaloisGroupRestrictEquiv` (`G_F ≃ₜ* Gal(F^sep/F)`);
`Field.absoluteGaloisGroup.exists_finiteDimensional_normal_fixingSubgroup_le`,
`Field.absoluteGaloisGroup.finite_quotient_of_isOpen`, `Representation.isOpen_ker_of_finite`. Local
fields: `inertiaSubgroup`, `wildInertiaSubgroup`, `IsArithFrobeniusLift`,
`exists_isArithFrobeniusLift`, `IsArithFrobeniusLift.coe_localCyclotomicCharacter`,
`localCyclotomicCharacter`, `continuousLocalCyclotomicCharacter`, `PadicTateTwist` with
`PadicTateTwist.galoisRepresentation`, `inertiaKummerCharacter`, `inertiaTameCharacter`,
`quotientWildInertiaSubgroupEquiv`, `inertiaPadicTameCharacter` with
`inertiaPadicTameCharacter_surjective`, `inertiaPadicTameCharacter_conj` and
`IsArithFrobeniusLift.inertiaPadicTameCharacter_conj`, `teichmullerLift` with
`residue_teichmullerLift`, `teichmuller`, `residue_teichmuller`, `rootsOfUnityEquivResidueField`,
`complexConjugationAt` (finite extensions only). Number fields:
`Ideal.isUnramifiedAt_iff_inertia_eq_bot`, `NumberField.Chebotarev.frobeniusPrimeSet`,
`NumberField.isArithFrobAt_eq_of_isUnramifiedAt`, `Multiquadratic.galoisGroupEquiv`,
`NumberField.exists_isArithFrobAt_multiquadratic`, `NumberField.isArithFrobAt_apply_sqrt`.
Representation theory: `Representation.baseChange`,
`Representation.finrank_intertwiningMap_baseChange`, `Representation.charTwist`,
`Representation.symmetricPower`, `Representation.exteriorPower`, `Representation.tensorPower`,
`Subgroup.tensorInducedRepresentation`, `SymmetricPower.finrank_eq`, `ContRepresentation.linHom`,
`ContRepresentation.continuous_linHom`, `ContRepresentation.conj_linHom`, `Rep.mackeyDecomposition`,
`Representation.conjSubrep`, `Representation.iSup_conjSubrep_eq_top`,
`Representation.isSemisimpleRepresentation_comp_subtype`,
`Representation.asAlgebraHom_surjective_of_isIrreducible`,
`Representation.isIrreducible_of_asAlgebraHom_surjective`, `jordanHolderMultiplicity`,
`jordanHolderMultiplicity_eq_add_of_exact`, `compositionMultiplicity_eq_of_head_eq_of_last_eq`,
`exists_linearEquiv_directSum_isIndecomposableModule`, `haarProb`, `haarProb_apply`. Linear algebra:
`LinearMap.GeneralLinearGroup.jordanDecomposition`, `traceBilinForm`, `traceBilinForm_nondegenerate`,
`Matrix.det_eq_of_transpose_mul_J_mul_eq_smul`, and the `GL₂` toolkit `GL2Borel`, `GL2NonSplitTorus`,
`GL2WeylElement`, `diagGL`, `centralizer_diagGL`, `conjClassesGLFinTwoEquiv`,
`exists_isConj_normalForm`, `isConj_iff_of_notMem_range_scalar`, `natCard_GL_fin_two`,
`Matrix.SpecialLinearGroup.not_isSolvable_fin_two`. Central simple algebras: `Algebra.index`,
`Algebra.deg`, `Algebra.index_dvd_deg`, `Algebra.isSplittingField_self_iff_index_eq_one`,
`BrauerGroup.mk`, `BrauerGroup.baseChange`, `BrauerGroup.mk_eq_one_iff_isSplittingField`,
`subsingleton_brauerGroup_of_finite`, `IsSimpleRing.exists_algEquiv_matrix_centralDivisionRing`,
`CSA.of`, `Quaternion.mk_ne_one`. Algebraic groups: `HopfIdeal.vanishingIdeal`,
`le_vanishingIdeal_iff`, `commutator_quotientPointsSubgroup_vanishingIdeal_le`,
`CommHopfAlgCat.hopfIdealOrderIsoClosedSubgroup`, `FiniteTypeCommHopfAlgCat.identityComponent`,
`ConstantForm.groupScheme`, `Symplectic.groupScheme`, `Orthogonal.groupScheme`. Cohomology:
`ContCohomology.cochainsCor1`. Abelian varieties and elliptic curves:
`AlgebraicGeometry.AbelianVariety` with `AbelianVariety.baseChange`, `AbelianVariety.prod`,
`AbelianVariety.mulBy`, `AbelianVariety.End` and `AbelianVariety.IsIsogeny`; `Isogeny` with
`Isogeny.degree`, `Isogeny.frobeniusIsogeny`, `oneSubFrobeniusIsogeny`,
`degree_oneSubFrobeniusIsogeny_eq_pointCount`, `card_ker_mulByIntIsogeny`;
`WeierstrassCurve.frobeniusTrace`, `WeierstrassCurve.valuation_Δ_eq_of_isMinimal_smul`; and the
elliptic Tate module `TateModule`, `WeierstrassCurve.tateModuleGaloisRepresentation`,
`WeierstrassCurve.tateModuleWeilPairing`, `det_tateModuleGaloisRepresentation`. Most of these live in
the namespace `TauCeti`; some (the representation-theoretic ones) extend Mathlib namespaces.
`Suggested.lean` imports the modules of those it uses.

### From `TauCetiRoadmap.LocalFieldsRamification`

Layer 0: finite extensions of nonarchimedean local fields, with Mathlib's Krasner lemma as an input;
the comparison `F̄_v = F_v · ι(F̄)` is §2.1 here. Layer 2: `IsUnramified`, the maximal unramified
extension with `Gal(K^ur/K) ≅ Ẑ` sending arithmetic Frobenius to `1`, and the unramified extension of
each degree; inertia under finite extensions is §2.2 here. Layers 3–4 supply finite-local-field
lower and upper numbering, Herbrand functions with inverse, tower and normal-quotient identities,
the different formula and Hasse–Arf. Their absolute inertia and wild inertia are closed and normal,
map onto `G_0` and `G_1` at finite level, and have `P_K` pro-`p` and
`I_K/P_K ≅ ∏_{ℓ ≠ p} ℤ_ℓ(1)` equivariantly for `G_K`; arithmetic Frobenius lifts form an inertia coset.
These contracts are stated for nonarchimedean local fields, whose residue fields are finite. Their
extension to complete discretely valued fields with arbitrary perfect residue field in either
characteristic is §3.0 here, built on Tau Ceti's `TauCeti.IsLocalRing.ramificationGroup`,
`TauCeti.IsLocalRing.ramificationGroupReal` and `TauCeti.IsLocalRing.lowerIndex` and agreeing with
the finite-local-field API when the residue field is finite. Section 3.1 derives the eventual
Herbrand formula from §3.0 and owns the representation break decomposition and Swan conductor.

### From `TauCetiRoadmap.ClassFieldTheory`

Layer 7: `artinMap` with its normalisation (a uniformiser maps to an arithmetic Frobenius lift,
`isArithFrobeniusLift_of_mk_eq_artinMap_uniformizer`), finite-quotient and norm compatibility,
`normResidue` and `characterConductorExp` with its attained minimum and unramified criterion.
Layer 7 does not identify the images of the unit-filtration steps with upper ramification groups;
that theorem, at every depth `n ≥ 0` and in both characteristics, is §3.2's
**Unit-filtration reciprocity** here, which compares the representation-theoretic Artin conductor
of a finite-order character with `characterConductorExp`.
Layer 9: `WeilGroup K` with the Weil
topology in which inertia is open (`isOpenEmbedding_inertiaToWeil`), `weilDegree` (kernel inertia, value
`1` on arithmetic lifts through `unramifiedCoordinate_weilDegree`), `weilTransfer` with
`weilDegree_weilTransfer`, and `localWeilArtinEquiv` for `K/ℚ_p` finite. Layer 13: `kroneckerWeber`.
For §7.6, Layer 5 supplies local duality and Brauer invariants; Layer 10 supplies the global
Brauer localization and sum of invariants (`eq_zero_of_localInv_eq_zero`, `sumLocalInv_eq_zero`).
Layers 11–12 supply global reciprocity and its local compatibility, used to turn the finite-order
Hecke extension constructed in §7.6 into a global Galois character. Section 2.7 consumes this
reciprocity and owns the finite-order character-globalisation corollary of Grunwald–Wang used
in its transfer argument.

### From `TauCetiRoadmap.NumberFieldArithmetic`

Layer 2: existence of `IsArithFrobAt` elements in finite Galois extensions (§2.1), uniqueness modulo
inertia (§2.2), the Artin symbol and conjugation (§2.3), and Frobenius on cyclotomic fields (§2.6).
Layer 5: completions as nonarchimedean local fields (§5.1), `completionAlgHom` (§5.2), `decompositionHom` and
its bijectivity onto the decomposition group with Frobenius and conjugation compatibility (§5.6), the
localisation of the different (§5.9) and the valuation of the relative discriminant (§5.10). Layer 6:
the different-exponent formula (§6.3). The sum formula `v(𝔡_{F'/F}) = Σ_{w|v} δ(F'_w/F_v)` is §3.5
here.

### From `TauCetiRoadmap.Chebotarev` and `TauCetiRoadmap.ArithmeticDirichletSeries`

Chebotarev layer 10: `hasDirichletDensity_frobeniusPrimeSet` (for `L/K` finite Galois and a conjugacy
class `C`, the primes with `Frob_𝔭 ∈ C` have Dirichlet density `#C/#Gal(L/K)`), the infinitude of each
class and invariance under finite changes. Layer 14: `hasNaturalDensity_frobeniusPrimeSet` with the
same value. ArithmeticDirichletSeries layer 7: `NumberField.Set.HasDirichletDensity`, the upper and
lower density bounds and the calculus of densities (finite symmetric differences, monotonicity,
unions, squeeze).

### From `TauCetiRoadmap.RepresentationTheory`

`InductionRestriction` layer 5 (Clifford's theorem and the Clifford correspondence over a normal
subgroup), layer 6 (Brauer's induction theorem: every character is a `ℤ`-combination of characters
induced from linear characters of elementary subgroups) and layer 7 (projective representations,
factor sets, and the obstruction `cliffordObstruction` in `H²(T/N, k^×)` to extending a stable
irreducible representation); §7.6 uses its factor-set algebra with continuous sections and finite
discrete kernels. The extension theorem for cyclic `G/N` and the vanishing of `H²` of a finite
cyclic group with divisible coefficients are §3.2 here. `SemisimpleAlgebras` layer 2: the
Wedderburn presentation with its uniqueness and dimension count. `CompactGroups` works with Mathlib's
`ContRepresentation`; the carrier of Layer 1 adds joint continuity.

### From `TauCetiRoadmap.EllipticCurves`, `JacobianChallenge`, `AlgebraicCurves`

EllipticCurves layer 0.5: base change of Weierstrass curves. Layer 1: isogenies with their point maps,
composition and degree, and the quotient `W → W/Φ` by a finite Galois-stable subgroup (Vélu). Layer 2:
`E[N] ≃ (ℤ/N)²` over a separably closed field, the Weil pairing `e_N` (alternating, nondegenerate,
Galois-equivariant) and the `ℓ`-adic Tate module with its continuous `G_K`-action. Layer 3:
`frobeniusTrace`, `pointCount`, the Frobenius isogeny acting as `(x, y) ↦ (x^q, y^q)`,
`deg(1 − π_q) = #E(F_q)` and `π_q² − a_q π_q + q = 0`; the trace formula on `V_ℓ` for every
endomorphism is §6.1 here. Layer 4 supplies the Tate curve with its Galois-equivariant
uniformisation `L^×/q^ℤ ≅ E_q(L)` and the Tate parameter with `v(q) = −v(j)`; §6.3 constructs its
torsion representation. Layer 5 supplies the separable quadratic twist splitting a nonsplit
multiplicative reduction, built from the monic node quadratic, and the point isomorphism
`E^L(M) ≅ E(M)` twisted by the quadratic character of `L/K`; it does not assert that this character
is unramified, and §6.3's *Unramified splitting character* owns that refinement. Layer 4 supplies reduction on points and its formal-group kernel; §6.1 here owns
the equivariant specialization of geometric torsion of order prime to the residue characteristic
and its compatibility with Layer 3's Frobenius action, used for the good-prime trace comparison.
JacobianChallenge layer E supplies
field-level abelian varieties, duals and polarisations, compared with the abelian-scheme carrier in
AbelianSchemesAndArithmeticModuli A0.2. The Tate module and Weil pairing used here are the A4.1
`AbelianTate` and A3.5 pairings, with the arithmetic adapters of §§6.1–6.2. AlgebraicCurves layer 8:
lower ramification groups of function-field extensions, for comparison with §3.1.

### From `TauCetiRoadmap.ProfiniteCohomology` and `TauCetiRoadmap.ReductiveGroups`

ProfiniteCohomology layer 2: the explicit low-degree complex and its functoriality (`H¹`, `H²`). Layer
10: continuous cohomology in all degrees with filtered discrete-coefficient colimits; the
finite-kernel continuous lifting obstruction and the algebraic torus-kernel reduction are §7.6
here. Layer 13: for an open `U` of index `l`, the permutation wreath
product `U^l ⋊ S_l` and the transversal-dependent continuous monomial homomorphism `G → U^l ⋊ S_l`.
ReductiveGroups layer 0 (the functor of points of affine group schemes over a field), layer 2 (Lie
algebras and the adjoint representation), layer 3 (closed subgroup schemes and Hopf ideals, the identity
component and the component group, finiteness of `π₀`), layer 6 (reductive groups, the derived group,
and linear reductivity in characteristic zero) and layer 9 (Chevalley–Demazure group schemes over `ℤ`).
The matrix descriptions of the Lie algebras of `GSp` and `GO`, the reductivity criterion for monodromy
groups and the classification of irreducible connected reductive subgroups of `GL₂` are §§7.3 and 7.6
here.

### From `PadicMeasuresIwasawaAlgebras` and the scalar determinant supplier

PadicMeasuresIwasawaAlgebras §5.1, *Line modules and top exterior powers*, supplies
`projectiveDeterminant`, `projectiveDeterminantMap`, their identity, composition and arbitrary
base-change laws, the clopen rank decomposition, invertibility and constant-rank top
exterior-power comparison. EtaleCohomologyFoundations §F.10.3 supplies the scalar of
`projectiveDeterminantMap u` through `End(det M) ≅ A` for every finite projective `M`, and its
finite-free comparison. Section 1.1 evaluates this same scalar on representation operators;
its complement and split-retract formulas compare with this supplied scalar, rather than
specifying another determinant. IntegralHeckeAndGaloisDeterminants §0.6, *Determinant of a finite
projective representation*, supplies the polynomial-law enhancement at constant rank; the
value on each operator is the scalar of the same exterior-power action.

### From `IntegralHeckeAndGaloisDeterminants` and `ReductiveGroupsPartII`

IntegralHeckeAndGaloisDeterminants Layer 0: polynomial laws and determinants on an algebra
(Chenevier), determinants on a group algebra, and the bijection between two-dimensional determinants
on a group and pairs `(T, D)` with `D(g)T(g⁻¹h) − T(g)T(h) + T(gh) = 0`. Layer 1: the Cayley–Hamilton
ideal and Cayley–Hamilton algebras (§1.1), semisimple reconstruction of determinants over
algebraically closed fields (§1.2), henselian lifting for absolutely irreducible residual determinants
(§1.3), *Inner conjugacy of local matrix algebras* (§1.3, automorphisms in positive size),
the *Classical Ribet lattice* (§1.4), and GL reconstruction (§1.7). Section 5.5 reduces
endomorphisms to that automorphism theorem over the residue field. ReductiveGroupsPartII
RG2.2: the action of `Ĝ(E)` on its building and the Bruhat–Tits fixed point theorem for bounded
subgroups (`Building.exists_fixedPoint_of_bounded`); RG2.2.2 and RG2.2.4: the reduced building
`ReducedBuilding` and *gl-building-lattice-chains*, the description of the building of `GL(V)` by
lattice chains, whose reduced vertices are the homothety classes of lattices (§1.6);
RG2.3: parahoric group schemes, among them the hyperspecial model.
Section 1.11 owns the additional connected-reductive complete-reducibility predicates,
Levi semisimplification, field/DVR quotient theorems and the arithmetic independence bridge;
building containment supplies the integral model, while these invariant-theoretic results
compare its residual semisimplifications.

### From `AbelianSchemesAndArithmeticModuli` and `EtaleCohomologyFoundations`

AbelianSchemesAndArithmeticModuli A3.1–A3.5 supply isogeny kernels, quotients and prime-to-characteristic
torsion; A3.7 and A3.9 supply polarized pairings and Rosati; A4.1 supplies `AbelianTate`, its
geometric fibre `TauCeti.TateModule ℓ (A(K^sep))`, continuous Galois action, rank, reduction,
functoriality, base change and dual pairing. A6.10–A6.11 supply `End.charpoly` and `charpolyTate`;
A6.12 supplies freeness through an endomorphism subfield. Layer 6 consumes these geometric
interfaces without imposing a dependency on this roadmap's Layer 6 in their construction.

EtaleCohomologyFoundations §F.0.2 `finiteEtaleGaloisCategory` supplies finite étale covers
and the fundamental groupoid, and §F.0.A1 supplies decomposition and inertia groups of a cover
for §5.13. Its §F.3a supplies henselian traits, inertia, the tame character and its local-field
comparison, including henselian lifting of prime-to-residue-characteristic roots of unity and the
restriction and conjugation laws consumed in §2.1a. Its §F.4.0 supplies the common `ContinuousRep`
carrier with `Iso`, `ofCharacter` and `baseChange`, the compact-closure criterion for stable
lattices, and `GaloisLattice.IntegralModel` with continuous restricted action, generic-fibre,
homothety, saturation, duality and commensurability. Sections 1.1–1.2 and 1.6 use these interfaces;
coefficient-field descent, integral descent, the building comparison and residual semisimplification
are arithmetic targets here.

SchemeAndStackFoundations §5.11 supplies the numerical Weil bound for smooth projective
geometrically integral curves over finite fields, through surface intersections and Hodge index.
Section 5.13 applies it over every finite extension and to the descended twists of finite covers;
the curve/Jacobian cohomology comparison and Rosati root-modulus criterion are not inputs here.

### From `TauCetiRoadmap.PadicLocalLanglandsForGL2Qp`

Section 0.3 supplies, for every nonarchimedean local field with finite residue field (including
equal characteristic), `fundamentalCharacter` at every niveau `f ≥ 1` on its tame inertia quotient,
built from the Kummer character of a `(p^f−1)`-st root of a uniformiser with the residue embedding
retained; its independence of the uniformiser and root, the Teichmüller lift, the least niveau of
a finite-image tame character, surjectivity, restriction and norm compatibility, `p`-power
coefficient conjugation, Frobenius conjugation through the `q`-power map, and the niveau-one
comparison `ω₁^(e_K) = ω|_(I_K)` for finite `K/ℚ_p`. Section 2.3 here consumes exactly these and
exports `fundamentalCharacter`, *fundamentalCharacter_pow_p* and *cyclotomic_restrict_tameInertia*
as abbreviations on Tau Ceti's tame quotient.

### From `LFunctions`, `AdelicAlgebraicGroups` and `CFSGBasicProperties`

The roadmap dependencies outside this portfolio are LFunctions Layers 0, 5–6 and
CFSGBasicProperties T1–T2, at the sections specified below.

LFunctions
Layer 0 supplies analytic and arithmetic completed-function records, normalization translation,
duals and polar divisors. Layers 5–6 supply primitive finite-order Hecke and algebraic
Grössencharacter presentations on GlobalNumberFields' carriers, their conductors, gamma factors,
root numbers, continuation and inverse-character functional equations. Section 2.7 compares
adelic Tate integrals with these functions and obtains complex norm twists by translating their
meromorphic germs. Its finite-order Hecke functional equation restates the Layer 5 interface;
its root-number product formula identifies the supplied root numbers with finite Gauss-sum
constants in the specified conductor normalization. For every unitary character, the same
formula defines and factors Hecke's Gauss-sum root number independently of continuation.

AdelicAlgebraicGroups AA.2.4, *convergence-factors*, supplies finite-image complex Artin factors,
their ramified induction identity, Artin–Hecke comparison and global meromorphic assembly.
Section 2.5a compares those factors with §2.5's local polynomials over a common number field
with specified complex and ℓ-adic embeddings: the geometric lift on the dual ℓ-adic representation
matches the arithmetic lift on the complex representation, with `N = 0` and `v ∤ ℓ`.
Section 2.7 consumes this comparison on dual representations. It proves the completed functional
equation for finite-image representations by Brauer induction using only finite-order Hecke
equations and identifies its epsilon factors; it constructs the adelic Schwartz–Bruhat, Fourier,
Poisson and finite-order globalization inputs used by local constants.

CFSGBasicProperties
T1–T2 supplies the finite fixed-point root calculus and simplicity on CFSGStatement's exact
derived central quotient. Section 7.12 constructs the Hermitian matrix comparison by a proved
`MulEquiv` for `m ≥ 3` in the valid twisted `A_{m−1}` range, at fixed-field parameter `q`.
Rank two uses the matrix comparison with `PSL₂(F_q)` and Mathlib's simplicity theorem; rank one
is computed directly. The automorphism-group input to the verification lemmas remains §7.12's.

| Input | Interface | Ownership |
| --- | --- | --- |
| Jointly continuous representations and stable integral models | EtaleCohomologyFoundations §F.4.0 | Shared foundation supplied there; §§1.1–1.2 and 1.6 consume it and add arithmetic results |
| Henselian-trait/local-field tame-character comparison | EtaleCohomologyFoundations §F.3a | Supplied comparison and transport laws; §2.1a transports them along global decomposition-group embeddings |
| Weil group and degree | ClassFieldTheory Layer 9 | Supplier targets |
| Frobenius-semisimplified Weil–Deligne parameter and functor | SmoothRepresentationsOfLocalGroups SR.5.2, `classical-llc-normalization` | Supplier target; §2.4 adapter and §2.5 agreement |
| Linear Weil–Deligne substrate on parameter fields | SmoothRepresentationsOfLocalGroups SR.5.2, `wd-linear-substrate`, `nilpotent-exp-log`, `grothendieck-monodromy`, `wd-parameter-operations`, `full-wd-construction`, `wd-frobenius-semisimplification` | Supplier targets; §2.4 `ContinuousRep` specialization and adapter, §2.5 agreement and local factors |
| Geometric abelian Tate module | `AbelianTate`, A4.1 | Supplier targets |
| Numerical curve Weil bound | SchemeAndStackFoundations §5.11, *The Weil bound via surfaces* | Supplied surface-intersection theorem; §5.13 owns finite-cover counts, constant-field degree congruences, closed-point and profinite density, and recognition |
| Connected-reductive complete reducibility and closed-orbit quotients | §1.11 here, **Complete reducibility and closed tuples** and **Reductive quotients over fields and DVRs** | Owned generic interfaces; the **`Ĝ`-valued representations** target compares integral models using the DVR quotient on a common finite residual quotient |
| Logarithm, Lie and minuscule semisimplicity comparison | §7.6 below | Owned targets |

### Shared and owned interfaces

| Object | Exact supplier | Convention/consumer |
| --- | --- | --- |
| Frobenius-semisimplified Weil–Deligne parameter and functor | [SmoothRepresentationsOfLocalGroups](../SmoothRepresentationsOfLocalGroups/README.md#wd-linear-substrate) SR.5.2, `wd-linear-substrate` through `wd-frobenius-semisimplification`, and **Classical parameters and the generic convention**, `classical-llc-normalization` | Owns exp/log, Grothendieck monodromy, parameter operations, the full construction with its inverse and exactness, Frobenius semisimplification, and the normalized parameter and functor with dual compatibility, descent and scalar extension. Section 2.4 owns the `ContinuousRep` specialization and arithmetic adapter; §2.5 owns the agreement theorem and local factors. These consume the same `(V, r, N)` data, with Frobenius semisimplicity an additional hypothesis. Arithmetic Frobenius has degree +1 and conjugates monodromy by q; dual monodromy is −Nᵗ. |
| Fundamental characters and residual tame inertia | PadicLocalLanglandsForGL2Qp §0.3, `fundamentalCharacter` | The supplier owns the finite-residue fundamental characters at every niveau, including equal characteristic, with residue embeddings, Teichmüller lift, least niveau, norm, restriction, Frobenius and niveau-one cyclotomic laws. Section 2.3 here supplies the abbreviations `fundamentalCharacter`, *fundamentalCharacter_pow_p* and *cyclotomic_restrict_tameInertia* on Tau Ceti's tame quotient and owns the rank-two level-1/level-2 classification over ℚ_p. The downstream FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.26 owns the extension to complete mixed-characteristic DVRs with arbitrary perfect residue field and its agreement with the finite-residue characters; R07.1.27–R07.1.32 own Raynaud exponent bounds and finite-flat applications. |
| Projective-unitary simplicity | CFSGBasicProperties T1–T2; Mathlib rank-two simplicity | §7.12 owns the Hermitian matrix, centre and quotient comparison with the valid derived central quotient at fixed-field parameter `q`, and transports supplied simplicity. Rank two uses `PSL₂(F_q)`; the small exceptions and rank one are direct checks. |
| Finite-order and algebraic Hecke continuation and completed equation | LFunctions Layers 0, 5–6 | §2.7 restates `finite-order-hecke-functional-equation`, compares standard integrals on algebraic norm twists, and identifies the supplied root numbers with the finite-sum product in `root-number-product-formula`. |
| Arithmetic character constants and root numbers | §2.7 here, `local-constant-gauss-sum` and `root-number-product-formula` | Finite Gauss-sum definitions and identities for all local quasi-characters and global unitary characters, independent of analytic functional equations. |
| Finite-order character globalisation | §2.7 here, Globalisation and Deligne's transfer | Grunwald–Wang's finite-order character-extension corollary, with unrestricted exponent and auxiliary ramification, uses ClassFieldTheory Layers 7, 9 and 11–12's reciprocity. |
| Finite-image Artin factors and meromorphic assembly | AdelicAlgebraicGroups AA.2.4, *convergence-factors* | §2.5a owns the coefficient-extension and Frobenius comparison with §2.5's local polynomials on dual ℓ-adic representations. §2.7 consumes this comparison, the factors and ramified induction identity on dual representations, and proves the completed functional equation with the local-epsilon product. |
| Categorical duality trace | PivotalSpherical §Layer 2 / Left and right trace (`leftTrace`, `rightTrace`, common spherical `trace`); AdicSpacesPartIII §R3.8 / *projective-trace-realization*, `LinearMap.projectiveTrace_eq_categoricalTrace` | §7.2 consumes the supplied finite-projective symmetric-duality comparison and identification of `End_A(A)` with `A`. |
| Concrete projective contraction trace | AdicSpacesPartIII §R3.8 / *projective-module-trace* and *projective-trace-realization*, `LinearMap.projectiveTrace`, `LinearMap.projectiveTrace_eq_trace` | §7.2 transports the supplied trace to continuous representations through the *ContinuousRep.endTrace* consumer alias and owns the trace-zero adjoint and pairing consequences. The contraction formula gives finite-free compatibility with Mathlib without assuming finite projective modules are free. |

## How to read the build

EtaleCohomologyFoundations §F.4.0 → Layer 1 supplies the carrier and its integral theory.
Layer 1 adds the arithmetic API used by every other layer. Layer 2 adds the
local objects (decomposition groups, Frobenius, tame and cyclotomic characters, Weil–Deligne
representations, local factors and constants) and depends on Layer 1. Layer 3 defines conductors from
the ramification filtration and the Weil–Deligne representations of Layer 2. Layer 4 (residual images
in rank two) uses Layers 1 and 2. Layer 5 (recognition by Frobenius polynomials) uses Layers 1 and 2
and the determinants of IntegralHeckeAndGaloisDeterminants. Layer 6 uses Layers 1–5 and
AbelianSchemesAndArithmeticModuli A3.5 and A4.1 for its Tate and pairing adapters. These adapters
feed the geometric reduction and conductor targets of NeronModelsAndSemistableAbelianVarieties
§§5.0a–5.3i and its specialization target §6.0. Layer 7
(dimension-general API) uses Layers 1, 2, 4 and 5. The supplier order is
SmoothRepresentationsOfLocalGroups SR.5.2 `classical-llc-normalization` → the §2.4 arithmetic
adapter and §2.5 agreement theorem, alongside
SmoothRepresentationsOfLocalGroups SR.4/SR.6 → IntegralHeckeAndGaloisDeterminants → Layer 1/Layer 5.
SmoothRepresentationsOfLocalGroups SR.5.2 `wd-linear-substrate`, `nilpotent-exp-log`,
`grothendieck-monodromy`, `wd-parameter-operations`, `full-wd-construction` and
`wd-frobenius-semisimplification` supply the linear theory on the canonical parameter fields.
They use Mathlib linear representations, ClassFieldTheory Layer 9 and Tau Ceti's local
characters. Section 2.4 specializes monodromy to `ContinuousRep` and packages its underlying
action through the supplied full construction. Section 2.5 identifies the adapter's
Frobenius-semisimplified output with `classical-llc-normalization` and builds the local factors.
PadicLocalLanglandsForGL2Qp §0.3 → §2.3's abbreviations and residual classification;
§2.3 → FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.26's perfect-residue extension, the
same direction as Layer 6 → that supplier's elliptic finite-flat applications. Within a layer the subsections
are in build order.
For global constants, §2.7's finite Gauss sums → root-number product formula;
GlobalNumberFields → LFunctions Layer 5 → §2.7's finite-order Hecke functional equation.
These and §2.7's finite-order globalisation, together with AdelicAlgebraicGroups AA.2.4 and
§2.5a's finite-image comparison, give the meromorphic Artin equation and Deligne–Langlands
existence. LFunctions Layer 6 also gives the algebraic Hecke zeta-integral comparison.
Section 7.12 consumes CFSGBasicProperties T2 after constructing the valid matrix comparison. Section 7.6's Tate
vanishing uses ClassFieldTheory Layers 5, 10–12 and its own idelic torsion-character extension;
ArithmeticGaloisDuality consumes that vanishing.
For function fields, SchemeAndStackFoundations §5.11 → §5.13's finite-extension curve bound
→ finite-cover counts → closed-point and profinite Frobenius density → recognition. The downstream
DeligneWeightsAndPurity §3.7 uses these finite-cover counts for its degreewise and geometric-Frobenius
adapters. Cohomological purity remains with that roadmap; curve/Jacobian and general
endomorphism-trace comparisons remain with the downstream InverseGaloisAndArithmeticFundamentalGroups
§IG.0.T1.
`Suggested.lean` states the headline results whose objects have Mathlib or Tau Ceti carriers; Checks specify
mathematical tests throughout the roadmap.

## Layer 1: continuous representations and integral models

This layer uses EtaleCohomologyFoundations §F.4.0's continuous representations and integral models.
It builds their arithmetic API: coefficient and integral descent, determinant characters,
semisimplification, Brauer–Nesbitt and residual representations.

Standing hypotheses: `Γ` is profinite; `A` is a commutative ring with continuous ring operations. A
coefficient field `E` is a finite extension of `ℚ_ℓ` (ring `O_E`, uniformiser `ϖ`, residue field
`k_E`); `ℚ̄_ℓ := PadicAlgCl ℓ`; finite fields and `F̄_p := AlgebraicClosure (ZMod p)` are discrete.
Sources: DDT = Darmon–Diamond–Taylor 2007, BHKT = Böckle–Harris–Khare–Thorne 2019, NT = Newton–Thorne
2026, DS = Deligne–Serre 1974, CG = Calegari–Geraghty 2020, Chenevier = Chenevier, arXiv:0809.0415v2.

### 1.1 Continuous representations

Use EtaleCohomologyFoundations §F.4.0's `ContinuousRep Γ A M`: a `Representation A Γ M` on a
finitely generated projective `A`-module with the module topology and jointly continuous action
`Γ × M → M`. Its `ContinuousRep.Iso`, `ContinuousRep.ofCharacter` and coefficient extension are
supplied there. For a field `F`, use `Γ = G_F := Field.absoluteGaloisGroup F` with the Krull topology
and Tau Ceti's profiniteness instances. The coefficient cases are `E`, discrete finite fields and
`F̄_p`, complete Noetherian local rings with finite residue field and their adic topology,
`ℚ̄_ℓ` and `ℂ`. The headline signatures use native `Representation` carriers with joint
continuity imposed explicitly, or continuous homomorphisms into matrix groups.

**Continuity and characteristic polynomials.** Build equivariant linear morphisms
*ContinuousRep.Hom*, automatic continuity and extensionality; the injective forgetful map
*ContinuousRep.toContRepresentation*, with image the jointly continuous actions;
*continuous_iff_matrixCoeff* on a finite free carrier and *continuous_iff_orbit* (equivalently,
continuity on a finite generating family); *ContinuousRep.trivial*; and *ContinuousRep.charpoly*
(`det(X − ρ(g))` on a free carrier) (DDT, §2.1, p. 52; NT, §1.2, p. 7; BHKT, §2, p. 5).
*Needs:* EtaleCohomologyFoundations §F.4.0; Mathlib `ContRepresentation` and `IsModuleTopology`.

**Checks.**
- The character `a ↦ (1 + ℓ)^a` of `ℤ_ℓ` on `ℚ_ℓ` with the discrete topology is a `ContRepresentation`
  but not a `ContinuousRep`: its kernel `{0}` is not open. A definition asking only for continuity of
  each operator would accept it.
- `ofCharacter χ` has characteristic polynomial `X − χ(g)` at `g`; a definition acting by `χ(g)⁻¹`
  (contragredient) would give `X − χ(g)⁻¹`, which differs for `χ = χ_ℓ` at a Frobenius.

- On the zero carrier every operator has determinant `1`, so the determinant character of §1.1 below
  is trivial there; a definition through a nonempty basis would not even be defined.
- *toContRepresentation* is injective and its image is exactly the jointly continuous
  `ContRepresentation`s; a definition that forgot joint continuity would make it surjective.

**Exterior powers of projective modules.** Use Tau Ceti's exterior-power scalar-extension
comparison from `TauCeti.LinearAlgebra.ExteriorPower.BaseChange`:
`TauCeti.exteriorPower.equivBaseChange`, its inverse's pure-tensor formula
`TauCeti.exteriorPower.equivBaseChange_symm_tmul_ιMulti`, and naturality
`TauCeti.exteriorPower.equivBaseChange_map`. For commutative `A`, an `A`-module `M`, `r ∈ ℕ`
and a commutative `A`-algebra `B`, this identifies `B ⊗_A ⋀^r_A M` with
`⋀^r_B (B ⊗_A M)` without flatness. Using this comparison, prove that `⋀^r_A M` is
finitely generated projective when `M` is; and that `M` of
constant rank `n` gives `⋀^r M` of constant rank `binom(n, r)` (one for `r = n`, zero for `r > n`).
Use PadicMeasuresIwasawaAlgebras §5.1's invertible determinant line, its constant-rank
identification with the top exterior power, and its arbitrary base-change comparison;
EtaleCohomologyFoundations §F.10.3 supplies the scalar endomorphism realization
(Stacks, §15.120, tag 0FJ9; DDT, §2.1, p. 52). *Needs:* Mathlib
`exteriorPower.alternatingMapLinearEquiv`, `Module.rankAtStalk_eq_finrank_tensorProduct`;
the supplied exterior-power comparison and the determinant suppliers above.

**Checks.**
- For `A = ℤ`, `B = ℤ/2` and `M = ℤ²`, the comparison takes `1 ⊗ (e₁ ∧ e₂)` to
  `(1 ⊗ e₁) ∧ (1 ⊗ e₂)` although `B` is not flat over `A`.
- For rank `n`, the top exterior power has rank one and the `(n+1)`-st has rank zero;
  in rank zero the zeroth exterior power is `A` and its identity has determinant one.
- Over `A = k × k`, the projective module `k × 0` has ranks `(1,0)` and is not invertible;
  constant rank one is needed for the scalar description of its automorphisms.

**The determinant character.** Define *ContinuousRep.det* `ρ : Γ →* Aˣ` by evaluating
EtaleCohomologyFoundations §F.10.3's scalar determinant on `ρ(g)` for every finite projective
carrier `M`, including varying rank. The scalar is a unit because `ρ(g)` is invertible. Prove
continuity. Define *ContinuousRep.detLineRep* `ρ` on PadicMeasuresIwasawaAlgebras §5.1's invertible
`projectiveDeterminant A M` with its module topology, by `projectiveDeterminantMap (ρ(g))`.
Prove joint continuity, functoriality under representation isomorphisms, and compatibility with
restriction, direct sums, duals and continuous coefficient extension. Its action is multiplication
by `det ρ(g)` on this line. At constant rank `r`, write `Dρ =` *ContinuousRep.detLineRep* `ρ` and
identify it with the representation on `⋀^r_A M`. A chosen trivialization
`projectiveDeterminant A M ≃ₗ[A] A` induces `Dρ ≅ ofCharacter (det ρ)`; a basis of a free carrier
supplies such a trivialization. No trivialization is required to define either `Dρ` or `det ρ`.
For any `u : End_A(M)` and finite projective complement `N` with `M ⊕ N` finite free, prove
that the supplied scalar of `u` is `LinearMap.det (u ⊕ id_N)`; hence the free-complement
expression is independent of the complement and basis, and the scalar is a unit exactly when
`u` is bijective. For a splitting `s ∘ e = id_M`, `e : M → A^n`, prove that it also equals
`det(e ∘ u ∘ s + 1 − e ∘ s)`. Apply these comparisons to `u = ρ(g)`.
Its arithmetic API is *det_eq_linearMap_det* on free carriers, continuity, the value `1` on the zero
module, the product formula for direct sums, `det(M ⊗ N) = (det M)^{rank N} (det N)^{rank M}`
when `M,N` have constant ranks, `det(M(χ)) = det M · χ^{rank M}` when `M` has constant rank,
`det(M^∨) = (det M)⁻¹` and compatibility with restriction and every continuous coefficient
change; the underlying scalar determinant commutes with arbitrary ring base change
(DDT, §2.1, p. 52; Stacks, §15.120, tag 0FJ9).
*Needs:* PadicMeasuresIwasawaAlgebras §5.1; EtaleCohomologyFoundations §F.10.3;
the exterior-power comparison above and §F.4.0's coefficient extension.
The bundled determinant-line construction retains its projective carrier; on free carriers
its scalar action agrees with `LinearMap.det (ρ g)`.

**Checks.**
- For `A = ℚ × ℚ`, `M = (1,0)A` and `u` multiplication by `2` on `M`, the supplied scalar,
  determinant-line action and free-complement formula all give `(2,1)`.
  Here `N = (0,1)A` and `M ⊕ N ≅ A`, so the
  completed operator is multiplication by `(2,1)`. The raw `LinearMap.det` on `M` gives `1`.
- On the zero representation the determinant character is `1`; its determinant line is `A`
  with trivial action, including over a ring with several connected components.
- For rank-one characters `χ, ψ`, the determinant of their direct sum is `χψ`; for the
  cyclotomic character it is `χ_ℓ`, rather than `χ_ℓ⁻¹`.
- After the nonflat coefficient change `ℤ → ℤ/2`, the determinant of the generator acting by
  `−1` on the sign representation becomes `1`, as does the scalar of its base-changed line.
- For the trivial group over discrete `A = ℤ[√−5]`, the invertible ideal `I = (2, 1 + √−5)`
  satisfies `I² = (2)` but is nonprincipal: a generator would have norm `a² + 5b² = 2`.
  The trivial action on `I` has scalar determinant `1` and determinant-line carrier `I`,
  which is not isomorphic to the carrier `A` of `ofCharacter 1`.

### 1.2 Frames, coefficient extension, operations, Tate twists

**Framed representations.** Define the continuous representation *ofFramed* `ρ` on `A^n` attached to a
continuous homomorphism `ρ : Γ → GL_n(A) = Matrix.GeneralLinearGroup (Fin n) A`, `n ≥ 0`, with the
units topology (continuity into `GL_n(A)` is continuity into `M_n(A)`); define the frame
*frame* `b ρ : Γ → GL_n(A)` of a representation in a basis `b`, with *ofFramed* (*frame* `b ρ) ≅ ρ` and the
change-of-basis formula *frame* `b' ρ = P⁻¹ (`*frame* `b ρ) P`, `P = b.toMatrix b'`; and the entrywise
coefficient change *Framed.map* `f`. Isomorphism classes of representations on `A^n` are the
`GL_n(A)`-conjugacy classes; conjugacy over a larger ring `B ⊃ A` is coarser. Its API is
*ofFramed_iso_iff*, functoriality of *Framed.map* in `f`, the characterisation of continuity through
the matrix entries, and `det (`*ofFramed* `ρ) = Matrix.det ∘ ρ` (DDT, §2.1, p. 52; Ribet 1976, §2,
p. 154). *Needs:* Mathlib `Matrix.GeneralLinearGroup`.

**Checks.**
- `(1 a; 0 1)` and `(1 ℓa; 0 1)` on `ℤ_ℓ²` are `GL₂(ℚ_ℓ)`-conjugate but not `GL₂(ℤ_ℓ)`-conjugate; a
  definition of isomorphism allowing conjugation over the fraction field would identify them.

- In rank one a framed representation is a character and *ofFramed* `ρ ≅ ofCharacter χ`; in rank zero
  there is exactly one framed representation, the zero representation.
- Continuity of `ρ : Γ → GL_n(A)` for the units topology is continuity of `Γ → M_n(A)`; with the
  subspace topology from `M_n(A)` alone, inversion would not be continuous for a general `A`.

Use EtaleCohomologyFoundations §F.4.0's `ContinuousRep.baseChange` along a continuous `A → B`:
`B ⊗_A M` with its module topology and action `id ⊗ ρ(g)`, using Tau Ceti's
`Representation.baseChange`. Its pure-tensor formula, equivariance and identity/composition
comparisons are supplied there.

**Invariants and characteristic polynomials under coefficient extension.** Prove the
characteristic-polynomial, trace and determinant formulas as `@[simp]` identities:
`charpoly(ρ_B(g)) = map(A → B)(charpoly(ρ(g)))`, `tr(ρ_B(g)) = image(tr(ρ(g)))` and
`det(ρ_B(g)) = image(det(ρ(g)))`, for finite free carriers and every continuous coefficient map.
For a local coefficient map `A → B` inducing `k_A → k_B`, raw reduction commutes with scalar
extension through `k_B ⊗_B (B ⊗_A M) ≅ k_B ⊗_{k_A} (k_A ⊗_A M)`; give its equivariant comparison
and the resulting characteristic-polynomial, trace and determinant simplifications. The module
topologies and continuity of both residue maps are required wherever these are continuous
representations. Over fields, absolute irreducibility is preserved and reflected by every
coefficient extension (*isAbsolutelyIrreducible_baseChange_iff*, §1.7).
Along a topological field extension `E ⊂ E'`, for any monoid `Γ` and `E`-representations `V`, `W`
with `V` finite-dimensional, prove `V^Γ ⊗ E' = (V_{E'})^Γ` and
`Hom_Γ(V, W) ⊗_E E' ≅ Hom_Γ(V_{E'}, W_{E'})`. Proof: choose an `E`-basis `(e_b)` of `E'`; then
`M ⊗ E' = ⊕_b M ⊗ e_b` as `Γ`-modules for every `E`-representation `M`, so a vector is invariant
exactly when each coordinate is; apply this to `M = Hom_E(V, W)`, which satisfies
`Hom_E(V, W) ⊗ E' ≅ Hom_{E'}(V_{E'}, W_{E'})` because `V` is finite-dimensional, and has
`Hom_E(V, W)^Γ = Hom_Γ(V, W)`. Tau Ceti's `Representation.finrank_intertwiningMap_baseChange`
is the dimension statement for finite `Γ`; the isomorphism here removes the finiteness of `Γ`.
*Needs:* EtaleCohomologyFoundations §F.4.0; Mathlib's linear-map scalar-extension formulas
for characteristic polynomial, trace and determinant, `TensorProduct.finsuppScalarRight` and
`Representation.linHom`; Tau Ceti `Representation.finrank_intertwiningMap_baseChange`.

**Checks.**
- `ℤ_ℓ(1)` along `ℤ_ℓ → ℚ_ℓ` is `ofCharacter χ_ℓ` over `ℚ_ℓ`; a definition that twisted the
  coefficients would change the character.
- Base change along the identity is isomorphic to `ρ`.
- For `ℤ_3 → ℤ_3[√2]` with residue extension `F₃ → F₉`, reduction of
  `[[1,1],[0,1]]` followed by extension has the same nonzero upper-right entry as extension
  followed by reduction; both traces are `2` and both determinants are `1`.
- An irreducible real rotation representation of `C₃` splits over `ℂ`; irreducibility alone
  is not preserved by coefficient extension, whereas absolute irreducibility is.
- Along `ℚ_ℓ → B` with `B` discrete the cyclotomic character of `G_ℚ` is not a `ContinuousRep`: the
  map is not continuous, and a definition not requiring `ContinuousSMul A B` would produce an
  invalid object.
- `dim_{K'} Hom_Γ(V_{K'}, W_{K'}) = dim_K Hom_Γ(V, W)`; a definition of base change that lost the
  `Γ`-action on the scalars would change this number for a non-split `V`.

**Operations.** Define restriction `ρ.res φ` along a continuous homomorphism `φ : Γ' → Γ` (a subgroup,
or `Field.absoluteGaloisGroup.mapOfAlgebra : G_L → G_K`); `directSum`; `tensor` (diagonal action);
`dual` (`(gλ)(m) = λ(g⁻¹m)`, so evaluation is invariant); `hom` (`g · f = ρ_N(g) ∘ f ∘ ρ_M(g)⁻¹`,
Mathlib's `Representation.linHom`); and `twist` (`M(χ) = M ⊗ A(χ)` for a continuous character `χ`,
realised on `M` by Tau Ceti's `Representation.charTwist`). Each is a `ContinuousRep` (for the tensor,
dual and Hom, given the finiteness, projectivity and module topology of the carrier, which hold for
finite projective inputs). Its API is functoriality of restriction (`res` along the identity is the
identity, and restriction composes), the formula on pure tensors, `M^{∨∨} ≅ M`,
`Hom_A(M, N) ≅ M^∨ ⊗_A N`, `M(χ)(ψ) = M(χψ)` and `M(1) = M`, the determinant formulas of §1.1,
`Hom_A(M, N)^Γ = Hom_Γ(M, N)` with evaluation and coevaluation morphisms, and commutation of all
operations with restriction and base change (DDT, §2.1, pp. 52–53; NT, display (1.1), p. 3).
*Needs:* Mathlib `Field.absoluteGaloisGroup.mapOfAlgebra`, `Representation.linHom`,
`Representation.dual`, `Representation.tprod`; Tau Ceti `Representation.charTwist`,
`ContRepresentation.linHom`, `ContRepresentation.continuous_linHom`, `ContRepresentation.conj_linHom`.

**Checks.**
- The dual of `ofCharacter χ` is `ofCharacter χ⁻¹`, and `ℤ_ℓ(1)^∨ ≅ ℤ_ℓ(−1)`; a definition of the dual
  by the transpose without inverse would return `χ` itself.
- `g ↦ ρ(g)ᵀ` is not multiplicative on `GL₂(F₂) ≅ S₃` (it is an anti-homomorphism), so the dual needs
  the inverse transpose.
- On a free carrier of rank `n`, `det(M(χ)) = χ^n det M` and `M(1) = M`; a twist acting by `χ(g)` on
  only one coordinate would give `χ det M`.
- `hom` carries Mathlib's `Representation.linHom`, which agrees with Tau Ceti's
  `ContRepresentation.linHom` over a complete normed field (`ContRepresentation.conj_linHom`).

**Tate twists.** The module `ℤ_ℓ(1)` with its `G_F`-action is Tau Ceti's `PadicTateTwist` with its
Galois representation (for a field `F` with `ℓ ≠ char F`, the inverse limit of `μ_{ℓ^n}(F̄)` on which
`σ` acts by `ζ ↦ ζ^{χ_ℓ(σ)}`). Define *TateTwist.zlOne* `F ℓ := ofCharacter χ_ℓ` with
`χ_ℓ = TauCeti.continuousLocalCyclotomicCharacter ℓ F`, and prove it isomorphic, as a continuous
representation over `ℤ_ℓ`, to `PadicTateTwist ℓ F̄` with the module topology, through a compatible
system of primitive roots of unity. Define *cyclotomicPow* `ℓ n = χ_ℓ^n` valued in a topological
`ℤ_ℓ`-algebra `A` and the Tate twist `tateTwist ℓ ρ n := ρ(χ_ℓ^n)`, equivalently
`M ⊗_{ℤ_ℓ} ℤ_ℓ(n)` with `ℤ_ℓ(n) = ℤ_ℓ(1)^{⊗n}` for `n ≥ 0` and `ℤ_ℓ(−n)^∨` for `n < 0`. Its API is
`tateTwist_add` (`M(m)(n) = M(m + n)`), `tateTwist_zero`, restriction to `G_{F'}` for `F'/F` finite
(`ℤ_ℓ(1)_F` restricts to `ℤ_ℓ(1)_{F'}`), duality `M(n)^∨ ≅ M^∨(−n)` and
`det M(n) = det M · χ_ℓ^{n · rank M}`. The value `χ_ℓ(Frob_v) = q_v` (`v ∤ ℓ`) is Tau Ceti's
`IsArithFrobeniusLift.coe_localCyclotomicCharacter` (DDT, §2.1, p. 50; Khare–Wintenberger 2009 (I),
§1.5, p. 4). *Needs:* Tau Ceti `PadicTateTwist`, `PadicTateTwist.galoisRepresentation`,
`localCyclotomicCharacter`, `continuousLocalCyclotomicCharacter`.

**Checks.**
- For `F = ℚ` complex conjugation acts on `ℤ_ℓ(1)` by `−1` and on `M(1)` by `−ρ(c)`; a twist by
  `χ_ℓ⁻¹` would give the same sign here, so the next check is needed as well.
- `M(0) = M`, and `ℤ_ℓ(1)^∨ ≅ ℤ_ℓ(−1) = ofCharacter χ_ℓ⁻¹`, not `ℤ_ℓ(1)`: at an arithmetic Frobenius
  above `p ≠ ℓ` the two take the values `p⁻¹` and `p`.
- In characteristic `ℓ` the cyclotomic character is trivial while `μ_{ℓ^n}(F̄) = 1`, so
  `PadicTateTwist ℓ F̄ = 0 ≠ ofCharacter 1`: the hypothesis `ℓ ≠ char F` is needed on both sides.

- `ℤ_ℓ(1)/ℓ^n ≅ μ_{ℓ^n}(F̄)` equivariantly, and on a free carrier of rank `r`,
  `det M(n) = χ_ℓ^{nr} det M` (`χ_ℓ²` for `M = ℤ_ℓ(1)`, `n = 1`).

### 1.3 Induction from open subgroups

**Continuous induction.** For `H` open in `Γ` (index `m`) and `(U, σ)` over `A`, define `IndV H σ` as
the functions `f : Γ → U` with `f(hx) = σ(h) f(x)` (Mathlib's `Representation.coindV`) and
`ind H σ` with `(g · f)(x) = f(xg)` (Mathlib's `Representation.coind` along `H → Γ`): for `Γ` compact
a choice-free `ContinuousRep` of rank `m · rank U`, isomorphic to `U^m` by `f ↦ (f(gᵢ))` for a right
transversal (other transversals give block-monomial matrices over `σ(H)`). Its API is the action
formula `ind_apply`, the transversal isomorphism, Frobenius reciprocity
`Hom_Γ(M, Ind U) ≃ Hom_H(Res M, U)` and `Hom_Γ(Ind U, M) ≃ Hom_H(U, Res M)`, Shapiro on invariants
`(Ind U)^Γ ≃ U^H` (`f ↦ f(1)`), transitivity `Ind_H^Γ Ind_K^H ≅ Ind_K^Γ`, functoriality in `U`, the
projection formula `Ind(Res M ⊗ U) ≅ M ⊗ Ind U`, duality, base change, and agreement of the
underlying representation with `Representation.coind` (Mathlib,
`RepresentationTheory/Coinduced.lean`, `coindV`, `coind`;
`RepresentationTheory/FiniteIndex.lean`, `Rep.indCoindIso`;
RepresentationTheory/InductionRestriction Layers 0–1 and 5). *Needs:* Mathlib `Representation.coind`,
`Rep.indCoindIso`; the finite-transversal topology target below.

**Checks.**
- `Ind_H^Γ U` has rank `[Γ : H] · rank U`, and `Ind 1` is the permutation representation on `H\Γ`;
  a definition by functions on `Γ` without the equivariance condition would have rank `#Γ · rank U`.

- `Ind_Γ^Γ U ≅ U`.
- For the closed subgroup `{0} ⊂ ℤ_ℓ` the module of functions `ℤ_ℓ → K` is not finitely generated,
  so the construction needs `H` open.
- A `Γ`-invariant `f` in `Ind U` is constant, `f(x) = (x · f)(1) = f(1)`, with value in `U^H` as
  `f(1) = f(h) = σ(h) f(1)`; so evaluation at any point of `Γ` gives the same map `(Ind U)^Γ ≃ U^H`,
  and for `U = 1` the invariants of the permutation module on `H\Γ` are the constant functions.

**The topology of the induced module.** Prove that for `Γ` compact and `H` open every function
`f : Γ → U` with `f(hx) = σ(h) f(x)` is continuous; that on the equivariant elements of `C(Γ, U)`
with the compact-open topology evaluation at a right transversal is an `A`-linear homeomorphism onto
`U^I`; and hence that this topology is the module topology and the identity identifies `ind H U`
with Mathlib's `ContRepresentation.coind`
(Mathlib, `RepresentationTheory/Continuous/Basic.lean`, `ContRepresentation.coind`).
Construct the homeomorphism and its continuous inverse by the finitely many open cosets, before
packaging continuous induction. *Needs:* Mathlib `ContinuousEvalConst`, `Representation.coindV`.

**Checks.**
- For `H = Γ`, evaluation at `1` is a homeomorphism onto `U`, with inverse `u ↦ (x ↦ σ(x)u)`.
- For finite index and trivial `σ`, the topology is the finite product topology on one value
  per coset, independent of the choice of representatives.
- For the closed non-open subgroup `{0} ≤ ℤ_ℓ`, arbitrary equivariant functions need not be
  continuous: the indicator of `{0}` with values in a discrete field is a counterexample.

**The Mackey decomposition.** Prove that for `H` open and `D` closed in a compact `Γ` and `U` over
`H`, the double coset space `H\Γ/D` is finite, and for any representatives `s`, with
`D_s := D ∩ s⁻¹Hs` (open in `D`) and `U^s` the representation `y ↦ σ(sys⁻¹)` of `s⁻¹Hs`,
`Res_D Ind_H^Γ U ≅ ⊕_{HsD} Ind_{D_s}^D Res_{D_s} U^s` as continuous representations of `D` (the summand
at `s` is the functions supported on `HsD`, carried to `d ↦ f(sd)`; another choice of `s` gives a
canonical isomorphism). Tau Ceti's `Rep.mackeyDecomposition` gives the abstract isomorphism (NT,
proof of Lemma 3.7(3), p. 19). *Needs:* Mathlib `DoubleCoset.Quotient`; Tau Ceti
`Rep.mackeyDecomposition`.

**The determinant of an induced representation.** Prove that for `H` open of index `m`, `U` of
constant rank `r`, `sgn_{Γ/H} : Γ → {±1}` the sign of the permutation action on `Γ/H` and
`Ver = MonoidHom.transfer`, `det(Ind_H^Γ U) = sgn_{Γ/H}^r · (det U ∘ Ver)` as continuous characters;
in particular `det Ind 1 = sgn_{Γ/H}` (Deligne 1973, §1, Prop. 1.2, p. 508). *Needs:* Mathlib
`MonoidHom.transfer`, `Equiv.Perm.sign`.

### 1.4 Discrete coefficients and finite image

**Discrete coefficients.** Prove that for `A` discrete and `M` finite projective, joint continuity is
equivalent to all vector stabilisers being open, to `ker ρ` being open, and to `ρ` factoring through
`Γ/N` for an open normal `N`; the image is then finite. For `Γ = G_F` this is factorisation through
`Gal(L/F)` for a finite Galois `L/F` inside `F^sep` (DDT, §2.1, p. 53; Chenevier, Example 2.34,
p. 39). *Needs:* Tau Ceti `Representation.isOpen_ker_of_finite`,
`Field.absoluteGaloisGroup.exists_finiteDimensional_normal_fixingSubgroup_le`,
`Field.absoluteGaloisGroup.finite_quotient_of_isOpen`.

<a id="adic-continuity-finite-truncations"></a>

**Adic continuity and finite truncations.** Let `A` be a separated complete Noetherian local
ring with finite residue field, with its maximal-adic topology, `M` finite projective (hence free),
and `Γ` profinite.
For an algebraic representation `ρ` on `M`, prove that joint continuity is equivalent to:
for every `n ≥ 1`, the induced action on `M/𝔪_A^n M` factors through `Γ/N_n` for some open normal
subgroup `N_n`. The finite quotient carries the discrete topology; no common `N_n` is required.
Prove compatibility of truncation, coefficient change and change of frame, and identify `ρ`
with the compatible limit of its truncations (DDT, §2.1, p. 53; Mathlib
`IsAdic` and `IsAdicComplete`, with the inverse-limit description of the maximal-adic topology).
*Needs:* §1.1 and the discrete-coefficient criterion above; Mathlib's adic topology and
finite-module quotient API.

**Checks.**
- `a ↦ [[1,a],[0,1]]` on `ℤ_p²`, for `a ∈ ℤ_p`, factors modulo `p^n` through `ℤ/p^n`,
  but has no open kernel before truncation.
- The trivial representation factors through the trivial quotient at every level.
- A discontinuous abstract sign character `∏_ℕ C₂ → {±1} ⊂ ℤ_3^×` fails already modulo `3`;
  finite image without an open kernel is insufficient.

**No small subgroups.** Prove that in a finite-dimensional normed `ℝ`-algebra `A` a subgroup
`G ≤ Aˣ` with `r = sup_{g∈G} ‖g − 1‖ < 1` is trivial; hence a continuous homomorphism
`Γ → GL_n(ℂ)` has open kernel and finite image (DDT, §2.1, p. 53). Route: for `g ∈ G` and an
eigenvalue `λ` of left multiplication by `g` on `A ⊗_ℝ ℂ`, `λ^n − 1` is an eigenvalue of left
multiplication by `g^n − 1` for every `n ∈ ℤ`, so `|λ^n − 1| ≤ r` by the spectral-radius bound;
hence `|λ| = 1`, and `λ = 1` because some power of a point `λ ≠ 1` of the unit circle has
`|λ^n − 1| ≥ 1`. So `N = g − 1` is nilpotent, and `g^n − 1 = Σ_{k≥1} C(n,k) N^k` is a polynomial
in `n` with values in `A`, bounded only if `N = 0`. Infinite-dimensional normed algebras are
outside this target: there a quasinilpotent `N ≠ 0` is excluded only by Gelfand's theorem on
doubly power-bounded elements with spectrum `{1}`. *Needs:* Mathlib `NormedAlgebra`,
`Module.End.hasEigenvalue_of_isRoot`, `spectrum.spectralRadius_le_nnnorm`.

**Checks.**
- In `ℚ_p` the subgroup `1 + pℤ_p` of units has `sup |g − 1| = p⁻¹ < 1` and is infinite, so the
  archimedean hypothesis is essential.
- In `ℂ = ℝ²` a primitive sixth root has `|ζ_6 − 1| = 1`, but `⟨ζ_6⟩ = μ_6` contains `−1`, so
  `sup_{g∈μ_6} |g − 1| = 2`: a bound on a generator does not bound the subgroup it generates.
- In `M₂(ℝ)` with the operator norm, `g = (1 t; 0 1)` with `0 < |t| < 1` has `‖g − 1‖ < 1`, but
  `‖g^n − 1‖ = |n t|` is unbounded, so `⟨g⟩` violates the hypothesis: the nilpotent step uses the
  whole subgroup, not a single element.

**Residual descent.** Prove that for a continuous `ρ : Γ → GL_n(F̄_p)`, `n ≥ 1`, the image is finite
and the subfield `k` generated by the matrix entries is finite with `ρ(Γ) ⊂ GL_n(k)`; so every
`n`-dimensional representation over `F̄_p` is `V_k ⊗ F̄_p`, and any finite `k' ⊃ k` works (Serre
1987, 1.1, p. 180; DDT, §2.1, p. 53). *Needs:* Mathlib `IntermediateField.finiteDimensional_adjoin`.

### 1.5 Descent from `ℚ̄_ℓ`

**Coefficient fields.** Prove that the subfields `ℚ_ℓ ⊂ E ⊂ ℚ̄_ℓ` of finite degree are countably many,
each of the form `ℚ_ℓ(β)` with `β` algebraic over `ℚ`, each closed in `ℚ̄_ℓ`, with union `ℚ̄_ℓ`. Prove
that for `Γ` compact Hausdorff every continuous `ρ : Γ → GL_n(ℚ̄_ℓ)` has entries in a coefficient
field `E`, which may be chosen to contain any prescribed finite `K/ℚ_ℓ` (Baire category). Prove that
every finite-dimensional representation over `ℚ̄_ℓ` is `V_E ⊗_E ℚ̄_ℓ`, that finitely many objects
and maps descend to one `E`, and that descended maps equal over `ℚ̄_ℓ` agree over an enlargement, so
the category over `ℚ̄_ℓ` is the filtered 2-colimit of those over coefficient fields (BHKT, proof of
Thm 4.8, p. 17; CG, §6.2, proof of Prop. 6.8, p. 839). *Needs:* Mathlib
`BaireSpace` and Baire's theorem `dense_iInter_of_isOpen`.

*Lean:* `ContinuousRep.baire_descent`.
### 1.6 Lattices and integral models

Throughout, `V` is a finite-dimensional `E`-vector space with the module topology, and a lattice in
`V` is a finitely generated `O_E`-submodule spanning `V` over `E`.

Use EtaleCohomologyFoundations §F.4.0's compact-closure criterion and integral models:
a subgroup of `GL(V)` stabilizes a lattice iff its closure is compact, and a continuous action
of compact `Γ` therefore has a stable lattice. Its `GaloisLattice.IntegralModel O ρ` supplies
the continuous restricted action `toContinuousRep`, the equivariant generic-fibre isomorphism,
homotheties, sums, intersections, saturation in stable subspaces, dual lattices and
commensurability. Section 1.9 uses that supplied interface for reduction; the foundation is
owned by §F.4.0.
For a DVR `O` with fraction field `E`, its finite lattices are torsion-free and therefore free and
projective over `O` (Mathlib `Module.free_of_finite_type_torsion_free'`). The freeness and
projectivity instances carry the DVR and fraction-field hypotheses explicitly.

**Integral descent and reduced buildings.** Combine §1.5's coefficient-field descent with the
supplied stable-lattice theorem to prove that a continuous `ρ : Γ → GL_n(ℚ̄_ℓ)` of compact Hausdorff
`Γ` is conjugate into `GL_n(O_E)` for a finite coefficient field `E`. For compact `Γ` and `n > 0`,
identify homothety classes of integral models with the `ρ(Γ)`-fixed vertices of the reduced building
`B_red(GL(V), E)`, the building of `PGL(V)`: if `ρ(g)Λ = c_g Λ`, then
`n · v(c_g) = v(det ρ(g)) = 0`, since the valuation character has compact image in `ℤ`.
Thus `c_g` is a unit and `Λ` is stable (DDT, §2.1, pp. 53–54; Ribet 1976, §2, p. 154;
BHKT, Thm 4.8(ii), p. 16).
*Needs:* §1.5; EtaleCohomologyFoundations §F.4.0; ReductiveGroupsPartII RG2.2.4
*gl-building-lattice-chains* and RG2.2.2 `ReducedBuilding`.
*Lean:* `ContinuousRep.exists_integral_conj_GL`.

**Checks.**
- The models of `ℚ_ℓ(χ)` are the `ℓ^k ℤ_ℓ`, with `k` unique; a definition allowing non-spanning
  submodules would add `0`.
- `V = 0` has only the zero lattice; it needs no reduced-building comparison.
- `(1 a; 0 1)` on `ℚ_ℓ²` has the non-homothetic models `ℤ_ℓ²` and `ℤ_ℓ e₁ ⊕ ℓℤ_ℓ e₂`, so models are not
  unique up to homothety in general.
- For `V ≠ 0` the whole of `V` is not a lattice (not finitely generated over `O_E`).
- With `O = ℤ_p` acting on `E = F_p` by reduction, the submodule `E` is finite, stable for the
  trivial action and spans `E`, but is not free over `O`: nonzero `p ∈ O` annihilates it.
  Here `E` is not the fraction field of `O`.
- Over `O = ℤ[√−5]` inside its fraction field, the ideal `(2, 1 + √−5)` is a finite stable
  spanning submodule of the trivial rank-one representation but is not free. It has norm `2`,
  whereas `a² + 5b² = 2` has no integer solutions, so it is not principal; `O` is not a DVR.
- For `n = 1` and `ρ` trivial the models `ϖ^m O_E` form one homothety class and `B_red(GL_1, E)` is a
  point, while the enlarged `B(GL_1, E)` is a line translated by `ϖ` (ReductiveGroupsPartII,
  `Building.gl1_translation`), so the comparison is with the reduced building; `ℤ` acting on `E` by
  `ϖ` fixes that point but stabilises no lattice, so compactness is needed.

### 1.7 Semisimplification and absolute irreducibility

**Semisimplification.** For `V` over a topological field `k`, `Γ`-stable subspaces (with the subspace
topology) and quotients are continuous representations (*subrep*, *quotientRep*). Define
*ContinuousRep.semisimplification* `ρ :` *ContinuousRep.Bundled* `Γ k`, where `Bundled` packages a carrier
with its instances and a representation: `V` has a composition series with irreducible quotients,
and `V^ss := ⊕ Vᵢ/Vᵢ₋₁` is semisimple with class independent of the series (Jordan–Hölder).
Everything holds for the underlying `Representation` of any monoid over any field. Its API is the
multiset of composition factors *ContinuousRep.compositionFactors* (multiplicities given by Tau Ceti's
`jordanHolderMultiplicity`), `V^ss ≅ V` iff `V` is semisimple
(Mathlib's `Representation.IsSemisimpleRepresentation`), `(V^ss)^ss ≅ V^ss`, `V^ss ≅ W^ss ⊕ (V/W)^ss`,
equality of characteristic polynomials and determinants of `V` and `V^ss`, and
`(V ⊗ k')^ss ≅ (V^ss ⊗ k')^ss` (DDT, §2.1, p. 54; DS, 6.12, p. 523). *Needs:* Mathlib
`CompositionSeries.jordan_holder`; Tau Ceti `jordanHolderMultiplicity`,
`compositionMultiplicity_eq_of_head_eq_of_last_eq`, `jordanHolderMultiplicity_eq_add_of_exact`.

**Checks.**
- `ℤ_p` on `F_p²` by `(1 a; 0 1)` has the characteristic polynomials of the trivial representation
  and is not semisimple: `V^ss ≅ 1 ⊕ 1 ≇ V`.
- `V` irreducible gives `V^ss ≅ V`, and `0^ss = 0`.
- For the three-dimensional unipotent Jordan block of `ℤ_p` over `F_p` (`p ≥ 3`) the sum
  `soc(V) ⊕ V/soc(V)` is not semisimple, so a one-step definition through the socle is wrong.

- The characteristic polynomial of `V^ss` at `g` is that of `V`, and `V^ss ≅ W^ss ⊕ (V/W)^ss`.

**Semisimplicity over a perfect field.** Prove that for `k` perfect, `k'/k` any extension and `Γ` a
monoid, a finite-dimensional semisimple `V` has `V ⊗_k k'` semisimple (equivalently `B ⊗_k k'` is
semisimple for finite-dimensional semisimple `B`); this fails for imperfect `k` (NT, §1.2, p. 7).
*Needs:* Mathlib `IsSemisimpleRing.exists_algEquiv_pi_matrix_divisionRing`.

**Absolute irreducibility.** Define *ContinuousRep.IsAbsolutelyIrreducible* for `V ≠ 0` over a field
`k`, in Burnside's form: the `k`-span of `ρ(Γ)` is `End_k(V)`; equivalently `V ⊗_k k̄` is irreducible
(no topology on `k̄`), or `V ⊗ k'` is irreducible for all `k'/k`, or `V` is irreducible with
`End_Γ(V) = k`. Valid for any monoid. Its API is the comparison with `k̄ ⊗ V`, invariance under every
`k ⊂ k'`, absolutely irreducible implies irreducible with scalar endomorphisms, and dimension one is
absolutely irreducible (Serre 1987, 1.1, p. 180; CG, §4, p. 812). *Needs:* Mathlib `jacobson_density`;
Tau Ceti `Representation.asAlgebraHom_surjective_of_isIrreducible`,
`Representation.isIrreducible_of_asAlgebraHom_surjective`.

**Checks.**
- Dimension one is absolutely irreducible.
- The zero representation is neither irreducible nor absolutely irreducible; a definition by the
  span condition alone would accept it, since `End(0) = 0` is spanned by the empty set.
- The rotation by `(0 −1; 1 0)` of `ℤ/4` on `ℚ²`, and `F_{p²}^×` on `F_p²`, are irreducible and not
  absolutely irreducible.
- Absolute irreducibility is unchanged by any extension `k ⊂ k'`, and agrees with the span criterion.

### 1.8 Brauer–Nesbitt

**Over an algebraically closed field.** For `k` algebraically closed, `Γ` a monoid and
finite-dimensional representations, prove that `k[Γ] → ∏ End_k(T_j)` is surjective for pairwise
non-isomorphic simple `T_j`; that semisimple `ρ₁, ρ₂` with equal traces have multiplicities
`a_T, b_T` of each simple `T` with `(a_T : k) = (b_T : k)` (equal in characteristic `0`, congruent
mod `p` in characteristic `p`); and that semisimple representations with equal characteristic
polynomials at every `g` are isomorphic, in any characteristic. Prove that for any field `k`, any
extension `k'` and finite-dimensional `V, W`, `(V ⊗ k')^ss ≅ (W ⊗ k')^ss` implies `V^ss ≅ W^ss` (DDT,
proof of Prop. 2.6, p. 54; Chenevier, end of proof of Thm 2.12, p. 31; NT, §1.2, p. 7; DS, proof of
Lemme 6.13, p. 523). *Needs:* Mathlib `Matrix.trace_eq_neg_charpoly_coeff`.

**Brauer–Nesbitt.** Prove that for any field `k` and any group or monoid `Γ`, finite-dimensional
`V, W` with equal characteristic polynomials at every `g ∈ Γ` (not only on generators) have
`V^ss ≅ W^ss`, and semisimple `V, W` are isomorphic, continuously for `ContinuousRep`s. Prove that if
`d!` is invertible in `k`, semisimple `V, W` of dimension `d` with equal traces are isomorphic; and
that for `Γ` a group, `k = F₂` and `d = 2` equal traces also give `V ≅ W` (DDT, Prop. 2.6,
pp. 53–54; Ribet 1976, §2, p. 154; DS, proof of Lemme 6.13, p. 523). *Needs:* Mathlib
`LinearMap.charpoly_baseChange`.

*Lean:* `ContinuousRep.iso_of_charpoly_eq`.
### 1.9 Reduction and the residual representation

**The residue field of `ℚ̄_ℓ`.** With `O = {‖x‖ ≤ 1}`, `𝔪 = {‖x‖ < 1}` in `ℚ̄_ℓ` and `κ = O/𝔪`, prove
that `κ` is an algebraic closure of `F_ℓ` (isomorphic to `AlgebraicClosure (ZMod ℓ)` non-canonically);
that for `m` prime to `ℓ`, `μ_m(ℚ̄_ℓ) ≅ μ_m(κ)` by reduction; and that `k_E ↪ κ` for each coefficient
field `E`, the images covering `κ`, the `q`-element subfield lying in `k_E` for `E = ℚ_ℓ(μ_{q−1})`
(NT, §1.2, p. 7). *Needs:* Mathlib `PadicAlgCl.valued`.

**Reduction.** Define the reduction of `(M, ρ)` over a topological local ring `A` with continuous
ring operations and continuous residue map `A → k_A` (`k_A` discrete; equivalently the maximal
ideal is open). In the Lean this compatibility is `ContinuousSMul O (IsLocalRing.ResidueField O)`,
with the scalar action through the residue map, together with `IsTopologicalRing O`: `M ⊗_A k_A` over `k_A`, with characteristic polynomials and determinant
reduced mod `𝔪_A`. Define *IntegralModel.reduction*: `ρ̄_Λ := Λ/ϖΛ = k_E ⊗_{O_E} Λ` over `k_E`, of
finite image, `ρ mod ϖ` in a lattice basis; *IntegralModel.residualSS* `:= ρ̄_Λ^ss`; and, for `V` over
`ℚ̄_ℓ`, *ContinuousRep.residual* `V := (ρ̄_Λ ⊗_{k_E} F̄_ℓ)^ss` over `F̄_ℓ = κ`, after a descent (§1.5) and
a model. Raw reduction commutes, through the canonical carrier isomorphisms, with coefficient
extension, `⊕`, `⊗`, duals, twists and restriction. For models `Λ, Λ'` over the same `O_E` and a
closed subgroup `H ≤ Γ`, the semisimplified operations satisfy
*residualSS*`(Λ ⊗ Λ') ≅ (`*residualSS*`(Λ) ⊗` *residualSS*`(Λ'))^ss` and
*residualSS*`(Res_H Λ) ≅ (Res_H` *residualSS*`(Λ))^ss`. For `ℚ̄_ℓ`-representations the formulas are
`residual(V ⊗ W) ≅ (residual(V) ⊗ residual(W))^ss` and
`residual(Res_H V) ≅ (Res_H residual(V))^ss` over `κ`. Direct sums, duals and rank-one twists
preserve semisimplicity, so their residual comparisons need no further semisimplification;
coefficient extension is followed by semisimplification in the residual construction.
Its API includes these isomorphisms, the characteristic polynomial and determinant formulas,
and finiteness of the image (DS, 6.12,
p. 523; Ribet 1976, §2, p. 154; BHKT, Def. 4.9, p. 17). *Needs:* Mathlib `IsLocalRing`; Tau Ceti
`Representation.baseChange`.

**Checks.**
- Any model of `ℚ_ℓ(1)` reduces to the mod `ℓ` cyclotomic character.
- With indiscrete topologies on `ℤ_3` and `ℚ_3`, a discontinuous abstract sign character of
  `∏_ℕ C₂` acts continuously on a stable rank-one lattice but has discontinuous reduction to
  discrete `F₃`. The residue map is discontinuous, so this input is excluded.
- `0` reduces to `0`, and the trivial `O_E^n` to the trivial representation.
- For `(1 a; 0 1)` on `ℚ_ℓ²`, `ℤ_ℓ²` and `ℤ_ℓ e₁ ⊕ ℓℤ_ℓ e₂` reduce to non-isomorphic representations
  (non-split versus trivial).
- The characteristic polynomial of `ρ̄_Λ(g)` is the reduction of that of `ρ(g)`, and
  `det ρ̄_Λ = det ρ mod ϖ`.
- The standard `ℚ_2`-representation of `S₃` on the sum-zero plane has simple reduction
  `V = F₂²` on its sum-zero lattice. On a transposition subgroup `C₂`, `Res V = J₂(1)` is
  nonsplit, whereas `residual(Res ρ) = 1 ⊕ 1`; the outer semisimplification is necessary.

<a id="marked-residual-lift"></a>

**Marked residual lifts.** For a topological local ring `A` with continuous residue map to a
discrete field `k`, a finite free continuous `A`-representation `ρ`, a continuous
`k`-representation `ρ̄` and a specified linear equivalence `ι : k ⊗_A M ≃ₗ[k] V̄`, define
*IsLiftOf* `ρ ρ̄ ι` to mean that `ι` intertwines the raw reduction of `ρ` with `ρ̄`.
Prove its scalar-extension, restriction and composition laws, and its frame description:
in bases lifting the marked residual basis, reduction of the matrices equals the fixed matrix
representation `ρ̄`. Changing such a lifted basis gives conjugation by a matrix reducing to `1`.
The marking is part of the input, and raw reduction is used without semisimplification
(Ribet 1976, §2, p. 154; DDT, §2.1, pp. 53–54).
*Needs:* §1.2's frames and scalar-extension comparisons; the reduction target above.

**Checks.**
- The identity marking makes the trivial `A^n` a lift of the trivial `k^n`.
- Over `F₃[ε]`, multiplying a basis vector by `1+ε` preserves the residual marking.
- Swapping the residual basis of `diag(1,−1)` over `F₃` changes the marking; an arbitrary
  isomorphism of residual semisimplifications does not give a marked lift.

**Independence of the lattice.** Prove that for two models `Λ, Λ'` of `V` over `E`,
`(Λ/ϖΛ)^ss ≅ (Λ'/ϖΛ')^ss` over `k_E` (the reductions have equal characteristic polynomials, and
Brauer–Nesbitt applies). Prove that for `V` over `ℚ̄_ℓ` the isomorphism class of the semisimplification
of `(Λ/ϖΛ) ⊗_{k_E} κ` is independent of the coefficient field `E`, of the descent and of `Λ`. Prove
that the residual representation is continuous, semisimple, of finite image, defined over a finite
field, that its characteristic polynomial at each `g` is the reduction of `V`'s, and that its class
is determined by these (DS, 6.12, p. 523; DDT, §2.1, p. 54; Ribet 1976, §2, p. 154; NT, §1.2, p. 7;
Serre 1987, 1.1, p. 180). *Needs:* Tau Ceti `jordanHolderMultiplicity_eq_add_of_exact`.

### 1.10 Coefficient twists and Teichmüller lifts

**Coefficient twists.** Define *coeffTwist* `σ ρ := ρ.baseChange σ` for a continuous ring automorphism
`σ` of `A` (framed: `σ` entrywise). For `A = F̄_p` or a finite field and `σ = frobeniusEquiv`,
*frobTwist* `ρ̄ := ρ̄^{Frob_p}`, equal to `ρ̄` over `F_p`. For `γ ∈ G_{ℚ_ℓ}` and `V` over `ℚ̄_ℓ` with
descent `V_E` and model `Λ`, `γ(Λ)` is a model of `V^γ` over `O_{γE}` and
`residual(V^γ) ≅ residual(V)^{γ̄}` for `γ̄` the image of `γ` in `Gal(F̄_ℓ/F_ℓ)`: inertia `I_{ℚ_ℓ}`
fixes the residual class and any arithmetic Frobenius lift sends it to `ρ̄^{(ℓ)}`. This twists
coefficients, not the base field. Its API is the entrywise formula, composition and the identity,
characteristic polynomials and determinants transformed by `σ` (commuting with all operations), the
Frobenius twist, and the residual formulas (NT, display (1.1), p. 3, and proof of Lemma 5.8, p. 43;
DS, proof of Lemme 6.13, p. 523). *Needs:* Mathlib `frobeniusEquiv`; Tau Ceti `inertiaSubgroup`,
`IsArithFrobeniusLift`.

**Checks.**
- A character `χ̄ : Γ → F_{p²}^×` with an element of order `p² − 1` in its image twists to
  `χ̄^p ≠ χ̄`.
- Over `F_p`, `ρ̄^{(p)} = ρ̄`, and the twist by the identity is `ρ`.
- Conjugating the argument of such a `χ̄` (for instance a character of `G_ℚ` through `(ℤ/N)^×`)
  returns `χ̄`, while the coefficient twist gives `χ̄^p`: twisting coefficients is not conjugation
  in the group.
- Characteristic polynomials transform by `σ`, and `residual(V^γ) ≅ residual(V)` for `γ ∈ I_{ℚ_ℓ}`.

**Teichmüller lifts.** For `K` a nonarchimedean local field and a residual character `ψ̄ : Γ → 𝓀[K]^×`
with open kernel, define `Teichmuller.lift K ψ̄ := TauCeti.teichmullerLift K ∘ ψ̄ : Γ → 𝒪[K]^×`: a
continuous character of the same finite order (dividing `q − 1`), reducing to `ψ̄`, the unique lift
valued in `μ_{q−1}(𝒪[K])` (equivalently of finite order prime to `ℓ`); for `ψ̄ : Γ → F̄_ℓ^×` it is
defined through any finite subfield containing the image (§1.4), valued in `ℚ̄_ℓ^×`. Example:
`ω := [χ_p mod p]`; for `p` odd, `χ_p = ω · ⟨χ_p⟩` with `⟨χ_p⟩` valued in `1 + pℤ_p`. Its API is
*residue_lift*, multiplicativity, the trivial character, inverses, uniqueness `eq_lift`, independence
of the coefficient field, and *orderOf_lift* (Khare–Wintenberger 2009 (I), §1.5, p. 4;
Dieulefait–Pacetti, arXiv:2108.07577v2, §1, Remark 2, p. 5). *Needs:* Tau Ceti `teichmullerLift`,
`residue_teichmullerLift`.

**Checks.**
- `[χ_p mod p]` on `G_ℚ` has order `p − 1` and reduces to `χ_p mod p`.
- `[1] = 1`.
- `χ_p` itself lifts `χ_p mod p` but has infinite order, so uniqueness needs finite order prime
  to `p` (equivalently values in `μ_{q−1}` for the local coefficient field).
- Over `E = ℚ_ℓ(ζ_ℓ)`, the trivial character and a nontrivial `C_ℓ → μ_ℓ(O_E)` both reduce to
  the trivial residual character: finite order alone does not give uniqueness.
- The lift is independent of the coefficient field and unique among prime-to-`ℓ` finite-order lifts.

### 1.11 Uniqueness of lattices and symplectic models

The classical Ribet lattice (a two-dimensional representation over `E`, irreducible over `E`, with
reducible residual semisimplification `φ₁ ⊕ φ₂` admits a stable lattice whose reduction is a non-split
extension of `φ₂` by `φ₁`, and one with the roles exchanged) is IntegralHeckeAndGaloisDeterminants,
§1.4, *Classical Ribet lattice* (Ribet 1976, Prop. 2.1, pp. 154–155).

**Uniqueness and self-dual models.** Prove that if `V` over `E` has an irreducible residual
representation over `k_E`, all models are `ϖ^j Λ₀`; and that, with the same hypothesis, for a perfect
`E`-bilinear pairing, symmetric or alternating, with `⟨ρ(g)x, ρ(g)y⟩ = μ(g)⟨x, y⟩` for a continuous
multiplier `μ : Γ → E^×`, `μ` is `O_E^×`-valued and some model is self-dual for `c⟨, ⟩`, `c ∈ {1, ϖ}`.
Prove that for `E/ℚ_ℓ` finite, `B` nondegenerate alternating with continuous multiplier `μ` and
irreducible residual representation, `dim V = 2g` and, after scaling `B` by an element of `E^×`, the
self-dual model has an `O_E`-symplectic basis; hence, read in a symplectic frame, `ρ` is conjugate
under `{g ∈ GL_{2g}(E) : gᵀ J g ∈ E^× J}` to a continuous representation with values in
`{g ∈ GL_{2g}(O_E) : gᵀ J g = μ J}`, `J = −Matrix.J` (CG, §6.2, proof of Prop. 6.8, p. 839; §6.3,
proof of Thm 6.13, p. 843). *Needs:* Mathlib `Submodule.le_of_le_smul_of_le_jacobson_bot`,
`Matrix.J`.

**Potential hyperspecial containment.** For split reductive `Ĝ` and a compact subgroup
`P ≤ Ĝ(E)`, `E/ℚ_ℓ` finite, find a finite totally ramified `E'/E` and a point of the reduced
building over `E` fixed by `P` whose image over `E'` is hyperspecial. Use a fixed facet centroid
with rational apartment coordinates and ramification to make it special. Compactness makes every
algebraic character of `P` unit-valued, so `P` lies in the hyperspecial parahoric. Prove conjugacy
of this model with the split integral model after further coefficient enlargement: the adjoint
group conjugates hyperspecial points and the conjugator lifts to `Ĝ` after finite extension
(BHKT, proof of Theorem 4.8(ii), p. 17, using Larsen 1995, Lemma 2.4).
*Needs:* ReductiveGroupsPartII RG2.2 *bruhat-tits-fixed-point-theorem*, RG2.2.3
*building-field-extension-embedding*, and RG2.3 hyperspecial models and stabilizers;
ReductiveGroups central isogenies.

**Checks.**
- `GL_n(O_E)` already fixes the standard hyperspecial vertex; degree-one extension suffices.
- In `SL₂(E)`, an edge midpoint becomes a vertex after ramification of index two; an
  unramified extension does not change the apartment's integral coordinates.
- A split torus compact subgroup is unit-valued, while the subgroup generated by a uniformiser
  is unbounded and cannot lie in integral units after any finite extension.

Section 1.11 owns the two generic interfaces below and exports them to the downstream
LanglandsParameterStacks LP2e.2–LP2e.4. Its LP2e.2 consumes **Reductive quotients over fields and
DVRs** with the field and excellent-DVR hypotheses stated here. Its LP2e.3 consumes
*IsGCompletelyReducible*, *IsAbsolutelyGCompletelyReducible*, conjugacy invariance and the `GL(V)`
semisimplicity comparison from **Complete reducibility and closed tuples**; its LP2e.4 consumes
that target's closed-tuple criterion and minimal-parabolic/Levi semisimplification. The
parameter-space applications, strong-reductivity and irreducibility predicates, and extensions to
nonconnected groups, R-parabolics or broader quotient hypotheses belong to LanglandsParameterStacks.

**Reductive quotients over fields and DVRs.** For a connected reductive `G` acting on an integral
affine variety `X` over a field, construct `X//G = Spec O(X)^G`, using coaction invariants.
Prove finite generation, the invariant-morphism universal property and normality when `X` is
normal. For an excellent DVR `O`, a reductive group scheme `G/O` and an integral affine flat
`O`-scheme `X` of finite type with `G`-action, prove the same assertions over `O`. For every
algebraically closed field `K` over the base, the quotient map is surjective on `K`-points and
each fibre in `X_K` has a unique closed `G_K`-orbit; two points have the same quotient value
exactly when their orbit closures intersect. Invariant closed subsets have closed images and
disjoint invariant closed subsets have disjoint images. Invariants commute with flat base
change. The map from the special-fibre quotient to the special fibre of the integral quotient
is bijective on algebraically closed points; an isomorphism of invariant algebras under
non-flat reduction is not asserted (BHKT, Proposition 3.2, p. 8, and Proposition 3.10,
pp. 10–11 of arXiv:1609.03491v2, using Seshadri's geometric reductivity over a base).
*Needs:* ReductiveGroups layer 6 and ReductiveGroupsPartII RG2.3.1 *reductive-model* for reductive
group schemes over a DVR; SchemeAndStackFoundations Layer 0 for affine schemes; Mathlib `AlgHom.equalizer` and `Subalgebra`
for coaction invariants. Finite generation and the geometric-reductivity quotient properties
are part of this target, over fields and excellent DVRs.

**Checks.**
- For `G_m` acting on `𝔸²` with weights `1, −1`, the quotient coordinate is `xy`; the fibre
  over `0` has the unique closed orbit `{0}`, although it contains nonclosed orbits.
- For `G = SL₂` and `X = G` with conjugation over `O`, an integral unipotent matrix and the
  identity have equal quotient values and their residual semisimplifications are conjugate.
- For `C₂` acting on `ℤ_2[x]` by `x ↦ −x`, the invariants are `ℤ_2[x²]`; reduction adds the
  invariant `x` over `F₂`. The natural map `F₂[x²] → F₂[x]` is not surjective. This tests the
  base-change limitation for invariant algebras, without treating `C₂` as reductive.

**Complete reducibility and closed tuples.** For a connected reductive group `G` over an
algebraically closed field `k`, define *IsGCompletelyReducible* `H` for a closed subgroup `H ≤ G`:
every parabolic containing `H` has a Levi subgroup containing `H`. For a homomorphism use the
Zariski closure of its image; over a general field define *IsAbsolutelyGCompletelyReducible* by
extension to an algebraic closure. Prove conjugacy invariance, and that for `G = GL(V)` the
condition is equivalent to semisimplicity of `V`. For every finite tuple `x ∈ G(k)^m`, its
simultaneous conjugacy orbit is closed exactly when the generated subgroup's Zariski closure is
`G`-completely reducible. Projection to a Levi of a minimal parabolic containing the image
produces a completely reducible homomorphism, independent up to `G(k)`-conjugacy of both choices.
On tuples this projection is a cocharacter limit in the unique closed orbit of the orbit closure.
These statements hold in every characteristic (BHKT, Definitions 3.3 and 3.5, Theorem 3.4,
Propositions 3.6–3.7 and the semisimplification paragraph preceding Proposition 3.6, pp. 8–9
of arXiv:1609.03491v2).
*Needs:* ReductiveGroups layers 2, 6–7 for closed subgroups, reductivity, parabolics, Levis and
cocharacters; the field quotient theorem above.

**Checks.**
- The nonidentity upper unipotent element of `SL₂(k)` limits to `1` under `diag(t, t⁻¹)`;
  its cyclic subgroup is not completely reducible and its semisimplification is trivial.
- A tuple in a torus has closed orbit; every torus-valued homomorphism is completely reducible.
- For `GL_n`, a nonsplit extension of trivial characters has the same semisimplification as
  the corresponding direct sum; an irreducible representation is already completely reducible.

**`Ĝ`-valued representations.** For `Ĝ` a split reductive group over `ℤ` and a continuous
`ρ : Γ → Ĝ(ℚ̄_ℓ)` of a compact `Γ`, prove that `ρ` is conjugate, after a finite extension of
coefficients, into `Ĝ(O_E)` for a hyperspecial integral model, and define its residual
representation over `F̄_ℓ` as the `Ĝ`-completely reducible semisimplification of the reduction.
Prove continuity, finite image and independence, up to `Ĝ(F̄_ℓ)`-conjugacy, of the integral
conjugation, coefficient field and Levi projection. For independence, place two integral
conjugates over a common coefficient DVR `O`, factor their raw reductions through a common
finite quotient of `Γ`, and choose lifts of generators of that quotient. Their integral tuples
have equal values on `O[Ĝ^m]^Ĝ`, since they are conjugate over the fraction field. Reduction
therefore gives equal points in the special fibre of the integral quotient. The DVR quotient
theorem and the closed-tuple criterion identify their Levi-projected tuples up to conjugacy;
the common finite quotient makes that single conjugator intertwine the full representations.
No comparison of non-flat invariant algebras is required. For `Ĝ = GL_n` this agrees with
§§1.6 and 1.9 (BHKT, Thm 4.8 and Def. 4.9, pp. 16–17, with Proposition 3.10 and
Proposition 3.6 for the finite-image independence argument). *Needs:* the two generic targets
above and potential hyperspecial containment; ReductiveGroupsPartII RG2.2.3
*building-field-extension-embedding* and RG2.3 (the hyperspecial parahoric model); `TauCetiRoadmap.ReductiveGroups` layer 9 for `Ĝ` over `ℤ`.

**Checks.**
- For `Ĝ = GL_n`, the construction agrees with a stable lattice and its residual semisimplification.
- The unipotent `C_ℓ` representation over `F_ℓ` reduces to a nontrivial extension, whose
  `GL₂`-completely reducible semisimplification is trivial; the raw reduction is not canonical.
- For `Ĝ = G_m`, a compact image in `E^×` is already unit-valued and its reduction is a character.

### 1.12 Restriction and induction

**Semisimplicity under restriction and induction.** Let `k` be a field, `H ≤ Γ` open with open normal
core `N`, all representations finite-dimensional continuous representations over `k`. Prove:
`H` normal and `V` semisimple give `Res_H V` semisimple, in any characteristic; `V` irreducible and
`H` normal give `Res_H V ≅ (W₁ ⊕ ⋯ ⊕ W_t)^{⊕e}`, the `Wᵢ` the distinct `Γ`-conjugates of any simple
constituent, with equal multiplicities and `t` the index of the open class stabiliser (Clifford);
`[Γ : H]` invertible and `Res_H V` semisimple give `V` semisimple; `[H : N]` invertible and `V`
semisimple give `Res_H V` semisimple; `[Γ : N]` invertible and `U` semisimple over `H` give
`Ind_H^Γ U` semisimple. All five reduce to the finite quotient `Γ/N` because the representations
are continuous with open kernels on finite-dimensional spaces, after shrinking `N`. The first two
are normal-subgroup Clifford theory: the translates of a simple `N`-submodule are simple and span
(Tau Ceti's `Representation.isSemisimpleRepresentation_comp_subtype` for irreducible `V`, any
characteristic), and the isotypic statement is Clifford's theorem over an arbitrary field
(Jacobson, *Basic Algebra II*, 2nd ed., §5.2; RepresentationTheory/InductionRestriction Layer 5,
*Clifford's theorem*). The other three are relative averaging: for an `H`-stable
complement `W′` of a `Γ`-submodule `W` with projection `p`, the operator
`[Γ : H]⁻¹ Σ_{g ∈ Γ/H} g p g⁻¹` is a `Γ`-equivariant projection onto `W` (Gaschütz's relative
Maschke theorem); restriction to `H` uses it over `H/N` after Clifford over `N`, and induction
uses it over `Γ/N` after Mackey's formula `Res_N Ind_H^Γ U = ⊕_{g ∈ Γ/H} {}^g(Res_N U)`.
*Needs:* Tau Ceti
`Representation.isSemisimpleRepresentation_comp_subtype`, `Representation.conjSubrep`,
`Representation.iSup_conjSubrep_eq_top`, `Rep.mackeyDecomposition`; RepresentationTheory/
InductionRestriction Layer 5.

**Checks.**
- For `H = Γ`, restriction and induction return the original representation.
- In characteristic `p`, the regular representation of `C_p` restricts semisimply to `1`
  but is not semisimple over `C_p`; ascent needs the invertible-index hypothesis.
- The simple natural representation of `S₃ = GL₂(F₂)` restricts to a transposition subgroup
  as a nontrivial unipotent extension; restriction to a nonnormal subgroup need not be semisimple.

### Examples

For a rank-one character, duality inverts the character and twisting multiplies it. On the zero
carrier the determinant character is trivial. In characteristic `p`, `p` copies of one character have
zero trace, so the trace criterion detects multiplicities only modulo `p`; with characteristic
polynomials it detects them exactly. The unipotent representation `(1 a; 0 1)` of `ℤ_ℓ` on `ℚ_ℓ²` is
the running example of a representation with two non-homothetic lattices whose reductions differ
(non-split and trivial) and have the same semisimplification.

### Dependencies

Mathlib and Tau Ceti as named; `TauCetiRoadmap.LocalFieldsRamification` layers 2 and 4 (through Tau
Ceti's inertia and Frobenius declarations); ReductiveGroupsPartII, RG2.2 and RG2.3, and
`TauCetiRoadmap.ReductiveGroups` layer 9, for the `Ĝ`-valued integral model, and RG2.2.2 and RG2.2.4
for the comparison of models with the reduced building;
IntegralHeckeAndGaloisDeterminants §1.4 for the classical Ribet lattice.

## Layer 2: decomposition groups, inertia and Weil–Deligne representations

This layer restricts a global representation to the places of a number field and fixes the local
objects every subsequent layer reads: inertia and Frobenius, the cyclotomic, tame and fundamental
characters, Weil–Deligne representations, local factors and their comparison with adelic
convergence factors, purity and local constants.

Standing hypotheses: `F` is a number field, `v` a finite place with completion `F_v`, residue field
`k_v`, `q_v = #k_v` and residue characteristic `p`. `K` is a nonarchimedean local field with residue
field `𝓀[K]` of cardinality `q`, and `G_K ⊃ I_K ⊃ P_K` are Tau Ceti's `inertiaSubgroup K` and
`wildInertiaSubgroup K`; an arithmetic Frobenius lift `Φ` is Tau Ceti's `IsArithFrobeniusLift`, and
`F = Φ⁻¹` is a geometric lift. The Weil group `W_K` and its degree map are those of
`TauCetiRoadmap.ClassFieldTheory` layer 9: `weilDegree` has kernel `I_K` and takes the value `1` on an
arithmetic lift. `ℓ ≠ p` throughout unless said otherwise. Representations are those of Layer 1.
Sources: Deligne 1973 = Deligne, *Les constantes des équations fonctionnelles des fonctions L*;
FSY = Fresán–Sabbah–Yu 2022.

### 2.1 Decomposition groups

**Global closure in the local closure.** Prove that for `ι : F̄ → F̄_v` an embedding over `F → F_v`,
`F̄_v` is the compositum `F_v · ι(F̄)`; hence an `F_v`-automorphism of `F̄_v` fixing `ι(F̄)` is the
identity, and every finite extension of `F_v` inside `F̄_v` is `F_v(ι(β))` for some `β ∈ F̄`. The proof
approximates the roots of a separable polynomial over `F_v` by roots of a polynomial over `F` and
applies Krasner's lemma (Deligne 1973, 3.12, p. 533). *Needs:* Mathlib `IsKrasner.krasner`;
`TauCetiRoadmap.LocalFieldsRamification` layer 0 (finite extensions of local fields).

**Decomposition and inertia groups.** Let `O` be the integral closure of `𝓞_F` in `F̄`; `G_F` acts on
`O` through `GaloisRep.toIntegralClosure` (Mathlib's `AlgEquiv.mapIntegralClosure`). For a maximal
ideal `Q` of `O` above `v`, define *GaloisRep.decompositionGroup* `Q = {σ : σ(Q) = Q}`,
*GaloisRep.inertiaGroup* `Q = {σ : σ(x) − x ∈ Q for all x ∈ O}`, the wild inertia group `P_Q` (the
largest closed normal pro-`p` subgroup of `I_Q`; intended signature
*wildInertiaGroup* `Q : Subgroup (Field.absoluteGaloisGroup F)`), and the arithmetic Frobenius
predicate `GaloisRep.IsArithFrobAtIntegralPrime σ Q`, which is Mathlib's `AlgHom.IsArithFrobAt` for
the action of `σ` (`σ(x) ≡ x^{q_v} mod Q`). Mathlib's group-action form of `IsArithFrobAt` does not
apply without a `MulSemiringAction` of `G_F` on `O`; the instance
`MulSemiringAction (Field.absoluteGaloisGroup F) O` is part of this target. For that action,
*inertiaGroup* `F Q = AddSubgroup.inertia Q.toAddSubgroup (Field.absoluteGaloisGroup F)`, with
definitionally equal carriers. Its API is
`D_{σQ} = σ D_Q σ⁻¹`, `I_Q ≤ D_Q`, `D_Q/I_Q ≃ Gal(k̄_Q/k_v)`, existence of arithmetic Frobenius lifts in
`D_Q` and the fact that they form one coset of `I_Q`, and agreement of the images in `Gal(L/F)` for
`L/F` finite Galois with the decomposition and inertia groups of `TauCetiRoadmap.NumberFieldArithmetic`
and its `decompositionHom` (Deligne 1973, 3.12, p. 533; Calegari–Geraghty 2018, p. 306). *Needs:*
Mathlib `AlgHom.IsArithFrobAt`, `AlgEquiv.mapIntegralClosure`, `AddSubgroup.inertia`;
`TauCetiRoadmap.NumberFieldArithmetic` layer 2 (§§2.1–2.3) and layer 5 (§5.6).

**Checks.**
- In `ℚ(i)`, the decomposition group of a prime above `p` acts trivially on `i` iff `p ≡ 1 mod 4`,
  and the inertia group acts nontrivially iff `p = 2`.
- For `p = 5` in `ℚ(∛2, ζ₃)` the image of `D_Q` in `Gal ≅ S₃` has order `2` and is not normal, so a
  definition that does not depend on `Q` (only on `v`) is wrong.
- Two arithmetic lifts at `Q` differ by an element of `I_Q`; the inverse of an arithmetic lift is
  never one, since `x ↦ x^{q_v}` has infinite order on `k̄_Q`.

<a id="valuation-subring-bridge"></a>

**Valuation-subring bridge.** For `O` and a maximal `Q` above `v` as above, realize the
localization `O_Q` as a valuation subring `A_Q ⊂ F̄`. Prove
*decompositionGroup* `F Q = A_Q.decompositionSubgroup F` and that *inertiaGroup* `F Q` is the
image of Mathlib's `A_Q.inertiaSubgroup F` under the decomposition subgroup inclusion,
transporting along the defining identification of `G_F` with the automorphism group.
Prove existence of `Q` above every finite `v`, transitivity of `G_F` on those `Q`,
`A_Q ∩ O = O` with maximal ideal contracting to `Q`, and that the residue field of `A_Q`
is an algebraic closure of `k_v`, of characteristic `p`. The induced valuation on
`F̄^{D_Q}` is henselian, with valuation ring the henselization of `(𝓞_F)_v`.
The residue action `D_Q → Gal(k̄_v/k_v)` is surjective with kernel `I_Q`; lift arithmetic
Frobenius through it and identify the lifts with the existing ideal-indexed predicate.
Use finite normal subextensions and their localizations, then pass to the directed union
(Stacks, [tag 0307](https://stacks.math.columbia.edu/tag/0307), integral closure and localization;
Neukirch, *Algebraic Number Theory*, Ch. II, §§6 and 9;
Rosengarten, [*Constructible Sheaves, Stalks, and Cohomology*](https://virtualmath1.stanford.edu/~conrad/Weil2seminar/Notes/L3.pdf),
Example 2.8, pp. 7–8, for the decomposition fixed field).
*Needs:* the decomposition and inertia target above; Mathlib `ValuationSubring`,
`ValuationSubring.decompositionSubgroup`, `ValuationSubring.inertiaSubgroup`, integral closure,
lying over and the infinite Galois correspondence. These bridges use the ideal-indexed inertia
group throughout. The interface follows the Imperial College London FLT project's use of
valuation subrings to connect global primes and geometric torsion.

**Checks.**
- Above `5` for `F = ℚ`, the residue field is `F̄₅`, not `F₅`; arithmetic Frobenius has
  infinite order there.
- In `ℚ(i)/ℚ` above `5`, conjugation exchanges the two primes and their valuation subrings;
  it belongs to neither finite decomposition stabilizer.
- Above `2` in `ℚ(i)/ℚ`, inertia is the whole finite decomposition group; taking inertia
  as a subgroup of `D` and then its image in `G` gives the same order-two subgroup.
- The decomposition fixed field in `ℚ̄` is henselian but is not the complete field `ℚ_p`.

<a id="finite-level-frobenius-transport"></a>

**Finite-level Frobenius transport.** For a finite Galois `L/F` embedded in `F̄`, restriction
of `σ` satisfying `IsArithFrobAtIntegralPrime σ Q` satisfies Mathlib's `AlgHom.IsArithFrobAt`
at `Q ∩ 𝓞_L`, relative to `𝓞_F`. For an intermediate number field `M`, put
`u = Q ∩ 𝓞_M` and `f = [k_u : k_v]`. If `σ_L^f` fixes `M`, it defines an automorphism over
`M` and is arithmetic Frobenius relative to `M` at `Q ∩ 𝓞_L`. The fixing condition holds
when `M_u/F_v` is unramified: the local residue action detects the automorphism on `M_u`.
Without it the `f`-th power only acts on residues by `#k_u`; it need not belong to `Gal(L/M)`.
Prove conjugation and tower compatibility (Neukirch, Ch. I, §9; Mathlib
`AlgHom.IsArithFrobAt`; Tau Ceti `IsArithFrobAt.restrictNormal` for unpowered finite restriction).
*Needs:* the valuation-subring bridge; Mathlib `AlgEquiv.restrictNormal`,
`NumberField.RingOfIntegers.algEquiv` and `AlgHom.mapIntegralClosure`.

**Checks.**
- For the unramified quadratic extension of `ℚ_5`, relative arithmetic Frobenius acts by
  `x ↦ x²⁵`, the square of the base arithmetic Frobenius.
- Restriction to `L = F` is the identity and is Frobenius on the base residue field.
- In the totally ramified quadratic extension `ℚ₂(i)/ℚ₂`, `f = 1` and the nontrivial
  automorphism is an arithmetic lift on residues; it does not fix the intermediate field
  `M = L`. The fixing hypothesis cannot be dropped.

<a id="finite-place-galois-action"></a>

**Finite-place Galois action.** For number fields `L/K`, define the action of `Gal(L/K)` on
`HeightOneSpectrum (𝓞 L)` by inverse comap, so
`(σ • w).asIdeal = w.asIdeal.comap (σ⁻¹ on 𝓞 L)` (*smul_asIdeal*). Prove *under_smul*:
contraction to `𝓞 K` is unchanged. Identify the stabilizer with the decomposition subgroup
of Mathlib's `valuationSubringAtPrime L w`. For finite Galois `L/K`, the orbit is precisely
the places with the same contraction. Use Tau Ceti's `completionCongr`, `decompositionHom` and
`decompositionEquiv` to give the stabilizer actions on `L_w`, its valuation ring, `L_w^×` and
the valuation-ring units, with compatible inclusions. Prove `(L_w)^D = image(K_v)` and the
corresponding fixed-ring and fixed-unit descriptions. For a tower `L/M/K` with `L/K` finite
Galois and `M/K` Galois, restriction `D_w(L/K) → D_u(M/K)` is surjective with kernel
`D_w(L/M)`; the actions commute with the completion embeddings (Neukirch, Ch. II, §9;
Mathlib `Algebra.IsInvariant.exists_smul_of_under_eq`; Tau Ceti
`IsDedekindDomain.HeightOneSpectrum.decompositionHom`).
*Needs:* Mathlib's action on ideals and `valuationSubringAtPrime`; Tau Ceti's completion
and decomposition APIs. This target adds the place action and its comparisons to those APIs.

**Checks.**
- The two primes above `5` in `ℚ(i)` form one orbit, each with trivial stabilizer.
- Above `3` in `ℚ(i)`, the unique place is fixed by the whole Galois group and the fixed
  subfield of the completion is `ℚ₃`.
- In an `S₃`-extension with a transposition decomposition group, the stabilizer is not
  normal; actions on one completion belong to the stabilizer, not the whole global group.
- For `M = K` the tower restriction has trivial target and kernel all of `D_w`; for
  `M = L` it is the identity with trivial kernel.

**The local embedding.** Define *GaloisRep.localEmbeddingMap* `F K : G_K →ₜ* G_F` as Mathlib's
`Field.absoluteGaloisGroup.mapOfAlgebra` along an embedding `ι` of algebraic closures over `F → K`
(`τ ↦ ι⁻¹ τ ι`). For `K = F_v` prove that it is a closed embedding onto `D_{Q(ι)}`, `Q(ι)` the prime
cut out by `ι`, carrying `I_K`, `P_K` and arithmetic Frobenius lifts onto `I_{Q(ι)}`, `P_{Q(ι)}` and
arithmetic lifts at `Q(ι)`; that replacing `ι` by `ι ∘ σ` (`σ ∈ G_F`) conjugates it by `σ`; and that
replacing `ι` by `τ₀ ∘ ι` (`τ₀ ∈ G_K`) precomposes with conjugation by `τ₀⁻¹` (Deligne 1973, 3.12,
p. 533). *Needs:* the two targets above; `TauCetiRoadmap.LocalFieldsRamification` layer 4.

**Local restriction.** Define *GaloisRep.localRestriction* `ρ := ρ.res (`*localEmbeddingMap* `F K)`, the
restriction `ρ_ι` of a continuous representation of `G_F` to `G_{F_v}`. Prove that `ρ(σ)` is an
isomorphism `ρ_{ι∘σ} ≅ ρ_ι` and `ρ_ι(τ₀)` an isomorphism `ρ_{τ₀∘ι} ≅ ρ_ι`, so the class of `ρ_ι` depends
only on `v`, with change-of-embedding isomorphism `ρ_ι ≅ ρ_{ι'}` given by
`ρ((ι⁻¹ι')⁻¹)`; that local restriction commutes with tensor products and restriction; that the
restriction of an induced representation is the sum over the places `w | v` of the induced local
representations (Mackey);
and that for `ρ` of finite image, `Gal(K_ρ,𝔭/F_v)` embeds in `Aut M` with inertia onto `ρ(I_Q)` and
wild inertia onto `ρ(P_Q)` (Deligne 1973, 3.12, p. 533). At a real place the local group is
`{1, c_ι}` (§4.1). *Needs:* Layer 1.

**Checks.**
- The local restriction of `ℤ_ℓ(1)` takes an arithmetic Frobenius at `p ≠ ℓ` to `p`; that of the
  trivial representation is trivial.
- `Ind_{G_{ℚ(i)}}^{G_ℚ} 1` restricts at `p ≡ 1 mod 4` to `1 ⊕ 1` and at `p ≡ 3 mod 4` to `1 ⊕ η`,
  `η` the unramified quadratic character, which is `Ind_{G_{ℚ_{p²}}}^{G_{ℚ_p}} 1` when `2` is invertible
  in the coefficients.
- For `ρ = 1 ⊕ η` induced from `ℚ(i)`, `ρ(c)` swaps the two summands of `Ind` although `ρ_ι = ρ_{ι∘c}`,
  and for an `S₃`-extension at `p = 5` the restrictions `ρ_{ι∘σ}` and `ρ_ι` are different
  homomorphisms: the isomorphism between local restrictions is not canonical.
- In the standard representation of `Gal(ℚ(∛2, ζ₃)/ℚ) ≅ S₃` at `5`, take
  `A = [[0,1],[1,0]]`, `B = [[0,−1],[1,−1]]` and `ι' = ι ∘ σ` with `ρ(σ) = B`.
  Then `A' = B⁻¹AB = [[−1,0],[−1,1]]`; `B⁻¹A = A'B⁻¹`, whereas `BA ≠ A'B`.

### 2.1a Arithmetic transport of the henselian-trait tame character

EtaleCohomologyFoundations §F.3a supplies the local-field comparison: for the valuation ring of
`K`, its trait inertia is `TauCeti.inertiaSubgroup K`, and henselian lifting identifies the residue
and generic prime-to-residue-characteristic roots of unity. The supplied tame character then
agrees with `TauCeti.inertiaPadicTameCharacter`, with its conjugation and ramification-index laws.

**Transport to a global decomposition group.** For a number field `F`, a finite place `v`, a
chosen embedding `F̄ → F̄_v` and a prime `ℓ` different from the residue characteristic, transport
this supplied comparison along §2.1's `G_{F_v} ≅ D_v` and `I_{F_v} ≅ I_v`. Prove that the resulting
character on `I_v` is the local character pulled back along this identification, that a change
of embedding transports it by the same conjugation as the local restriction of a global
representation, and that restriction along finite extensions has the supplied ramification-index
factor `e` (Stacks, Section 15.114, Lemma 09EE, Definition 0BU4, Lemmas 0BU5 and 0BU7,
Remark 0BU8).
*Needs:* §2.1; EtaleCohomologyFoundations §F.3a, including its local-field comparison and
restriction/conjugation laws; Tau Ceti `inertiaPadicTameCharacter`.

**Checks.**
- Arithmetic Frobenius conjugates the `ℓ`-component by multiplication by `#k`, as for the
  local-field character, after transport to `D_v`.
- For a ramified quadratic extension with `p ≠ 2`, restriction is twice the character
  normalized by the extension's uniformizer.
- Wild inertia maps to zero on both sides.

### 2.2 Ramification and Frobenius

**Inertia under finite extensions.** Prove that for `L/K` finite separable inside `K^sep`, with
`G_L ≤ G_K` the corresponding open subgroup, `I_L = I_K ∩ G_L` and `P_L = P_K ∩ G_L`, and that
`I_L = I_K` when `L/K` is unramified. At finite level this is the compatibility
`G_i(L'/L) = G_i(L'/K) ∩ Gal(L'/L)` of the lower numbering with subgroups, which passes to the limit
over finite Galois `L'/K` containing `L` (Serre, *Local Fields*, Ch. IV, §1, Prop. 2). *Needs:*
`TauCetiRoadmap.LocalFieldsRamification` layer 2 (`IsUnramified`) and layer 4 (images of `I_K`, `P_K`
in finite quotients).

**Ramification predicates.** Define, for a local representation, *GaloisRep.IsUnramified* (`ρ(I_K) = 1`)
and *GaloisRep.IsTamelyRamified* (`ρ(P_K) = 1`), and for a global one *GaloisRep.IsUnramifiedAt* `ρ v`
(`ρ(I_Q) = 1` for every maximal `Q` above `v`, equivalently for one), the ramification set
*GaloisRep.ramificationSet* `ρ` of finite places at which `ρ` is ramified, and *IsUnramifiedOutside* `S`
(intended signature `Prop` on a representation and a finite set of places; equivalently `ρ` factors
through `G_{F,S}`). Its API is *isUnramifiedAt_iff_exists*, finiteness of the ramification set when
the kernel is open (the ramified primes of the kernel field; finite image alone is not enough), the
bounds `Ram(ρ ⊗ ρ') ⊆ Ram ρ ∪ Ram ρ'` and `Ram(ρ^∨) ⊆ Ram ρ`, restriction and induction, and
unramifiedness of every equivariant quotient, in particular of every reduction (not conversely)
(Deligne 1973, 2.3, p. 523; CG, §4, p. 813). *Needs:* Tau Ceti `Ideal.isUnramifiedAt_iff_inertia_eq_bot`;
`TauCetiRoadmap.ClassFieldTheory` layer 9.

**Checks.**
- `Ram(ℤ_ℓ(1)) = {ℓ}`; the Dirichlet character of conductor `4` has ramification set `{2}`; the
  trivial representation has empty ramification set.
- The Kummer representation of `q_E ∈ ℚ_p^×` with `v(q_E) > 0` and `ℓ | v(q_E)` (see Examples) is
  ramified at `p` while its reduction modulo `ℓ` is unramified: the converse of unramifiedness of
  reductions fails.
- For `ρ` with open kernel (automatic for finite image over Hausdorff coefficients),
  `IsUnramifiedAt ρ v` agrees with unramifiedness of `v` in the finite kernel field (Tau Ceti's
  `Ideal.isUnramifiedAt_iff_inertia_eq_bot`); the character of `ℚ(i)/ℚ` is ramified at `2` on
  both sides. Finite image alone is not enough: a sign character into an indiscrete field can have
  dense kernel, fixed field `ℚ`, and nontrivial inertia image at `2`.

**Frobenius polynomials.** For `M` free of rank `n` and `ρ` unramified, define
*GaloisRep.frobCharpoly* `ρ := det(X − ρ(Φ))` for an arithmetic lift `Φ` (the Lean chooses one through
*GaloisRep.arithFrobLift*, Tau Ceti's `exists_isArithFrobeniusLift`, and proves independence); for a
global `ρ` unramified at `v`, `P_v(ρ, X)` is the polynomial of its local restriction, independent of
`Q | v`. `P_v(ρ^∨, X)` is the geometric polynomial `det(X − ρ(Φ⁻¹))`. Its API is independence of the
lift, monic of degree `n` with `nextCoeff = −tr ρ(Φ)` and constant term `(−1)^n det ρ(Φ)`, the dual,
direct sums, the twist `P(ρ ⊗ χ, X) = χ(Φ)^n P(ρ, χ(Φ)⁻¹X)` by an unramified character, coefficient
change, restriction to `L/K` of residue degree `f` (`ρ(Φ)^f`), invariance under semisimplification and
the formula of the Euler factor as the reversed geometric polynomial (§2.5) (Calegari–Geraghty 2018,
p. 306; Deligne 1973, 2.2.3, p. 522). *Needs:* Tau Ceti `exists_isArithFrobeniusLift`.

**Checks.**
- `P(ℤ_ℓ(1), X) = X − q`, not `X − q⁻¹` (the value with a geometric lift).
- The trivial representation of rank `n` has `P = (X − 1)^n`; a Dirichlet character `ε` has
  `P_p = X − ε(p)`.
- `P_v(ρ) = P_v(ρ^ss)`: the unipotent `(1 a; 0 1)` has the polynomial of the trivial representation.

**Unramified characters.** For `R` Hausdorff and `α ∈ R^×`, define *unramifiedCharacter* `α : G_K → R^×`
(intended signature `Field.absoluteGaloisGroup K →ₜ* Rˣ`, given a proof that `n ↦ α^n` extends
continuously to `Ẑ`), trivial on `I_K` with `Φ ↦ α`. It exists iff `n ↦ α^n` extends continuously to
`Ẑ`: for `E/ℚ_ℓ` finite iff `α ∈ O_E^×`, for `ℂ` iff `α` is a root of unity, and never for
`α = 1 + ℓ` in `ℤ_ℓ ∩ ℚ̄` with the discrete topology. Its API is uniqueness given the value at a lift,
`λ(αβ) = λ(α)λ(β)`, coefficient change, restriction (`λ(α^f)` on `G_L`), the geometric variant
`λ(α)(γ⁻¹)`, and the Weil-group character *GaloisRep.weilUnramifiedCharacter* `α = α^{weilDegree}`,
defined for every `α` (Calegari–Geraghty 2018, pp. 7–8; CG, §2, p. 807). *Needs:* Mathlib
`ProfiniteGrp.ProfiniteCompletion.lift`; `TauCetiRoadmap.LocalFieldsRamification` layer 2
(`Gal(K^ur/K) ≅ Ẑ`).

**Checks.**
- `λ(q) = χ_ℓ|_{G_K}`, and the geometric variant takes `Φ` to `q⁻¹`.
- `λ(1) = 1`, and `λ(α) mod ℓ = λ(α mod ℓ)`.
- There is no unramified `ℚ_ℓ^×`-valued character with `Φ ↦ ℓ`.

### 2.3 Characters of inertia

**Cyclotomic and Dirichlet characters.** The `ℓ`-adic cyclotomic character is Mathlib's
`cyclotomicCharacter` on the automorphisms of `F̄`, locally Tau Ceti's `localCyclotomicCharacter`, and
`χ_ℓ(Φ) = q` (Tau Ceti's `IsArithFrobeniusLift.coe_localCyclotomicCharacter`), so `χ_ℓ|_{G_K} = λ(q)`.
For a Dirichlet character `ε` of modulus `N`, define the Galois character
*dirichletCharacterToGalois* `ε : G_ℚ →* Rˣ` as `ε` composed with Mathlib's
`IsCyclotomicExtension.Rat.galEquivZMod` and the restriction `G_ℚ → Gal(ℚ(ζ_N)/ℚ)`, with
`ε_Gal(Frob_p) = ε(p)` for `p ∤ N` and `ε_Gal(c) = ε(−1)`. Prove that a character of `G_ℚ` with open
kernel is `ε_Gal` for a unique primitive `R`-valued `ε` (Kronecker–Weber), for every commutative
coefficient ring `R`: factor through a cyclotomic quotient and extend its unit-group homomorphism
by zero on nonunits using Mathlib's `MulChar.ofUnitHom`. Its image on units equals the Galois image.
For a continuous character into Hausdorff `Rˣ`, finite image is equivalent to open kernel and
implies finite order. If `R` is a domain, finite order also implies finite image, since a fixed
positive exponent bounds the image by the roots of `X^m − 1`; continuity then gives open kernel.
Prove that `ε_Gal` is compatible with change of level; that `χ_ℓ` is ramified exactly at `ℓ` with
`χ_ℓ(I_ℓ) = ℤ_ℓ^×`; and that for `p` odd `χ_p = ω · ⟨χ_p⟩` with `ω` the Teichmüller lift of
`χ_p mod p` and `⟨χ_p⟩` valued in `1 + pℤ_p` (modulo `4` for `p = 2`) (Deligne 1973, 2.3, p. 523; CG,
§2, p. 807). *Needs:* Tau Ceti `teichmuller`, `localCyclotomicCharacter`;
`TauCetiRoadmap.ClassFieldTheory` layer 13 (`kroneckerWeber`); §1.10.

**Checks.**
- `χ_ℓ(Frob_p) = p`; the character of conductor `4` sends `Frob_5 ↦ 1`, `Frob_3 ↦ −1` and `c ↦ −1`; the
  trivial Dirichlet character gives the trivial Galois character.
- `χ_ℓ(I_ℓ) = ℤ_ℓ^×`, so `χ_ℓ` is ramified at `ℓ`.
- `χ_ℓ mod ℓ^n` is Mathlib's `galEquivZMod` on `Gal(ℚ(ζ_{ℓ^n})/ℚ)`.
- Over `R = F₂[[t]][η]/(η²)` every open-kernel character is an `R`-valued Dirichlet character
  on units, with the same image. Finite order need not imply finite image: `1 + η F₂[[t]]` is
  infinite of exponent two. Independent quadratic quotients give a surjection
  `G_ℚ → ∏_{j≥0} C₂`, and `(a_j) ↦ 1 + η Σ_j a_j t^j` is a continuous infinite-image character
  for the `t`-adic topology, of order two with non-open kernel.

**The tame character.** The `ℓ`-adic tame character `t_ℓ : I_K → ℤ_ℓ(1)`, the `ℓ`-component of
`I_K/P_K ≅ Ẑ^{(p')}(1)`, is Tau Ceti's `inertiaPadicTameCharacter` (built from
`inertiaTameCharacter` and `quotientWildInertiaSubgroupEquiv`): `t_ℓ mod ℓ^n` is
`σ ↦ σ(π^{1/ℓ^n})/π^{1/ℓ^n}`, it is surjective (`inertiaPadicTameCharacter_surjective`), trivial on
`P_K`, and satisfies `t_ℓ(w σ w⁻¹) = χ_ℓ(w) · t_ℓ(σ)` (`inertiaPadicTameCharacter_conj`; with an
arithmetic lift, the `q`-th power, `IsArithFrobeniusLift.inertiaPadicTameCharacter_conj`). Witness of
the sign: for `α = π^{1/ℓ^n}`, `w⁻¹α = ζα` and `σα = ζ_σ α` give `wσw⁻¹α = ζ_σ^{χ_ℓ(w)}α`. Prove that
every continuous homomorphism with open kernel from `I_K` to a finite `ℓ`-group factors uniquely
through `t_ℓ`; that on `G_L` for `L/K` of ramification index `e` (`ℓ ∤ e`) the tame character is
`e · t_{ℓ,L}` up to the identification; and that `t_ℓ` does not extend to `G_K` (Frobenius multiplies
it by `q ≠ 1`). Define the trivialised `T ∘ t_ℓ : I_K → ℤ_ℓ` for an isomorphism `T : ℤ_ℓ(1) ≅ ℤ_ℓ`,
which changes by a unit under a change of `T` (Deligne 1973, 2.2.2(b), pp. 521–522; FSY, §5.3.1,
p. 54). *Needs:* Tau Ceti `inertiaPadicTameCharacter`, `PadicTateTwist`.

**Checks.**
- Over `ℚ_p`, `t_ℓ mod ℓ` is `σ ↦ σ(p^{1/ℓ})/p^{1/ℓ}`, and `t_ℓ` vanishes on `P_K`.
- `t_ℓ` does not extend to a character of `G_K`.
- After trivialising the twist, every homomorphism `I_K → ℤ/ℓ` with open kernel is a scalar
  multiple of `t_ℓ mod ℓ`, and a unit multiple iff it is nonzero. The zero homomorphism has
  open kernel `I_K` and scalar zero.

**Fundamental characters.** For a nonarchimedean local field `K` with finite residue field of
characteristic `p` and cardinality `q`, including equal characteristic, and `n ≥ 1`, the fundamental
character of level `n` is PadicLocalLanglandsForGL2Qp §0.3's `fundamentalCharacter` at niveau `n`:
`θ_{p^n−1} : I_t → F_{p^n}^×` on the tame inertia quotient `I_t = I_K/P_K`, the reduction of the
Kummer character of a `(p^n−1)`-st root of a uniformiser through the retained residue embedding of
`F_{p^n}`. The supplier owns its independence of the uniformiser and root, the Teichmüller lift,
the least niveau of a finite-image tame character (the `level` here, with *IsFundamentalOfLevel* `n`
meaning level `n`), surjectivity, restriction and norm compatibility between niveaux, conjugation of
coefficients by `p`-powers, the Frobenius law `θ(s u s⁻¹) = θ(u)^q` for an arithmetic lift `s`, and
the niveau-one comparison `θ_{p−1}^{e} = χ̄_p|_{I_K}` for finite `K/ℚ_p` of absolute ramification
index `e`. Here `I_t` is taken as Tau Ceti's quotient
`inertiaSubgroup K ⧸ (wildInertiaSubgroup K).subgroupOf (inertiaSubgroup K)`, identified with
`ℤ̂^{(p')}(1)` by `quotientWildInertiaSubgroupEquiv` as in **The tame character** above. Define
`fundamentalCharacter K n`, with signature that quotient `→* (GaloisField p n)ˣ` after the supplier's
residue embedding, as an abbreviation of the supplier's character transported along the
identification of this quotient with the supplier's tame inertia quotient. Define
*fundamentalCharacter_pow_p* as the abbreviation of the norm law `θ_{p²−1}^{p+1} = θ_{p−1}`, that is
`ω_2 · ω_2^p = ω` for `ω_2 = θ_{p²−1}`, and *cyclotomic_restrict_tameInertia* as the abbreviation of
the niveau-one comparison, which over `ℚ_p` reads `θ_{p−1} = χ̄_p|_{I}` (Serre 1987, 2.1, p. 183;
Serre 1972, 1.3, Prop. 2, p. 264, 1.7, p. 267, and 1.8, Prop. 8, p. 269; Khare–Wintenberger 2009 (I),
1.5, p. 4). The downstream FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.26 owns the extension
to arbitrary perfect residue fields, with an agreement theorem after identifying inertia, roots of
unity and the chosen residue embeddings.
*Needs:* PadicLocalLanglandsForGL2Qp §0.3 (`fundamentalCharacter` at every niveau, its residue
embeddings, Teichmüller lift, least niveau, norm, restriction and Frobenius laws, niveau-one
comparison); Tau Ceti `inertiaSubgroup`, `wildInertiaSubgroup`, `quotientWildInertiaSubgroupEquiv`,
`rootsOfUnityEquivResidueField`, `residue_teichmuller`, `inertiaKummerCharacter`.

**Checks.**
- `ω_2^{p+1} = ω`, and over `ℚ_p`, `θ_{p−1} = χ̄_p|_{I}`; the trivial character has level `1`.
- `ω_2` extends to `G_{ℚ_{p²}}` but not to `G_{ℚ_p}`.
- The Teichmüller lift of `θ` reduces to `θ`.
- The identification of Tau Ceti's tame quotient with the supplier's tame inertia quotient is
  compatible with Kummer characters: over `ℚ_p` with `π = p`, both send `σ` to the reduction of
  `σ(p^{1/(p−1)})/p^{1/(p−1)}` in `F_p^×` (Tau Ceti's `inertiaKummerCharacter (p − 1)` at `p`),
  and the image of wild inertia goes to `1` on both sides.

**Inertia on residual representations.** Let `k₁` be a discrete field of characteristic `p` and
`ρ̄ : G_K → GL(V)` continuous on a finite-dimensional `V`. Prove that a semisimple `ρ̄` kills `P_K`,
and `I_K` acts on `V^ss` through `I_t` by a multiset of products of fundamental characters stable
under `x ↦ x^q`, in particular through a cyclic group of order prime to `p`. For `K = ℚ_p`, `dim V = 2`
and `k₁ = F̄_p`, prove that the inertia characters have level `1` or `2`, conjugate (`φ' = φ^p`) in
level `2`; that level `2` happens iff `ρ̄` is irreducible; that for `χ : G_{ℚ_{p²}} → F̄_p^×` with
`χ|_I = ω_2^j`, `Ind χ` has inertia characters `ω_2^j, ω_2^{pj}` and is irreducible iff `(p + 1) ∤ j`,
every irreducible `ρ̄` arising so; and that for `(p + 1) | j`, `Ind χ` is `χ̃ ⊕ χ̃η` for `p` odd and a
non-split self-extension of `χ̃` for `p = 2` (Serre 1972, 1.6, Prop. 4, p. 265; Serre 1987, 2.1,
Prop. 1, and 2.2, p. 183). This is the finite-residue representation-theoretic classification;
The downstream Raynaud exponent bounds and finite-flat realizability targets are owned by
FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.27–R07.1.32.

**Checks.**
- Over `ℚ_p`, the two inertia characters of `Ind χ` with `χ|_I = ω_2` have level `2`
  and are exchanged by arithmetic Frobenius; `ω ⊕ 1` has only level-1 characters.
- If `(p + 1) | j`, `Ind χ` splits for odd `p`; for `p = 2`, `Ind 1` is a non-split
  self-extension of the trivial character, although its semisimplification is trivial.
- Over the unramified cubic extension of `ℚ_p`, `θ_{p³−1} ⊕ 1` extends to a continuous
  rank-two representation and has a level-3 inertia character: finite residue field alone
  does not give the level-1/level-2 conclusion.
- In the perfect-residue extension supplied by R07.1.26, for `K = Frac W(F̄_p)` one has
  `G_K = I_K`, and `θ_{p³−1} ⊕ 1` is a continuous rank-two representation with trivial
  wild inertia and a level-3 character. There is no residue Frobenius imposing the two-level bound.

### 2.4 Arithmetic Weil–Deligne adapter

SmoothRepresentationsOfLocalGroups SR.5.2 supplies the
[linear substrate](../SmoothRepresentationsOfLocalGroups/README.md#wd-linear-substrate),
[nilpotent exp/log calculus](../SmoothRepresentationsOfLocalGroups/README.md#nilpotent-exp-log),
[Grothendieck monodromy](../SmoothRepresentationsOfLocalGroups/README.md#grothendieck-monodromy),
[parameter operations](../SmoothRepresentationsOfLocalGroups/README.md#wd-parameter-operations),
[full construction and inverse](../SmoothRepresentationsOfLocalGroups/README.md#full-wd-construction),
and [Frobenius semisimplification](../SmoothRepresentationsOfLocalGroups/README.md#wd-frobenius-semisimplification).
These operate on the canonical parameter's underlying `(V, r, N)` fields before imposing
Frobenius semisimplicity. Section 2.4 specializes the supplied monodromy theorem to
`ContinuousRep` and packages its underlying action through the full construction; §2.5 identifies
its semisimplified output with the supplier's `classical-llc-normalization`.
Here `WD(ρ)` denotes the full construction; `WD(ρ)^{F-ss}` is the supplier's normalized output.

The supplied exp/log calculus in a `ℚ`-algebra uses
`log u = Σ_{1 ≤ i < b} (−1)^{i+1}(u − 1)^i/i` for `(u − 1)^b = 0`, inverse to
Mathlib's `IsNilpotent.exp`. This is the calculus supplied by
SmoothRepresentationsOfLocalGroups SR.5.2 `nilpotent-exp-log`.

**ContinuousRep monodromy specialization.** For a nonarchimedean local field `K` of residue
characteristic `p`, finite `E/ℚ_ℓ`, `ℓ ≠ p` and
`ρ : ContinuousRep G_K E V` on finite-dimensional `V` with its module topology, specialize
SmoothRepresentationsOfLocalGroups SR.5.2 `grothendieck-monodromy` to obtain a unique nilpotent
`N ∈ Hom(ℤ_ℓ(1), End V)` with
`ρ(σ) = exp(N(t_ℓ σ))` on an open subgroup of inertia and
`ρ(w) N(x) ρ(w)⁻¹ = N(χ_ℓ(w) x)`. With a trivialisation `T`, the scalar operator
`N' = N(T⁻¹ 1)` satisfies `ρ(Φ) N' ρ(Φ)⁻¹ = q N'`.
Transport the supplied equivalence between finite inertia image and `N = 0` and the
ramification-index scaling under compatible tame identifications
(Deligne 1973, 8.1 and Thm 8.2, p. 566; FSY, §5.3.1, p. 54).
*Needs:* Layer 1; SmoothRepresentationsOfLocalGroups SR.5.2 `grothendieck-monodromy` and
`nilpotent-exp-log`; Tau Ceti's inertia, tame and cyclotomic characters.
*Lean:* `GaloisRep.grothendieck_quasiUnipotent`.

**Checks.**
- A finite-image representation has `N = 0`.
- The Tate curve has nonzero rank-one monodromy; inertia acts unipotently on an open subgroup.
- For `ℓ = p`, `χ_p` on `G_{ℚ_p}` has infinite, non-unipotent image on every open inertia
  subgroup, so the theorem requires `ℓ ≠ p`.

The parameter operations are supplied by SmoothRepresentationsOfLocalGroups SR.5.2
`wd-parameter-operations` on its canonical characteristic-zero fields `(V, r, N)` with
finite-dimensional `V`, open-kernel `r`, nilpotent `N` and
`r(w) N r(w)⁻¹ = q^{deg w} N`. Arithmetic Frobenius has degree `+1` and geometric Frobenius
has degree `−1`. The arithmetic adapter consumes its morphisms, isomorphisms, sums, tensors,
duals `(r^∨, −N^∨)`, twists, determinants, restriction, induction, coefficient extension,
inertial type and special pairs `Sp(n)`, with the supplier's degree and tame identifications.

**Local Weil-group bridge.** Identify ClassFieldTheory Layer 9's local Weil group and arithmetic
`weilDegree` in the canonical parameter fields with Tau Ceti's `I_K`, tame character and Frobenius lifts.
Use the supplied open topological inertia embedding, continuous surjective degree map and
continuous dense map `W_K → G_K`; an arithmetic lift gives `W_K = I_K ⋊ ⟨Φ⟩`.
The arithmetic adapter preserves these identifications, so an open-kernel Weil representation
has finite inertia image and every parameter operation uses the same local Weil group
(Deligne 1973, §2.2.1, p. 521; ClassFieldTheory Layer 9,
`isOpenEmbedding_inertiaToWeil`, `unramifiedCoordinate_weilDegree`).
*Needs:* ClassFieldTheory Layer 9; Tau Ceti inertia
and arithmetic Frobenius.

**Checks.**
- `weilDegree(Φ) = 1` and `weilDegree(Φ⁻¹) = −1`.
- `I_K` is open in the Weil topology, whereas its infinite-index image is not open in `G_K`.
- An unramified Weil character may send `Φ` to any nonzero scalar; extension to `G_K`
  requires the continuity condition of §2.2.

**Arithmetic adapter for the full construction.** For nonarchimedean local `K` of residue
characteristic `p`, finite `E/ℚ_ℓ` and `ℓ ≠ p`, package the underlying linear action of
`ρ : ContinuousRep G_K E V` on finite-dimensional `V` with its module topology through
SmoothRepresentationsOfLocalGroups SR.5.2 `full-wd-construction`.
The output is the canonical fields `(V, r, N')`, without imposing Frobenius semisimplicity.
For a geometric lift `F` and trivialisation `T : ℚ_ℓ(1) ≅ ℚ_ℓ`, use the supplied formula
`t = T ∘ t_ℓ`, `N' = N(T⁻¹ 1)` and
`r(F^n σ) = ρ(F^n σ) exp(−t(σ)N')`.
The supplier gives `V^{ρ(I)} = (ker N')^{r(I)}`, finite inertia image iff `N' = 0`,
change-of-lift and trivialisation isomorphisms, and the inverse for Frobenius eigenvalues
of `ℓ`-adic absolute value one. Transport these to the adapter, together with exactness,
faithfulness and compatibility with tensor products, restriction and induction.
A basis identifies the underlying action with the matrix input of
`classical-llc-normalization`; prove naturality under change of basis and the agreement of
its Frobenius-semisimplification with that supplied parameter in §2.5
(Deligne 1973, 8.3.7, p. 568, and 8.4.2–8.4.3, p. 569; Bushnell–Henniart, §32.6,
pp. 206–207). *Needs:* Layer 1; the `ContinuousRep` monodromy specialization and local bridge
above; SmoothRepresentationsOfLocalGroups SR.5.2 `full-wd-construction`,
`wd-parameter-operations` and `classical-llc-normalization`.

**Checks.**
- `WD(ℚ_ℓ(1)) = (ω, 0)`; an unramified full parameter has `N = 0` and `r = ρ|_{W_K}`.
- An unramified Jordan-block representation has that same block in its full parameter;
  its Frobenius-semisimplified parameter is trivial. Exactness and the inverse refer to the full functor.
- The Tate curve has full parameter `Sp(2)`, and its non-split unramified quadratic twist
  has `Sp(2) ⊗ η`; neither has parameter `(1 ⊕ ω, 0)`.
- For `ℓ = p`, the cyclotomic character on `G_{ℚ_p}` has no such monodromy operator.
- The unramified pair `r(Φ) = ℓ`, `N = 0` is a Weil parameter but has no continuous
  extension to `G_K`; Frobenius eigenvalues of absolute value one are required for the inverse.

### 2.5 Local factors

**Agreement with the normalized Weil–Deligne functor.** Use the characteristic-zero
operation on the canonical fields supplied by SmoothRepresentationsOfLocalGroups SR.5.2
`wd-frobenius-semisimplification`. It retains `N`, is independent of the lift for finite
inertia image, and is compatible with tensors, duals and coefficient extension;
ordinary semisimplification instead gives `(V^ss, r^ss, 0)`.
Prove that applying this supplied operation to the arithmetic adapter of §2.4 gives the
parameter of SmoothRepresentationsOfLocalGroups SR.5.2 `classical-llc-normalization`,
naturally under basis change and compatibly with duals and coefficient extension.
The local-factor and purity targets consume the supplied operation and predicate
(Deligne 1973, 8.5–8.6, p. 570; Saha, Definition 2.1 and the following construction, pp. 2–3).
*Needs:* §2.4's arithmetic adapter; SmoothRepresentationsOfLocalGroups SR.5.2
`wd-frobenius-semisimplification`, `full-wd-construction` and `classical-llc-normalization`.

**Checks.**
- The unramified pair `r(F) = (1 1; 0 1)`, `N = 0` becomes `r(F) = 1`, with `N = 0`.
- `Sp(n)` is fixed; `Sp(2) ≇ (1 ⊕ ω, 0)` because semisimplifying Frobenius retains monodromy.
- For `Sp(2) ⊕ (Jordan block)`, the full parameter, its Frobenius semisimplification and its
  ordinary semisimplification are three distinct objects.
- Over `Ω = F_p(t)`, minimal polynomial `(X^p − t)²` gives no Jordan decomposition.
- Over `F₃` for `K = ℚ₇`, `r(τ) = (1 1; 0 1)`, `r(Φ) = 1`, `N = 0` satisfies the tame relation.
  Semisimplification at `Φ` fixes `r`; at `Φτ` it sends `Φ` to `r(τ)⁻¹`. The resulting
  parameters are not isomorphic, so perfectness alone does not give lift independence.

**Local factors.** On the canonical parameter fields define the arithmetic local factor
*WeilDeligneRep.localFactor*,
`L(V, X) = det(1 − X r(F) | (ker N)^{r(I_K)})` for a geometric lift `F`, and
*GaloisRep.localEulerFactor* on `V^{ρ(I_K)}`; for a global `ρ` and `v ∤ ℓ`,
`L_v(ρ, X) = L(ρ|_{G_{F_v}}, X)`, and `L_v(V_ℓA^∨, X) = det(1 − X Frob_v | (V_ℓA)_{I_v})`. Prove
independence of `F`; additivity on direct sums; invariance under isomorphism;
`L(V ⊗ λ_W(α), X) = L(V, α⁻¹X)`; multiplicativity in exact sequences with `N = 0`
and exact inertia invariants (in particular for a common finite inertia quotient of order
invertible in `Ω`, including characteristic zero); multiplicativity for split sequences even
with nonzero monodromy;
`L_v(ρ) = L(WD(ρ))`; and `L = det(1 − Xρ(F))` at an unramified place (Deligne 1973, 3.5.1, p. 528, and
8.12, p. 572; Saha, Lemma 2.3, p. 3, for averaging over finite inertia).
*Needs:* §2.4's arithmetic adapter; SmoothRepresentationsOfLocalGroups SR.5.2
`wd-parameter-operations` and `full-wd-construction`.

**Checks.**
- `L(ω, X) = 1 − q⁻¹X` and `L(Sp(2), X) = 1 − q⁻¹X`, while `L(Sp(2)^∨, X) = 1 − X`.
- Computing `L(Sp(2))` on all of `V`, or with an arithmetic lift, gives a different polynomial.
- `L(0) = 1`, `L(1) = 1 − X`, and `L(Sp(2)) ≠ L(ω) L(1)`: no multiplicativity in exact sequences with
  nonzero monodromy in general.
- The tame `C₃`-extension over `F₃` just above has `N = 0` but one-dimensional inertia invariants:
  its factor is `1 − X`, whereas its two trivial constituents give `(1 − X)²`. Exactness of
  inertia invariants is essential.

**Local factors of induced representations.** Prove that for `A` commutative, `V` finite free and
`φ ∈ End V` and `n ≥ 1`, the cyclic block `φ_n` on `V^n` (sending block `i` to block `i + 1` for
`i < n − 1` and applying `φ` from block `n − 1` to block `0`) has `det(1 − X φ_n) = det(1 − X^n φ)`;
`V = 0` is allowed (Deligne 1973, 3.9, p. 531). Prove that for `L/K` finite separable of residue degree `f` and `V` a representation of
`W_L` over any field, `(Ind V)^{I_K} ≅ (V^{I_L})^f` by `φ ↦ (φ(F_K^{f−1}), …, φ(1))`, carrying `F_K` to
the cyclic block of `F_L`, and `ker N_Ind = Ind(ker N)` (Deligne 1973, proof of 3.8(ii), p. 530). Hence
`L(Ind(V, r, N), X) = L(V, X^f)` and `WD(Ind ρ) ≅ Ind WD(ρ)`; and for `L/F` a finite extension of
number fields, `ρ` a representation of `G_L` over a field of characteristic zero and `v ∤ ℓ`,
`L_v(Ind ρ, X) = ∏_{w | v} L_w(ρ, X^{f(w|v)})`, with the same formula for `P_v` when `L/F` and `ρ` are
unramified at and above `v` (Deligne 1973, 3.8(ii), p. 530).

**Checks.**
- Over `ℚ`, rank-one `φ = 2` with two blocks is `[[0,2],[1,0]]`, with characteristic
  polynomial `X² − 2`; the wraparound map applies `φ` from the last block to the first.
- Rank-one `φ = 1` with two blocks has characteristic polynomial `X² − 1`.
- Rank-one `φ = 0` with three blocks has characteristic polynomial `X³`.
- For `n = 0` the identity fails: `V^0 = 0` gives `det(1 − X φ_0) = 1`, while `φ = id` on `V = ℚ`
  gives `det(1 − φ) = 0`; the hypothesis `n ≥ 1` is essential.

### 2.5a Comparison with the adelic convergence factors

**Finite-image comparison with Galois and Weil–Deligne local polynomials.** Let `ρ` be a
continuous finite-image representation of `G_F`, for a number field `F`, on a finite-dimensional
vector space `V` over a number field `C`. Fix embeddings `ι∞ : C → ℂ` and `ιℓ : C → Eℓ`, where
`Eℓ/ℚ_ℓ` is finite, and write `ρ_ℂ` and `ρ_ℓ` for the coefficient extensions. For a finite place
`v ∤ ℓ`, let `I_v` be the inertia image, `q_v` the residue cardinality and `Φ_v` an arithmetic
Frobenius lift. Put `P_v(T) = det_C(1 − Tρ(Φ_v) | V^{I_v})`. Prove that inertia invariants commute
with both coefficient extensions and that the complex Artin factor of AdelicAlgebraicGroups
AA.2.4 is `L_v(ρ_ℂ,s) = (ι∞(P_v)(q_v^{−s}))⁻¹`, as a meromorphic function of `s`.
Here each embedding acts coefficientwise on `P_v`; no identification of the complex and ℓ-adic
coefficient spaces is required.

For the geometric lift `Φ_v⁻¹`, prove
*GaloisRep.localEulerFactor*`(ρ_ℓ^∨, Φ_v⁻¹) = ιℓ(P_v)` and
*WeilDeligneRep.localFactor*`(WD(ρ_ℓ^∨), Φ_v⁻¹) = ιℓ(P_v)`, with the local restriction at `v`
understood. Finite image gives `N = 0`. The finite inertia order is invertible in these
characteristic-zero coefficient fields, so averaging identifies the invariants of the dual
with the dual of the invariants; geometric Frobenius on the dual then acts as the transpose of
arithmetic Frobenius on the original invariant space. Prove the determinant comparison through
these identifications. This is the finite-image specialization of Marzec–Neururer, Definition
5.11, p. 62, and Deligne 1973, 3.5.1, p. 528, and 8.12, p. 572.
*Needs:* §§1.1–1.2 (continuous representations, coefficient extension and duals), §2.5 (local
polynomials and exact inertia invariants); AdelicAlgebraicGroups AA.2.4, *convergence-factors*.

**Checks.**
- Zero inertia invariants give `P_v = 1` and Artin factor one; the rank-one trivial
  representation gives `P_v = 1 − T` and `(1 − q_v^{−s})⁻¹`.
- The Dirichlet character of `ℚ(i)/ℚ` at `2` has no inertia invariants, so both local
  polynomials are `1` for `ℓ ≠ 2`. For `Ind_{ℚ(i)}^ℚ 1` the invariant line instead gives `1 − T`.
- For an unramified character with arithmetic eigenvalue a nontrivial cube root `ζ`,
  `P_v = 1 − ζT`; geometric Frobenius on the same representation gives `1 − ζ⁻¹T`.
  Taking the dual with the geometric lift restores `1 − ζT`.
- For the two-dimensional dihedral Artin representation with image `S₃`, an unramified
  Frobenius of order three gives `P_v = 1 + T + T²`, while a transposition gives `1 − T²`.
  The complex Artin factors are the reciprocals after `T = q_v^{−s}`, and the dual ℓ-adic
  local polynomials agree with `P_v` under `ιℓ`.

### 2.6 Monodromy filtration and purity

**Jordan strings and tensor monodromy.** For nilpotent `N` on a finite-dimensional space over
characteristic-zero `k`, construct a basis of Jordan strings by lifting bases through the
kernel/image filtration, giving strings `e_0, …, e_d` with `Ne_i = e_{i+1}`. Construct
`He_i = (d − 2i)e_i` and `Ee_i = i(d − i + 1)e_{i−1}` (endpoint terms zero), and prove
`[H,E] = 2E`, `[H,N] = −2N`, `[E,N] = H`. Identify each string with the standard
`sl₂` module `V(d)`. Apply the characteristic-zero Clebsch–Gordan decomposition to two strings:
tensor monodromy `N ⊗ 1 + 1 ⊗ N'` has lengths `d + d' − 2j + 1` for
`0 ≤ j ≤ min(d,d')`. Construct the isomorphisms over `k` and match the `H`-weight filtration
with the kernel/image filtration below, before deducing its tensor compatibility
(Deligne 1980, §1.6; Fulton–Harris, §11.1, the `sl₂` weight strings and Clebsch–Gordan formula).
*Needs:* Mathlib kernels, images, complements, finite bases and `IsSl2Triple`;
RepresentationTheory/LieHighestWeight Layer 0, *The standard irreducible V(n)* and *Clebsch-Gordan*.

**Checks.**
- A length-one string has `N = E = H = 0`, concentrated in degree zero.
- Two length-two strings tensor to lengths three and one; their monodromy has rank two.
- In characteristic two, two length-two strings tensor to an operator with square zero;
  the characteristic-zero length-three conclusion fails.

**The monodromy filtration.** Define *WeilDeligneRep.monodromyFiltration* `N a` for a nilpotent
endomorphism `N` of a finite-dimensional vector space over a field:
`M_a = Σ_{i − j = a} (ker N^{i+1} ∩ im N^j)`, `i, j ≥ 0`. Prove that it is increasing, that
`N M_a ⊆ M_{a−2}`, that `N^{d+1} = 0` gives `M_{−d−1} = 0` and `M_d = V`, that `N = 0` gives
`M_{−1} = 0` and `M_0 = V`, and that conjugation transports it. Prove that it is the unique finite
increasing filtration with `N M_a ⊆ M_{a−2}` and `N^a : gr_a ≅ gr_{−a}` for all `a ≥ 0`; that
`M(cN) = M(N)` for `c ≠ 0`; that `r(w) N r(w)⁻¹ = c(w) N` with `c(w) ≠ 0` gives `r(w) M_a = M_a`; the
primitive decomposition `gr_a = ⊕_{i ≥ 0} N^i P_{a+2i}` for every integer `a`, with
`P_b = ker(N^{b+1} : gr_b → gr_{−b−2})` for `b ≥ 0` and `P_b = 0` for `b < 0`;
the dual filtration `M_a(V^∨) = M_{−a−1}(V)^⊥`; and, in characteristic zero, the tensor compatibility
`M_c(V ⊗ V') = Σ_{a+b=c} M_a(V) ⊗ M_b(V')` (FSY, §5.3.2, p. 57; Deligne 1980, §1.6). The kernel and
image description and the elementary API are linear algebra; uniqueness and the primitive
decomposition use Jordan strings of `N`; the explicit `sl₂` construction and tensor-string
decomposition above give tensor compatibility. *Needs:* Mathlib kernels, images and quotients
of submodules; the Jordan strings and tensor monodromy target above.

**Checks.**
- On `Sp(n)` the graded pieces `gr_a` are one-dimensional for `a = −n + 1, −n + 3, …, n − 1`.
- `N = 0` has `M_{−1} = 0` and `M_0 = V`.
- On `Sp(2)`, `M_{−2} = 0` and `M_{−1} = M_0 = ker N`: the filtration is centred, not the kernel
  filtration indexed from `0`.

**Weights and purity.** Define *WeilDeligneRep.IsWeilNumber* `q m α` as the canonical shared
natural-base scalar predicate (`α` algebraic over `ℚ` with every
complex conjugate of absolute value `q^{m/2}`; `q ≥ 2` for the weight to be determined),
*WeilDeligneRep.IsPureEnd* `q w φ N` (the eigenvalues of `φ` on `gr^M_a` are `q`-Weil numbers of weight
`w + a`), *WeilDeligneRep.IsPure* `r N q w F` on the supplied fields at a geometric lift,
mixed representations (a filtration by sub-objects with pure graded pieces), and *GaloisRep.IsPureAt* for a global representation at `v`
(intended signature `Prop`, purity of `WD(ρ|_{G_{F_v}})` after an isomorphism `ℚ̄_ℓ ≅ ℂ`). Its API is
invariance under Frobenius semisimplification, weights `w + w'` for tensor products, `−w` for duals,
`w − 2` for the twist by `ω`, and restriction (FSY, §5.3.2, p. 57).

**Checks.**
- `Sp(2)` is pure of weight `−1`; `ω` has weight `−2`; the trivial character weight `0`.
- `(1 ⊕ ω, 0)` is pure of no weight when `q ≥ 2`.
- For `q = 1`, `(1, 0)` is pure of every weight, so the weight is not determined.

**Purity from a pure graded.** Prove that for `Ω` of characteristic zero, `q ≥ 2`, `N` nilpotent,
`φ ∈ GL(V)` with `N φ = q φ N`, and a filtration by `φ`- and `N`-stable subspaces whose graded pair
`(V̄, φ̄, N̄)` is pure of weight `w`, one has `rank N^k = rank N̄^k` for all `k`, `(V, φ, N)` is pure of
weight `w`, and `ker N` induces `ker N̄`. Prove that for `K/ℚ_p` finite and `r : G_K → GL(V)`
continuous with a `G_K`-stable filtration `0 = V_0 ⊂ ⋯ ⊂ V_c = V` such that `WD(r̄)` of the graded is
pure of weight `w`, `WD(r)` is pure of weight `w` and `L(r, X) = L(r̄, X)` (FSY, Lemma 5.40 and its
proof, p. 58).

**Indecomposable Weil–Deligne representations.** Prove that for `Ω` algebraically closed of
characteristic zero and `q ≥ 2`, every Frobenius-semisimple Weil–Deligne representation is a direct
sum of indecomposables, each isomorphic to `r₀ ⊗ Sp(n)` for an irreducible representation `r₀` of
`W_K` with open kernel and `n ≥ 1`, with `(r₀, n)` unique up to isomorphism and the decomposition
unique up to permutation (Tate 1979, (4.1.5)). The Frobenius-semisimple hypothesis is needed:
`r(F) = (1 1; 0 1)`, `N = 0` is indecomposable and not of that form. The proof uses the `sl₂`-type
decomposition of `V` under `N` (the primitive decomposition above) and Krull–Schmidt for modules over
the algebra generated by `r` and `N`. *Needs:* Tau Ceti
`exists_linearEquiv_directSum_isIndecomposableModule`; the monodromy filtration above; SmoothRepresentationsOfLocalGroups SR.5.2
`wd-frobenius-semisimplification`.

### 2.7 Local constants

Throughout, `K/ℚ_p` is finite, `ψ : K → ℂ^×` a nontrivial additive character of conductor exponent
`n(ψ)`, `dx` a Haar measure on `K`, and the reciprocity map sends uniformisers to geometric lifts:
`Art_K(x) = artinMap(x)⁻¹`, with `artinMap` from `TauCetiRoadmap.ClassFieldTheory` layer 7.

<a id="local-constant-gauss-sum"></a>

**Arithmetic character constants.** For a continuous quasi-character `χ : K^× → ℂ^×`,
define *tateLocalConstant* `χ ψ dx` by finite Gauss sums. Write `a = a(χ)`, `ν = n(ψ)`
and choose `c ∈ K^×` of valuation `a+ν`. For `a ≥ 1`, put
`ε(χ,ψ,dx) = ∫_{c⁻¹O_K^×} χ⁻¹(x) ψ(x) dx`.
This notation denotes the finite sum obtained by substituting `x = c⁻¹y` and summing over
`y ∈ (O_K/ϖ^a)^×`, each additive coset having measure `vol_dx(O_K) q^(−a)`:
`ε(χ,ψ,dx) = χ(c) q^ν vol_dx(O_K) Σ_y χ⁻¹(y) ψ(y/c)`.
For `a = 0`, define `ε(χ,ψ,dx) = χ(c) q^ν vol_dx(O_K)`, with `v(c) = ν`.
Prove independence of representatives and of `c`, and nonvanishing. Intended signature:
*tateLocalConstant* `(χ : Kˣ →* ℂˣ) (ψ : AddChar K ℂ) (dx : Measure K) : ℂˣ`,
for continuous `χ`, nontrivial continuous `ψ` and nonzero Haar `dx`.

For the self-dual measure `dx_ψ`, `vol(O_K) = q^(−ν/2)`, these definitions give
`ε(ω |·|^s,ψ,dx_ψ) = ω(ϖ^ν) q^((1/2−s)ν)` when `ω` is unramified, and, for `a ≥ 1`,
`ε(ω |·|^s,ψ,dx_ψ) = ω(c) q^((1/2−s)(a+ν)) 𝔤(ω,ψ)` with
`𝔤(ω,ψ) = q^(−a/2) Σ_y ω⁻¹(y) ψ(y/c)`.
At a real place define the constant of `sgn^b |·|^t` to be `i^b`, `b ∈ {0,1}`;
at a complex place that of `(z/|z|)^k |·|_ℂ^t` to be `i^|k|`. Here the trace character
has positive archimedean sign and the self-dual measures are `dx` and `2 dx dy`.

Prove by finite-sum identities the unramified-twist formula
`ε(χ |·|^t,ψ,dx) = q^(−t(a(χ)+ν)) ε(χ,ψ,dx)`, measure scaling
`ε(χ,ψ,r dx) = r ε(χ,ψ,dx)` for `r > 0`, and additive-character scaling
`ε(χ,ψ_b,dx) = χ(b)|b|⁻¹ ε(χ,ψ,dx)` for `ψ_b(x) = ψ(bx)`, `b ≠ 0`.
For unitary `ω` prove `|ε(ω,ψ,dx_ψ)| = q^((a(ω)+ν)/2)`, hence
`|ε(ω |·|^(1/2),ψ,dx_ψ)| = 1`. For Fourier-dual measures prove
`ε(χ,ψ,dx) ε(χ⁻¹|·|,ψ(−x),dx') = 1`, equivalently
`ε(χ,ψ,dx) ε(χ⁻¹|·|,ψ,dx') = χ(−1)`.
The archimedean scaling and dual identities use the same conventions.
(Source: Tate, *Number theoretic background*, (3.2.2)–(3.2.6.3), pp. 13–14,
and (3.4.3)–(3.4.7), p. 15; Deligne 1973, 3.4, p. 528, and 5.4–5.7, pp. 548–550.)
*Needs:* ClassFieldTheory Layer 7's character conductor; local residue rings and Haar measure;
Mathlib's Gauss-sum API and Tau Ceti's
`DirichletCharacter.gaussSum_mul_gaussSum_inv_eq_card_of_isPrimitive` for Dirichlet checks.
The downstream `rank-one-local-functional-equation` of AutomorphicLFunctionsAndLocalFactors
AL.1 identifies its analytic constant with this finite-sum constant.

**Checks.**
- Unramified `ω` and `ν = 0` give `ε(ω |·|^s) = 1`; for `ν = 1` the value is
  `ω(ϖ) q^(1/2−s)`, retaining both the different and the uniformiser value.
- Over `ℚ₃`, for the quadratic residue character with `ω(3) = 1` and
  `ψ(x) = exp(−2πi{x}_3)`, the sum is `−i√3`, so
  `ε(ω |·|^s) = −i · 3^(1/2−s)` and its central value has norm one.
- Scaling `dx` by two doubles `ε`; replacing `ψ` by `ψ(−x)` multiplies it by `χ(−1)`.
  Omitting the character factor breaks the dual identity for an odd character.
- Real `sgn` and complex angular frequencies `k = ±1` all give `i`; frequency zero gives one.

**Global inputs.** For a number field `F` and a continuous complex idele-class quasi-character
`χ`, construct the scalar character foundations before the zeta-integral comparison.
Define the standard trace character `ψ = ψ_ℚ ∘ Tr_{F/ℚ}` on `𝔸_F`, with real component
`ψ_ℚ,∞(x) = exp(2πix)` and finite components `ψ_ℚ,p(x) = exp(−2πi{x}_p)`, where `{x}_p`
is the `p`-adic fractional part. Prove continuity, nontriviality and triviality on diagonal `F`:
for rational `x`, `x − Σ_p{x}_p ∈ ℤ`, and the adelic trace of a diagonal field element is its
rational field trace. The local components are obtained by the corresponding local traces.
For every place `v`, prove that `a ↦ (x ↦ ψ_v(ax))` identifies the additive group of `F_v`
topologically with Mathlib's `PontryaginDual (Multiplicative F_v)`. At a finite place over `p`,
the annihilator of `O_v` is the inverse different `𝔡_{F_v/ℚ_p}⁻¹`. Prove the restricted-product
duality comparison: continuous adelic characters are products of local characters trivial on
`O_v` at almost all finite places, and the local identifications give a topological
identification of `𝔸_F` with `PontryaginDual (Multiplicative 𝔸_F)` through `ψ(ax)`.
The inverse different equals `O_v` at almost all finite places, so these local identifications
respect the restricted products.

Prove the diagonal self-annihilator formula
`F⊥ = {a ∈ 𝔸_F : ∀ ξ ∈ F, ψ(aξ) = 1} = F`. Diagonal triviality gives one inclusion.
For the reverse, identify `F⊥` with the dual of the compact quotient `𝔸_F/F`, using
GlobalNumberFields Layers 4–6's discrete diagonal and compact quotient. Thus `F⊥` is discrete;
`F⊥/F` is closed and discrete in the compact quotient and hence finite. It is also an
`F`-vector space, so it vanishes. These scalar foundations use local fields, traces, adeles
and harmonic analysis, without automorphic hypotheses. AutomorphicFormsOnReductiveGroups §4.3
consumes them for its compact-quotient character adapter and Fourier expansion.
(Definitions and conventions: Kudla, *Tate's Thesis*, §3, pp. 122–124, and §4, pp. 127–128,
for the standard additive characters, self-dual measures and Fourier transforms, with positive
archimedean sign.)

Construct the Schwartz–Bruhat space on the adeles, its restricted-product and tensor-product
API, the self-dual Fourier transform and Poisson summation for a nontrivial additive character
of `𝔸_F/F`. Use the positive Fourier kernel `ψ(xy)`. For the standard trace character the
self-dual additive measures are `dx` at real places, `2 dx dy` at complex places and
`vol(O_v) = q_v^(−ν_v/2)` at finite places, where `ν_v` is the different exponent.
Fix Tate's multiplicative measures: `d^×x = (1−q_v⁻¹)⁻¹ dx_ψ/|x|_v` at finite places and
`d^×x = dx_ψ/|x|_v` at infinity. Thus `vol^×(O_v^×) = q_v^(−ν_v/2)`.
Use `dt/t` for the norm variable in the disintegration of the idele-class measure.
For residue comparisons, write `κ := NumberField.dedekindZeta_residue F`.

<a id="standard-test-function-evaluations"></a>

**Standard-test-function evaluations.** For the following prescribed local functions and their
positive-kernel Fourier transforms, evaluate
`z_v(g,ω,s) = ∫_{F_v^×} g(x) ω(x) |x|_v^s d^×x` in its convergence half-plane and
continue the resulting expressions meromorphically. Use
`Γ_ℝ(u) = π^(−u/2) Γ(u/2)` and `Γ_ℂ(u) = 2(2π)^(−u) Γ(u)`, Mathlib's
`Complex.Gammaℝ` and `Complex.Gammaℂ`.

For *finiteStandardEvaluation*, let `F_v/ℚ_p` be finite, `ω : F_v^× → ℂ^×` a continuous
quasi-character, `ψ_v` a nontrivial continuous additive character, `ν = n(ψ_v)`, `c = a(ω)` and
`d^×x = (1−q⁻¹)⁻¹ dx_ψ/|x|_v`.
If `c = 0`, put `f_ω = q^(ν/2) 1_{O_v}`; if `c ≥ 1`, put
`f_ω(x) = q^(ν/2) ω(x)⁻¹` on `O_v^×` and zero elsewhere.
Then `z_v(f_ω,ω,s) = L_v(s,ω)`, where the factor is
`(1−ω(ϖ)q^(−s))⁻¹` for `c = 0` and `1` for `c ≥ 1`, and
`z_v(f̂_ω,ω⁻¹,1−s) = ε_v(s,ω) L_v(1−s,ω⁻¹)`, with
`ε_v(s,ω) =` *tateLocalConstant*`(ω |·|_v^s, ψ_v, dx_ψ)` given by [Arithmetic character constants](#local-constant-gauss-sum).
For `c = 0`, `f̂_ω = 1_{ϖ^(−ν)O_v}`; for `c ≥ 1`, its support is exactly
`ϖ^(−ν−c)O_v^×`. The factor `q^(ν/2)` normalizes Tate's multiplicative unit volume;
with unit-volume-one multiplicative measure the unscaled functions have integral `L_v`.

For *archimedeanStandardEvaluation_real*, let
`ω(x) = sgn(x)^a |x|^t`, `a ∈ {0,1}`, `t ∈ ℂ`,
`ψ(x) = exp(2πix)` and `f_a(x) = x^a exp(−πx²)`.
With `d^×x = dx/|x|`, prove `f̂_a = i^a f_a`,
`z_v(f_a,ω,s) = Γ_ℝ(s+t+a)` and
`z_v(f̂_a,ω⁻¹,1−s) = i^a Γ_ℝ(1−s−t+a)`.

For *archimedeanStandardEvaluation_complex*, let
`ω(z) = (z/|z|)^k |z|_ℂ^t`, `k ∈ ℤ`, `t ∈ ℂ`, where the angular denominator is
the ordinary absolute value and `|z|_ℂ = z z̄`.
Take `a,b ∈ ℕ` with `min(a,b) = 0` and `a−b = −k`, and put
`f_{a,b}(z) = π⁻¹ z^a z̄^b exp(−2πz z̄)`.
For `ψ(z) = exp(2πi(z+z̄))`, self-dual additive measure `2 dx dy` and
`d^×z = 2 dx dy/|z|_ℂ`, prove `f̂_{a,b} = i^(a+b) f_{b,a}`,
`z_v(f_{a,b},ω,s) = Γ_ℂ(s+t+|k|/2)` and
`z_v(f̂_{a,b},ω⁻¹,1−s) = i^|k| Γ_ℂ(1−s−t+|k|/2)`.
These are evaluations of the specified functions by geometric series, Gauss sums and Gaussian
Mellin integrals. (Source: Deligne 1973, 3.2–3.4, pp. 526–528, and 5.5–5.7, pp. 548–550,
for factors and constants; Mathlib `fourier_gaussian_pi` and `Complex.Gamma_eq_integral`
for the Gaussian Fourier and Mellin calculations.)
*Needs:* the local Fourier and measure foundations above; [Arithmetic character constants](#local-constant-gauss-sum);
ClassFieldTheory layer 7; Mathlib Haar integration, Fourier transform and gamma integrals.

**Checks.**
- For an unramified `ω` and `ν = 0`, `f_ω = f̂_ω = 1_{O_v}` and `ε_v = 1`.
- For an unramified `ω` and `ν = 1`, the unscaled `1_{O_v}` has zeta integral
  `q^(−1/2)L_v(s,ω)`; the normalized function gives `L_v`, and
  `ε_v(s,ω) = ω(ϖ)q^(1/2−s)` retains the different.
- Over `ℚ₃`, take `ω(3) = 1`, `ω|_{ℤ₃^×}` the nontrivial quadratic residue character,
  and `ψ(x) = exp(−2πi{x}_3)`. Then `c = 1`, `ν = 0`, `z_v(f_ω,ω,s) = 1` and
  `f̂_ω` is supported on `3⁻¹ℤ₃^×`, with `ε_v(1/2,ω) = −i`.
  The negative-valuation ball is not the support of `f_ω`.
- At a real place, `a = 0` gives the fixed Gaussian and `Γ_ℝ(s+t)`; `a = 1` gives
  `Γ_ℝ(s+t+1)` and Fourier eigenvalue `i`.
- At a complex place, `k = 1` requires `f_{0,1}` and `k = −1` requires `f_{1,0}`;
  using `f_{1,0}` for `k = 1` instead gives zero by angular integration.
- At a complex place, `k = t = 0` and `s = 1` give `Γ_ℂ(1) = 1/π`.
  The unscaled Gaussian has integral `1`, so its factor is `π Γ_ℂ(s)`.

<a id="hecke-zeta-integral-comparison"></a>

**Hecke zeta-integral comparison.** For a number field `F`, let `χ = χ₀ |·|_𝔸^t`, where
`χ₀` is algebraic of type A₀ and `t ∈ ℂ`. Use LFunctions Layers 0, 5–6's primitive
presentation of `χ₀`. At a prime idele write `χ₀(π_v) = χ₀,u(π_v) q_v^σ`, with `σ` the
supplier's real ideal-side shift; its idelic norm exponent is `−σ`.
Put `u = s+t−σ` and `A = |disc F| N(𝔣₀)`, with `𝔣₀` the primitive finite conductor.
Let `f^std_χ` be the restricted tensor product of the prescribed local standard functions above.
For `Re(u) > 1`, prove absolute convergence and the comparison
`Z(f^std_χ,χ,s) := ∫_{𝔸_F^×} f^std_χ(x) χ(x) |x|_𝔸^s d^×x = A^(−u/2) Λ_unit(χ₀,u)`
(*heckeZetaIntegral_eq_completedHecke*). Thus the conductor-normalised expression
`A^(u/2) Z(f^std_χ,χ,s)` equals the supplied completion `Λ(χ,s) = Λ_unit(χ₀,s+t−σ)`.
The standard integral itself is the primitive finite Hecke function times its gamma factors.
Use real gamma shift the parity of `χ₀,u` and complex shift `|n_τ−n_τ̄|/2`, including the
signs outside the real identity components. For an imprimitive presentation, its finite series
is the primitive one times
`∏_{v ∣ 𝔪₀, v ∤ 𝔣₀} (1−χ₀,u(π_v) q_v^(−u))`.
Continuation, inverse-character reflection at `1−s` and the translated polar divisors of this
standard integral follow from LFunctions' continuation and functional equation by multiplication
by `A^(−u/2)` and precomposition by `s ↦ s+t−σ`.
(Source: LFunctions Layers 0, 5–6; Neukirch, *Algebraic Number Theory*, VII (8.1), (8.3),
(8.5)–(8.6), pp. 493–503; the local evaluations above.)
*Needs:* [Standard-test-function evaluations](#standard-test-function-evaluations);
GlobalNumberFields Layers 4–6 and 9–10; LFunctions Layers 0, 5–6; Mathlib Haar integration.

**Checks.**
- Over `ℚ`, the trivial character gives `f^std = 1_Ẑ ⊗ exp(−πx∞²)` and
  `Z = Γ_ℝ(s) ζ(s)`, with simple poles at `0,1` and residues `−1,+1`;
  `Res_{s=1} ζ(s) = κ = 1`.
- The odd character modulo `4` gives `Z = Γ_ℝ(s+1) L(s,χ₄) = 4^(−s/2) Λ_unit(χ₄,s)`.
  Its real parity is one, its primitive conductor is four and its completion is entire.
- Over `ℚ(i)`, for the unramified angular character
  `χ_m((α)) = (α/ᾱ)^(2m)`, `m ∈ ℤ`, `m ≠ 0`, the idelic infinity frequency is `−4m`.
  Here `A = 4`, `σ = 0` and `Z = Γ_ℂ(s+2|m|) L(s,χ_m) = 4^(−s/2) Λ_unit(χ_m,s)`;
  the gamma shift is nonzero and the completion is entire.

<a id="finite-order-hecke-functional-equation"></a>

**Finite-order Hecke functional equation.** Restate LFunctions Layer 5's primitive interface
as *finiteOrderHeckeFunctionalEquation*. For a finite-order idele-class character `χ` of a
number field `F`, use its unique primitive ray-class presentation, finite conductor `𝔣`, and
`A = |disc F| N(𝔣)`. Its completion is
`Λ(χ,s) = A^(s/2) Γ_ℝ(s)^(r₁−b) Γ_ℝ(s+1)^b Γ_ℂ(s)^r₂ L_f(χ,s)`,
where `b` counts its odd real components. Consume meromorphic continuation and the equation
`Λ(χ,s) = W(χ) Λ(χ⁻¹,1−s)`, `|W(χ)| = 1`, as meromorphic germs and pointwise away from poles.
It is entire for `χ ≠ 1`; the trivial character has simple poles at `0,1`.
At a larger presentation modulus, the uncompleted series differs from the primitive series by
`∏_{v ∣ 𝔪₀, v ∤ 𝔣} (1−χ(π_v) q_v^(−s))`; the conductor and root number remain primitive.
(Source: LFunctions Layer 5, **Primitive versus presented** and its displayed functional equation;
Neukirch VII (8.5)–(8.6), pp. 502–503.)
*Needs:* LFunctions Layers 0 and 5; GlobalNumberFields' ray-class and finite-order Hecke characters.

**Checks.**
- The trivial character has root number one and the supplied Dedekind completion, including its
  two poles; a pointwise equation at totalized polar values is not asserted.
- Over `ℚ`, the odd character modulo `4` has conductor four, gamma factor `Γ_ℝ(s+1)` and
  root number one.
- The principal character presented modulo a prime `p` has primitive conductor one; its series
  is `(1−p^(−s)) ζ(s)`, and no conductor-`p` completion is assigned to that presentation.

<a id="root-number-product-formula"></a>

**Root-number product formula.** Define Hecke's root number for every unitary idele-class
character `ω` by a finite Gauss sum, independently of any continued L-function. Put
`𝔣 = ∏_{v finite} 𝔭_v^a_v`, `a_v = a(ω_v)`, `ν_v = n(ψ_v)` and
`A = |disc F| N(𝔣)`. Choose a finite idele `c` with `v(c_v) = a_v+ν_v`.
On `(𝓞_F/𝔣)^×` put
`τ⁻(ω,c) = Σ_y (∏_{v ∣ 𝔣} ω_v(y_v)⁻¹) (∏_{v ∣ 𝔣} ψ_v(y_v/c_v))`,
using local lifts of each residue class. Set
`W_H(ω) = i^(Σ_{v real} b_v + Σ_{v complex} |k_v|) (∏_{v finite} ω_v(c_v)) τ⁻(ω,c) / √N(𝔣)`,
where the infinity components of `ω` are `sgn^b_v |·|^(i r_v)` and
`(z/|z|)^k_v |·|_ℂ^(i r_v)`, with `b_v ∈ {0,1}`, `k_v ∈ ℤ` and `r_v ∈ ℝ`.
At conductor one the residue group has one element and
`τ⁻ = 1`. Prove that the sum is well-defined, independent of `c` after its displayed
character factor, and has norm `√N(𝔣)`, so `|W_H(ω)| = 1`.
This is Hecke's Gauss-sum expression in finite-idele coordinates: compare it with the ideal-number
expression of Neukirch VII (7.4)–(7.6), including its archimedean phase and conductor normalization.

For every continuous idele-class quasi-character `χ = ω |·|_𝔸^t`, `t ∈ ℂ`, prove
`∏_v ε_v(s,χ_v,ψ_v) = W_H(ω) A^(1/2−s−t)`
(*rootNumber_eq_prod_tateLocalConstant*). Here
`ε_v(s,χ_v,ψ_v) =` *tateLocalConstant*`(χ_v |·|_v^s,ψ_v,dx_ψ)`;
use the standard trace character and self-dual measures above. All but finitely many factors are
one. Factor the single residue-class sum by the Chinese remainder theorem and compare each term
with the local Gauss sum, including the different and the uniformiser values. Scaling the trace
character by `b ∈ F^×` leaves the product unchanged by the product formula and `χ(b) = 1`.

For finite-order `ω`, identify `W_H(ω)` with the root number supplied by
`finite-order-hecke-functional-equation`. For algebraic `χ₀` with ideal-side shift `σ`, put
`ω₀ = χ₀ |·|_𝔸^σ` and identify `W_H(ω₀) = W(χ₀)` from LFunctions Layer 6. Thus for
`χ = χ₀ |·|_𝔸^t` the product is `W(χ₀) A^(1/2−s−t+σ)`.
For checks on completions, write `Λ_H(ω,u) = A^(u/2) L_∞(ω,u) L_f(ω,u)` initially in
`Re u > 1`, with factors `Γ_ℝ(u+i r_v+b_v)` and `Γ_ℂ(u+i r_v+|k_v|/2)`.
The downstream AutomorphicLFunctionsAndLocalFactors AL.1 target `hecke-l-functional-equation`
identifies `W_H(ω)` with the scalar functional-equation constant for every continuous unitary `ω`,
using AL.2's `global-godement-jacquet` at `n = 1`. AutomorphicSpectralTheory §1.15c's
`unitary-hecke-functional-equation` constructs the same conductor-balanced completion from
Eisenstein theory: equality on `Re(u) > 1` identifies their meromorphic germs and root numbers.
(Source: Neukirch VII (7.4)–(7.7), pp. 488–490, and (8.5)–(8.6), pp. 502–503;
Tate, *Number theoretic background*, (3.2.6), pp. 13–14; Deligne 1973, 3.11–3.12 and 5.5.)
*Needs:* [Arithmetic character constants](#local-constant-gauss-sum);
[Finite-order Hecke functional equation](#finite-order-hecke-functional-equation) and
LFunctions Layer 6 for the finite-order and algebraic identifications only;
GlobalNumberFields Layers 4–6 and 9–10's unitary decomposition; the standard trace character above.

**Checks.**
- For the trivial character, `W = 1` and
  `∏_{v finite} q_v^(ν_v(1/2−s)) = |disc F|^(1/2−s)`; both archimedean constants are one.
- For the odd quadratic character modulo `4` over `ℚ`, `χ₂(2) = 1` and
  `ε₂(s) = −i · 4^(1/2−s)`, since its negative-sign Gauss sum is `−2i`.
  The real constant is `i`, so `ε₂(s) ε_∞(s) = 4^(1/2−s)` and `W(χ₄) = 1`.
- The primitive quadratic character of conductor `3` over `ℚ` has local component at `3`
  with `ω(3) = 1` and nontrivial quadratic restriction to `ℤ₃^×`.
  Its constant is `−i · 3^(1/2−s)` as in the local check, while the real constant is `i`;
  their product is `3^(1/2−s)`, with root number one.
- For `ω = |·|_𝔸^(i r)`, `r ∈ ℝ`, put `D = |disc F|`. The finite-idele factor gives
  `W_H(ω) = D^(−i r)` and `Λ_H(ω,u) = D^(−i r/2) Λ_F(u+i r)` on the convergence
  half-plane and through the supplied Dedekind continuation.
- Over `F = ℚ(√2)`, put `ε = 1+√2` and `r = π/log ε`. The unramified character with
  infinity component `|x₁/x₂|^(i r)` is well-defined on units since `ε^(2i r) = 1`;
  its value on `(α)` is `|α₁/α₂|^(−i r)`. It is neither a pure norm character nor an
  algebraic character times a complex norm power. Nevertheless `𝔣 = 1`, `τ⁻ = 1` and
  `W_H(ω) = ∏_{v finite} ω_v(c_v)` are finite arithmetic data; its real gamma shifts are
  `i r,−i r`.
- For `F` imaginary quadratic, every unitary `ω` has
  `ω_∞(z) = (z/|z|)^m |z|_ℂ^(i t)`, `m ∈ ℤ`, `t ∈ ℝ`.
  Then `η = ω |·|_𝔸^(m/2−i t)` is algebraic of
  weight `m`, `η^u = η |·|_𝔸^(−m/2)` and `ω = η^u |·|_𝔸^(i t)`.
  The conductor is unchanged and
  `Λ_H(ω,u) = A^(−i t/2) Λ(η^u,u+i t)`, `W_H(ω) = A^(−i t) W(η^u)`, where the
  completion and root number of `η^u` come from LFunctions Layer 6's presentation of `η`.
  Thus the unitary functional equation over the Caraiani–Newton base field is a norm shift
  of that supplied algebraic equation.

**Globalisation and Deligne's transfer.** For a finite Galois extension `K'/K` of
`p`-adic fields, prove that there is a finite Galois extension `F'/F` of totally complex number
fields with `F_v = K`, a unique place over `v` in `F'`, and `K'/K` a subextension of
`F'_v/F_v`. For this global extension, prove the following finite-order character-globalisation
corollary of Grunwald–Wang: for finitely many finite places `S` disjoint from `{v}` and
integers `m_w ≥ 0`, there is a finite-order idele-class character `α` with `α_v = 1` and
`a(α_w) ≥ m_w` for `w ∈ S`. Prove the corollary here from the finite-order character-extension
argument of Grunwald–Wang: prescribe the trivial character at `v` and sufficiently ramified
finite-order characters at `S`. Auxiliary ramification outside `S ∪ {v}` is allowed; the order
is unrestricted, including the doubled exponent in Wang's exceptional case. Take `S` to contain
every ramified place of `F'/F` other than `v`; any auxiliary ramification then lies where
`F'/F` is unramified. At infinity finite-order characters over the totally complex base are trivial.

Use [Finite-order Hecke functional equation](#finite-order-hecke-functional-equation) and
[Root-number product formula](#root-number-product-formula), with Brauer induction on the finite
Galois groups, to obtain the meromorphic Artin functional equations for finite-image
representations and their finite-order twists. All inducing characters have finite order;
Brauer products may have negative exponents and no Artin holomorphy is asserted.
Consume AdelicAlgebraicGroups AA.2.4's factors, ramified induction and meromorphic assembly on the
complex dual, so §2.5a matches its arithmetic lift with our geometric lift. Identify the untwisted
assembly and its equation. At every place other than `v`, use the unramified-extension or
sufficiently ramified-twist calculations to obtain the local-constant theory; the global product
then supplies it at `v`, where `α_v = 1`. Prove induction in degree zero and independence of the
global choices. Extend from finite-image Galois representations to Weil representations with
open kernel on inertia by decomposition into unramified twists and the unramified-twist identity.
(Source: Tate, *Local constants*, §2 Theorem 1, pp. 105–109, and pp. 117–118;
Tate, *Number theoretic background*, (3.4.1)–(3.5.4), pp. 14–16;
Deligne 1973, 3.12 (B)–(C), p. 533, 4.12–4.13 and 4.15–4.16, pp. 544–547;
Artin–Tate, *Class Field Theory*, Ch. X, Theorem 5, and Milne, *Class Field Theory*,
VIII, Theorem 2.4, p. 232, for finite-order character extension.)
*Needs:* [Finite-order Hecke functional equation](#finite-order-hecke-functional-equation);
[Root-number product formula](#root-number-product-formula);
[Arithmetic character constants](#local-constant-gauss-sum); §2.5a;
AdelicAlgebraicGroups AA.2.4, *convergence-factors*;
ClassFieldTheory Layers 7, 9 and 11–12's local and global reciprocity;
RepresentationTheory/InductionRestriction Layer 6 (Brauer induction).

**Checks.**
- At diagonal `1/3 ∈ ℚ`, the real and `3`-adic factors are `exp(2πi/3)` and
  `exp(−2πi/3)`, so their product is one. A positive finite-place sign instead gives
  `exp(4πi/3) ≠ 1` and fails diagonal triviality.
- Over `ℚ`, the adele with real component `1/2` and all finite components zero pairs with
  diagonal `1` to give `−1`, so it is outside `ℚ⊥`; every diagonal rational is inside.
- Over `ℚ_p`, `ℤ_p⊥ = ℤ_p`; for a ramified completion, `O_v⊥ = 𝔡_{F_v/ℚ_p}⁻¹`
  is strictly larger than `O_v`, retaining the different in the restricted-product comparison.
- For `b ∈ 𝔸_F^×`, the pairing `ψ(bxy)` has diagonal annihilator `b⁻¹F`.
  The equality with `F` uses the specified trace pairing.
- For the trivial character of `ℚ`, the completion has simple poles at `0` and `1`; an entire
  continuation statement would fail.
- For a nontrivial primitive Dirichlet character, the completed function is entire and the
  equation uses its inverse character and primitive conductor.
- Twisting by `|·|_𝔸^t` shifts `s` to `s + t` and reflects against the inverse twist, rather than
  retaining the untwisted polar locations.
- For `χ = |·|_𝔸^t` over `ℚ`, the supplied completion is the zeta completion at `s+t`,
  with poles at `−t` and `1−t`; real gamma parity is zero. For the odd character modulo `4`,
  real parity is one even though its algebraic type is zero on the identity component.
- In the local-extension globalization the completion of `F'` may strictly contain `K'`;
  the contract supplies a subextension, rather than equality with the chosen local extension.
- With `S` empty the trivial finite-order character suffices. For nonempty `S`, the conductor
  bounds are lower bounds, `α_v = 1` is imposed on the whole local multiplicative group, and
  auxiliary ramification is permitted where the extension is unramified.
- Wang's exceptional case can require twice the common exponent of the prescribed local
  characters; fixing that exponent would invalidate the globalisation contract.
- A finite-order character at a complex place is trivial, so the transfer uses no continuous
  infinity parameters. A negative Brauer coefficient gives a meromorphic quotient, not a
  claim of Artin holomorphy.
- For a finite-image character with arithmetic Frobenius eigenvalue `ζ₃`, our local factor
  is `(1−ζ₃⁻¹ q_v^(−s))⁻¹`, agreeing with AA.2.4 on the dual character.

**Deligne–Langlands local constants.** Define *epsilonWeil* `V ψ dx ∈ ℂ^×` for complex representations
of `W_K` with open kernel on inertia: the unique function multiplicative in exact sequences, scaling
by `a^{dim V}` under `dx ↦ a·dx`, inductive in degree zero (`ε(Ind V_L, ψ) = ε(V_L, ψ ∘ Tr)` for
virtual representations of dimension `0`), and equal to Tate's constant in dimension one. Its
existence and uniqueness are the theorem of Deligne and Langlands, proved through the global inputs
above. Define `epsilon` for a Weil–Deligne representation,
`ε((V, r, N), ψ, dx) = ε(r, ψ, dx) · det(−r(F) | V^I/(ker N)^I)`, and `ε(ρ) = ε(ι WD ρ)` for an
`ℓ`-adic `ρ` and `ι : ℚ̄_ℓ ≅ ℂ`. Prove `ε(V, ψ, dx) · ε(V^∨ ⊗ ω, ψ(−x), dx') = 1` for Fourier-dual
measures (`vol_dx(O_K) · vol_dx'(O_K) = q^{−n(ψ)}`; scaling only `dx` multiplies the left side by the
scale to the power `dim V`, scaling both inversely preserves it), invariance under Frobenius
semisimplification, and the formula for unramified twists. Prove that for `K/ℚ_p` finite and `r` as in
the purity statement of §2.6, `ε(WD r, ψ, dx) = ε(WD r̄, ψ, dx)` (FSY, proof of Lemma 5.40, p. 58)
(Deligne 1973, 4.1, p. 535, 8.12, p. 572, and 2.3, p. 523; FSY, (5.33), p. 54). Intended signatures:
*epsilonWeil* `: (ρ : Representation ℂ W V) → AddChar K ℂ → Measure K → ℂˣ` and *WeilDeligneRep.epsilon*
likewise. *Needs:* [Arithmetic character constants](#local-constant-gauss-sum);
[Finite-order Hecke functional equation](#finite-order-hecke-functional-equation);
[Root-number product formula](#root-number-product-formula); Globalisation and Deligne's transfer
above; `TauCetiRoadmap.ClassFieldTheory` Layers 7, 9 and 11–12;
`TauCetiRoadmap.LocalFieldsRamification` Layer 0.
For `ω_s = |·|^s`, the unramified-twist identity is
`ε(V ⊗ ω_s) = q^(−s(a(V)+n(ψ) dim V)) ε(V)`.
Its conductor exponent uses the Artin conductor from ramification groups (§§3.2–3.3), defined
independently of `ε`; for Weil–Deligne data the definition is
`a(r,N) = a(r) + dim V^I − dim (ker N)^I`. Section 3.3 proves the comparison of this definition
with the exponent for `ε((r,N) ⊗ ω_s)`.

**Checks.**
- An unramified character with `n(ψ) = 0` and `vol(O_K) = 1` has `ε = 1`; `ε(Sp(2)) = −1`; `ε(0) = 1`.
- `ε(Sp(2)) ≠ ε(1 ⊕ ω)`: the monodromy factor is needed.
- A ramified character gives the Gauss-sum formula of Tate's constant.

### Examples

For `K/ℚ_p` finite: `WD(ℚ_ℓ(1)) = (ω, 0)`, `P = X − q`, `L = 1 − q⁻¹X`, weight `−2`. For `α ∈ O_E^×`,
`WD(λ(α)) = (λ_W(α), 0)` and `L = 1 − α⁻¹X`. The Kummer representation of an element `q_E ∈ K^×` with
`v(q_E) > 0` (the rational Tate module of the Tate curve, §6.3) is a non-split extension
`0 → ℚ_ℓ(1) → V → ℚ_ℓ → 0` with `ρ(I_K)` infinite and `WD(V) ≅ Sp(2)` (`N` is `v(q_E)` times a
generator, up to rescaling); it is Frobenius-semisimple and not semisimple, `L(V) = 1 − q⁻¹X`,
`L(V^∨) = 1 − X`, weight `−1`, and the twist by the unramified quadratic character `η` has
`L(V^∨ ⊗ η) = 1 + X`. For `ℓ ≠ p`, when `ℓ | v(q_E)` the reduction `T_ℓE_q/ℓT_ℓE_q` is unramified,
while `V_ℓE_q` is ramified (Deligne
1973, 2.3, p. 523, and 8.4.1, p. 568).

### Dependencies

Layer 1; Tau Ceti's inertia, Frobenius, cyclotomic and tame declarations;
`TauCetiRoadmap.LocalFieldsRamification` layers 0, 2, 4; `TauCetiRoadmap.ClassFieldTheory` layers 7,
9, 13; `TauCetiRoadmap.NumberFieldArithmetic` layers 2, 5;
`TauCetiRoadmap.RepresentationTheory/InductionRestriction` layer 6.
For §2.1a: EtaleCohomologyFoundations §F.3a.
For §2.3: PadicLocalLanglandsForGL2Qp §0.3's fundamental characters.
For §§2.4–2.5: SmoothRepresentationsOfLocalGroups SR.5.2 `wd-linear-substrate`,
`nilpotent-exp-log`, `grothendieck-monodromy`, `wd-parameter-operations`,
`full-wd-construction`, `wd-frobenius-semisimplification` and `classical-llc-normalization`.
For §§2.5a and 2.7: AdelicAlgebraicGroups AA.2.4's finite-image factors, induction and assembly.
For §2.7: §2.5a; GlobalNumberFields Layers 4–6 and 9–10; LFunctions Layers 0, 5–6;
ClassFieldTheory Layers 11–12 for reciprocity; finite-order character globalisation is owned in §2.7.

## Layer 3: Artin and Swan conductors

This layer defines the breaks, Swan and Artin conductors of local Galois representations, the
conductor of a Weil–Deligne representation, global conductors and the prime-to-`p` conductor
`N(ρ̄)`; it proves conductor integrality from Hasse–Arf, functoriality, the induction and
conductor–discriminant formulas and the behaviour under reduction modulo `ℓ`. Layers 4–7 and every level statement
consume these numbers; the downstream elliptic conductor comparisons are owned by
NeronModelsAndSemistableAbelianVarieties §§5.3a–5.3i.

Standing hypotheses (the *conductor setting*): `K` is complete for a discrete valuation `v_K` with
`v_K(K^×) = ℤ`, ring of integers `O_K` and **perfect** residue field `k` of characteristic `p > 0`,
`char K ∈ {0, p}`; for finite `k`, `K` is a nonarchimedean local field. `G_K` is identified with
`Gal(K^sep/K)` by Tau Ceti's `absoluteGaloisGroupRestrictEquiv`, and `I_K ⊇ P_K` are inertia and wild
inertia, with images `G_0`, `G_1` in finite Galois quotients. The coefficient field `C` is a Hausdorff
topological field of characteristic `≠ p`: a finite field or `F̄_ℓ` (discrete), `ℂ`, a finite
extension `E` of `ℚ_ℓ` or `ℚ̄_ℓ` (`ℓ ≠ p`). `V` is a finite-dimensional `C`-space with a continuous
`ρ : G_K → GL_C(V)` and `ρ(P_K)` finite; "`V` of the setting" means this. The case `ℓ = p` is excluded.
Sources: Ulmer = Ulmer, *Conductors of ℓ-adic representations* (2016); BK = Brumer–Kramer 1994.
Proposed names live in the namespace `Conductor`.

### 3.0 Ramification over perfect residue fields

LocalFieldsRamification Layers 3–4 build lower and upper numbering, Herbrand functions, the
different and Hasse–Arf for nonarchimedean local fields, whose residue fields are finite. The
conductor setting allows every perfect residue field, including `F̄_p`, so this section extends
that theory. For finite `k` each target below agrees with the LocalFieldsRamification statement of
the same name. Its integer-normalized valuations have `v_L|_K = e v_K`, `[L : K] = ef` and
`d(L/K) = v_L(𝔇_{L/K})`.

**Lower numbering, the different and Hasse–Arf.** Let `K` be in the conductor setting and `L/K`
finite separable. Prove that `v_K` has a unique extension to `L`, that `O_L` is a complete discrete
valuation ring finite over `O_K` with `[L : K] = ef`, and that `O_L = O_K[x]` for one `x`, the
residue extension being separable because `k` is perfect. For `L/K` Galois with group `G`, take the
lower groups `G_i = TauCeti.IsLocalRing.ramificationGroup G O_L i` (`i ∈ ℤ`) and prove:
`G/G_0 ≅ Gal(k_L/k)`, `|G_0| = e`, `G_0/G_1` is cyclic of order prime to `p` and `G_i/G_{i+1}`
(`i ≥ 1`) is an elementary abelian `p`-group; Hilbert's formula `d(L/K) = Σ_{i ≥ 0} (|G_i| − 1)`;
the Herbrand function `φ_{L/K}(s) = ∫_0^s [G_0 : G_t]⁻¹ dt` for `s ≥ 0`, the identity on `[−1, 0]`,
with inverse `ψ_{L/K}` and upper groups `G^u = G_{ψ_{L/K}(u)}`; `H_s = G_s ∩ H` for every subgroup
`H`; Herbrand's theorem `(G/H)^u = G^u H/H` for `H` normal; the tower identity
`φ_{L/K} = φ_{L′/K} ∘ φ_{L/L′}` for Galois `L′/K` inside `L`; and the Hasse–Arf theorem: for `G`
abelian, every jump `i` (`G_i ≠ G_{i+1}`) has `φ_{L/K}(i) ∈ ℤ`. Over finite `k` these are the
LocalFieldsRamification Layer 3 statements. Everything but Hasse–Arf follows Serre, *Local
Fields*, IV §§1–3, whose standing hypothesis is a separable residue extension; Hasse–Arf reduces,
by the completed maximal-unramified comparison below, to an algebraically closed residue field,
where it is Serre 1961, n° 3.5, Cor. 1 to Prop. 8, p. 136 (Serre 1961, n° 3.1, Props. 1–4,
pp. 126–128; Serre, *Local Fields*, V §7). *Needs:* Tau Ceti
`TauCeti.IsLocalRing.ramificationGroup`, `TauCeti.IsLocalRing.ramificationGroupReal`,
`TauCeti.IsLocalRing.lowerIndex` and `TauCeti.multiplicity_differentIdeal_tower`; Mathlib
`PerfectField` and `differentIdeal`; the completed maximal-unramified comparison below.

**Checks.**
- For `ℚ_2(ζ_8)/ℚ_2`, `G_0 = G_1` has order `4`, `G_2 = G_3` has order `2` and `G_4 = 1`, so
  Hilbert's formula gives `d = 3 + 3 + 1 + 1 = 8`, the finite-residue value of LocalFieldsRamification.
- For `k = F̄_p`, the Artin–Schreier extension `y^p − y = t⁻¹` of `k((t))` has `G_0 = G_1` of
  order `p` and `G_2 = 1`, so `e = p`, `d = 2(p − 1)`, the only jump `1` has `φ(1) = 1 ∈ ℤ`, and
  `ψ(u) = pu − p + 1` for `u ≥ 1`. The finite-residue statements do not apply to this field.
- Over the imperfect residue field `F_p(s)`, the extension `y^p − y = s t^{−p}` of `F_p(s)((t))`
  has `z = ty` with `z^p − t^{p−1} z = s`, so its residue extension is the purely inseparable
  `F_p(s^{1/p})` and `e = 1`; the generator `y ↦ y + 1` acts trivially on the residue field, so
  `G = G_0` and `|G_0| = e` fails. Perfectness of `k` is necessary.

**Absolute upper filtration and transition functions.** In the conductor setting define
`G_K^u` for `u ≥ −1` as the inverse limit of the upper groups `Gal(L/K)^u` over finite Galois
`L/K` in `K^sep`, compatible by Herbrand's theorem, and `G_K^{u+} = closure(⋃_{w > u} G_K^w)`.
Prove that each `G_K^u` is closed and normal, maps onto `Gal(L/K)^u` for every finite Galois `L/K`,
and that `G_K^{−1} = G_K`, `G_K^0 = I_K` and `G_K^{0+} = P_K` (Tau Ceti's `TauCeti.inertiaSubgroup`
and `TauCeti.wildInertiaSubgroup` for local fields). For `L/K` finite separable and any finite
Galois `M/K` containing `L`, define `ψ_{L/K} = φ_{M/L} ∘ ψ_{M/K}` and prove that it is independent
of `M`, that `G_K^u ∩ G_L = G_L^{ψ_{L/K}(u)}` for `u ≥ −1`, and that
`ψ_{L/K}(u) = (1/f) ∫_0^u [G_K : G_K^t G_L] dt` for `u ≥ 0`. The intersection formula is the finite
computation `Gal(M/K)^u ∩ Gal(M/L) = Gal(M/L)_{ψ_{M/K}(u)}` from `H_s = G_s ∩ H`; independence of
`M` is the tower identity (Serre 1961, n° 3.1, Prop. 4 and Remarque, p. 128; Serre, *Local
Fields*, IV §3). *Needs:* the lower-numbering target above; Mathlib `Field.absoluteGaloisGroup`
with its Krull topology and `InfiniteGalois.mem_bot_iff_fixed`.

**Checks.**
- For `L = K`, `ψ_{L/K}` is the identity and the intersection formula is a tautology.
- For `L/K` tame of index `e` and residue degree `f`, `[G_K : G_K^t G_L] = ef` for `t > 0`, so
  `ψ_{L/K}(u) = eu` for `u ≥ 0`.
- For `y^p − y = t⁻¹` over `F̄_p((t))`, `[G_K : G_K^t G_L]` is `1` for `t ≤ 1` and `p` for
  `t > 1`, so the integral gives `ψ(u) = u` on `[0, 1]` and `pu − p + 1` beyond. For odd `p`,
  `G_K^2 ∩ G_L = G_L^{p+1}` is strictly smaller than `G_L^2`: an Artin–Schreier character of `G_L`
  with break `2` is nontrivial on `G_L^2` and trivial on `G_L^{p+1}`. Using `u` in place of
  `ψ_{L/K}(u)` fails.

**Completed maximal-unramified comparison.** In the conductor setting let `K^ur ⊂ K^sep` be the
union of the finite unramified extensions of `K`, and `K′` the completion of `K^ur`. Prove that
`K^ur/K` is Galois with `Gal(K^ur/K) ≅ G_k` and `G_{K^ur} = I_K`; that `K′` is complete
discretely valued with residue field `k̄` and the same value group; that `L ↦ LK′` is an
equivalence from finite separable extensions of `K^ur` to those of `K′` (Krasner's lemma on the
henselian field `K^ur`), giving a topological isomorphism `G_{K′} ≅ I_K`; and that for finite Galois
`L/K` with `L′ = LK′`, `Gal(L′/K′) ≅ G_0(L/K)` with the same lower groups, so `e(L′/K′) = e(L/K)`,
`d(L′/K′) = d(L/K)` and every upper group `G^u`, `u ≥ 0`, is preserved, while the residue degree
becomes `1` (Serre 1961, n° 3.7, Remarque 2°, p. 139; Serre, *Local Fields*, III §5).
*Needs:* Mathlib `IsKrasner.krasner`, `PerfectField`; the lower-numbering target above for the
lower groups.

**Checks.**
- For `ℚ_3(ζ_9)/ℚ_3`, base change to `K′` preserves `e = 6`, `d = 9` and `ψ(u) = 6u − 4` for
  `u ≥ 1`.
- A finite unramified `L/K` has `L′ = K′`, with `d = 0` and `ψ = id` on both sides, while its
  residue degree drops from `[L : K]` to `1`.
- For finite `k = F_q`, `Gal(K^ur/K) ≅ Ẑ` with arithmetic Frobenius `1`, recovering
  LocalFieldsRamification Layer 2's `Gal(K^ur/K) ≅ Ẑ`.

### 3.1 Finite wild image, breaks and the Swan conductor

Use §3.0 on the full conductor setting. For function fields, AlgebraicCurves Layer 8's completion
bridge from `Place.ramificationGroup` gives the finite lower groups of §3.0.

**The eventual Herbrand formula.** For every finite separable `L/K` in the conductor setting,
with `e = e(L/K)`, `f = f(L/K)` and `δ(L/K) = f d(L/K)`, prove that for all sufficiently large `u`,
`ψ_{L/K}(u) = e u − d(L/K) + e − 1`, equivalently
`∫_0^∞ ([L : K] − [G_K : G_K^t G_L]) dt = f(d(L/K) − e + 1) = δ(L/K) − [L : K] + f`.
For Galois `L/K`, §3.0's Hilbert different formula and the eventual triviality of the
lower groups give the constant term of `ψ`. For general separable `L/K`, choose a Galois closure
`M/K` and apply the Galois formula to `M/K` and `M/L` in §3.0's identity
`ψ_{L/K} = φ_{M/L} ∘ ψ_{M/K}`; the different tower formula gives the same constant term.
The integral formula of §3.0 gives the equivalent integral identity. Section 3.5 uses this
consequence for conductor induction (Serre 1961, n° 3.1, Prop. 4 and Remarque, p. 128;
Serre, *Local Fields*, III §4, Prop. 8 and IV §§1–3).
*Needs:* §3.0 (integer rings, Hilbert's different formula, Herbrand functions, finite-separable
transition functions and their integral formula); Tau Ceti `TauCeti.multiplicity_differentIdeal_tower`
on §3.0's integer rings.

**Checks.**
- For finite unramified `L/K`, `e = 1`, `d = 0` and `ψ_{L/K}(u) = u`; the integral is `0`.
- For tame `L/K` of index `e` and residue degree `f`, `d = e − 1` and `ψ_{L/K}(u) = eu` for
  `u ≥ 0`; the integral is `f(d − e + 1) = 0`.
- For every perfect `k` of characteristic `p`, including `F̄_p`, the Artin–Schreier extension
  `y^p − y = t⁻¹` of `k((t))` has `e = p`, `f = 1`, `d = 2(p − 1)` and
  `ψ(u) = pu − p + 1` for `u ≥ 1`; the integral is `p − 1`.
- For `ℚ_2(ζ_8)/ℚ_2`, `e = 4`, `f = 1`, `d = 8` and the last upper break is `2`, so
  `ψ(u) = 4u − 5` for `u ≥ 2` and the integral is `5`.
- Completed maximal-unramified base change of `ℚ_3(ζ_9)/ℚ_3` preserves `e = 6`, `d = 9` and
  `ψ(u) = 6u − 4` for `u ≥ 1`. An unramified extension instead becomes trivial, with `d = 0`
  and `ψ(u) = u` unchanged, while its residue degree can change.

**Finite wild image.** Prove that for `ρ` continuous on a finite-dimensional `V`, `ρ(P_K)` is a finite
`p`-group when the coefficients are (a) discrete, (b) `ℂ` (then `ρ(G_K)` is finite), (c) a finite
extension `E` of `ℚ_ℓ` or (d) `ℚ̄_ℓ`, with `ℓ ≠ p`; in case (c) the map `ρ(P_K) → GL(Λ/𝔪_EΛ)` is
injective for every stable lattice `Λ`; for `ℓ = p` (c) fails (Ulmer, §5, p. 4). Prove that for `V` of
the setting there is a finite Galois `L/K` in `K^sep` with `Gal(K^sep/L) ∩ P_K ⊆ ker ρ`; that for such
`L` the wild action factors uniquely through `Gal(L/K)_1` with image `ρ(P_K)`, conjugation by
`Gal(L/K)` corresponding to conjugation by any lift in `G_K`; that every finite Galois `L' ⊇ L` again
kills the wild kernel, with `Gal(L'/K)_1` acting through restriction to `L`; and that if `ρ(I_K)` is
finite, `L` can be chosen with inertia acting through `Gal(L/K)_0` (Ulmer, §4, p. 3). *Needs:* §1.4,
§1.5, §1.6; Mathlib `ProfiniteGrp.exist_openNormalSubgroup_sub_open_nhds_of_one`; Tau Ceti
`Field.absoluteGaloisGroup.exists_finiteDimensional_normal_fixingSubgroup_le`.

**Break decomposition and Swan conductor.** For `V` of the setting, using §3.0's absolute upper
filtration, define the break
decomposition: the unique `G_K`-stable `V = ⊕_{λ ∈ ℚ_{≥0}} V(λ)`, almost all zero, with
`V(0) = V^{ρ(P_K)}` and, for `λ > 0`, `V(λ)^{G_K^λ} = 0` and `V(λ)^{G_K^{λ+}} = V(λ)`. The `breaks` are
the `λ` with `V(λ) ≠ 0` and *highestBreak* their maximum (`0` for `V = 0`). Define

```text
Sw(V) = Σ_λ λ · dim V(λ)                          (sum over the breaks)
      = ∫_0^∞ codim_V V^{ρ(G_K^u)} du               (integral along the upper numbering)
      = Σ_{i ≥ 1} (|G_i|/|G_0|) · codim_V V^{G_i}    (weighted sum over the lower groups),
```

a nonnegative rational number, the last sum for any finite Galois `L/K` with
`Gal(K^sep/L) ∩ P_K ⊆ ker ρ`, `G_i` (`i ≥ 1`) acting through lifts in `P_K`. Intended signatures:
*Conductor.breaks* `ρ : Finset ℚ`, *Conductor.swanConductor* `ρ : ℚ`. Its API is the equality of the
three expressions for every admissible `L`, using the finite-quotient surjections above;
`Sw = 0` iff `ρ(P_K) = 1`; dependence only on `ρ|_{P_K}` up
to isomorphism, invariance under extension of coefficients, and `Sw ≤` *highestBreak* `· dim V` with
equality iff there is at most one break (Ulmer, §4, (4.1), pp. 3–4). *Needs:* Mathlib
`Representation.invariants`, `PerfectField`;
§3.0 (the absolute upper filtration, including its finite-quotient surjections); the
finite-wild-image target above.

**Checks.**
- Any `V` with `ρ(P_K) = 1` has `Sw = 0` and `V = V(0)`.
- For `V = 0`, the break set is empty, *highestBreak* `= Sw = 0` and equality holds in
  `Sw ≤` *highestBreak* `· dim V`.
- Over `ℚ_2`, the character of `ℚ_2(√−1)` has one break `1` and `Sw = 1`; that of `ℚ_2(√2)` has break
  `2` and `Sw = 2`.
- The character `χ_8` of `ℚ_2(√2)` read on `ℚ_2(ζ_8)`: `|G_0| = 4`, `G_1, G_2, G_3` of orders `4, 2, 2`,
  codimension `1` each; the weighted sum is `2` and the unweighted sum `3`. The weighted sums over
  `ℚ_2(√2)` and over `ℚ_2(ζ_8)` both equal `2`, so the expression is independent of `L`.
- `G_K^0` and `G_K^{0+}` are the `I_K` and `P_K` of Tau Ceti.
- For every perfect `k` of characteristic `p`, including `k = F̄_p`, the character of
  `y^p − y = t⁻¹` over `k((t))` has its single break at `1` and `Sw = 1`.
- For odd `p` and `K = Frac W(F̄_p)`, a nontrivial character of `K(ζ_p)/K` is tame:
  `V = V(0)` and `Sw = 0`, despite the infinite residue field.

### 3.2 The Artin conductor and its integrality

**Unit-filtration reciprocity.** Let `K` be a nonarchimedean local field of either
characteristic, `U_K^0 = O_K^×` and `U_K^n = 1 + 𝔪_K^n` for `n > 0`, and let `L/K` be a finite
abelian extension inside `K^sep`. Prove that ClassFieldTheory Layer 7's `normResidue` maps
`U_K^n` onto the upper ramification group `Gal(L/K)^n` of §3.0 for every integer `n ≥ 0`, depth
zero included (*map_unitFiltration_normResidue*), and the absolute form
`closure(artinMap(U_K^n)) = image(G_K^n → G_K^{ab})`, with ClassFieldTheory's arithmetic
normalization. For real `u ≥ 0`, `Gal(L/K)^u = Gal(L/K)^{⌈u⌉}` by Hasse–Arf, so the integer
depths determine the whole filtration. Proof: at depth `0`, the image of `U_K` lies in inertia
by `mem_inertiaSubgroup_of_mk_eq_artinMap`, and it is all of `Gal(L/K)_0` because the norm of a
uniformiser of `L` has valuation `f(L/K)` and is killed by `normResidue`. For `n ≥ 1` compute the
norm on unit filtrations of a cyclic extension of prime degree (`N(U_L^{ψ(n)}) ⊆ U_K^n`, with the
induced map on graded pieces), then pass to every finite abelian `L/K` by induction along a
composition series, using Herbrand's theorem of §3.0 and the norm compatibility
`artinMap_norm` (Serre, *Local Fields*, V §§3–6 and XV §2, Thm 2 and Cor. 3 to Thm 1, p. 228;
for Lubin–Tate extensions the same identification is Milne, *Class Field Theory*, I, 1.11,
p. 24, and Prop. 4.3, p. 46). ClassFieldTheory Layer 7 supplies `artinMap`, `normResidue`,
`artinMap_restrict` and `artinMap_norm`, but not this identification.
*Needs:* §3.0 (upper numbering, Herbrand's theorem, Hasse–Arf); ClassFieldTheory Layers 6–8
(`normResidue`, `artinMap`, `artinMap_restrict`, `artinMap_norm`,
`mem_inertiaSubgroup_of_mk_eq_artinMap` and the local existence theorem); LocalFieldsRamification
Layer 1 (the unit filtration) and Layer 2 (unramified extensions).

**Checks.**
- For `L = ℚ_2(√2)`, the character `χ_8` of `Gal(L/ℚ_2)` has upper break `2`; `5 ∈ U^2` is not a
  norm since `(5, 2)_2 = −1`, so `U^2` maps onto `Gal(L/ℚ_2) = Gal(L/ℚ_2)^2`, while `U^3` maps to
  `1 = Gal(L/ℚ_2)^3`, and the conductor is `3`. `characterConductorExp` records only the least
  trivial depth `3`; matching each `U^n` with `Gal(L/K)^n` is the content of this target.
- For `L/K` unramified, `U^0` maps to `1 = Gal(L/K)^0`, and a uniformiser maps to arithmetic
  Frobenius; depth zero is not the whole group.
- For `K = F_p((t))` and `y^p − y = t⁻¹`, `U^1` maps onto `Gal(L/K) = Gal(L/K)^1` and `U^2`
  to `1`, so the equal-characteristic conductor is `2`; for odd `p` and `ℚ_p(√p)`, `U^0` maps onto
  `Gal(L/ℚ_p)` and `U^1` to `1`.

**The Artin conductor.** Define, for `V` of the setting, `a(V) := codim_V V^{ρ(I_K)} + Sw(V) ∈ ℚ_{≥0}`
with tame part `ε(V) := dim V − dim V^{ρ(I_K)}`, and its natural-number form, defined through the
integrality theorem of §3.5 (intended signatures *Conductor.artinConductor* `ρ : ℚ` and
*Conductor.artinConductorNat* `ρ : ℕ`). The tame part uses the actual inertia image: for an `ℓ`-adic `ρ`
it contains the monodromy term, for a residual `ρ̄` it is computed from `ρ̄` itself, never from a
lift. Its API is `a = ε + Sw`; the lower sum `a(V) = Σ_{i ≥ 0} (|G_i|/|G_0|) · codim V^{G_i}` when
inertia has finite image, over any admissible `L`; dependence only on `ρ|_{I_K}` up to isomorphism;
invariance under extension of coefficients; `V^{ρ(I_K)} = (ker N)^{r(I_K)}` for an `ℓ`-adic `ρ` with
`WD(ρ) = (r, N)` (§2.4); and for `K` a nonarchimedean local field and `χ` of finite order, `a(χ)` equals
`characterConductorExp (χ ∘ artinMap)` by *Unit-filtration reciprocity* above
(Serre 1987, §1.2, (1.2.1)–(1.2.2), pp. 180–181). *Needs:* §3.1; §2.4; *Unit-filtration
reciprocity* above; `TauCetiRoadmap.ClassFieldTheory` Layer 7 (`characterConductorExp`); Mathlib
`Module.finrank`.

**Checks.**
- `ρ(I_K) = 1` or `V = 0` gives `a = 0`.
- Over `ℚ_2`, `a(χ_{−4}) = 2` and `a(χ_8) = 3`; the term `i = 0` alone gives `1` for `χ_8`, not `3`.
- The `ℓ`-adic special representation `Sp(2)` has `a = 1`, while the lattice `O_E e₁ ⊕ ℓ O_E e₂`
  (`N e₂ = e₁`) reduces to an unramified `ρ̄` with `a = 0`: the conductor of a reduction is computed from
  the reduction.

**Characters.** Prove that a ramified character `χ` with finite wild image has an integer upper break
`u(χ)` with `Sw(χ) = u(χ)` and `a(χ) = 1 + u(χ)`, and a tamely ramified `χ` has break `0` (Serre 1970,
§2.1, p. 7). *Needs:* §3.0 (Hasse–Arf over every perfect residue field); §3.1 (breaks);
*Unit-filtration reciprocity* above for the local-field character-conductor comparison.

**Checks.**
- A nontrivial tame quadratic character over `ℚ_p`, `p` odd, has break `0` and Artin conductor `1`;
  its Artin-map pullback is trivial on `U_K^1` and nontrivial on `U_K^0`.
- Over `ℚ_2`, `χ_8` has break `2` and conductor `3`; its Artin-map pullback is trivial on `U_K^3`
  and nontrivial on `U_K^2`.
- An unramified character has conductor `0` and Artin-map pullback trivial on `U_K^0`; the formula
  `a = 1 + u` applies only to ramified characters.

**Wild characters and their extensions.** Let `M/K_0` be finite, totally ramified and Galois in the
setting, with `G_0 ⊇ G_1` and lower groups `G_i`, and let `C` be algebraically closed of
characteristic `≠ p`. Prove that every simple `C[G_1]`-module `θ` has a characteristic-zero lift `θ̃`
(a representation over an algebraically closed field of characteristic zero with the same Brauer
character) with equal invariant dimensions for every subgroup of `G_1`, since `G_1` is a `p`-group of
order invertible in `C`; that `θ` and `θ̃` have the same `G_0`-stabiliser `T`; and that `θ̃` extends
to `T`, because `T/G_1` is cyclic (BK, §2, Lemma 2.7, pp. 230–231). The extension uses the theorem
that an irreducible character of a normal subgroup `N` invariant under `G` with `G/N` cyclic extends
to `G` (Isaacs, *Character theory of finite groups*, Cor. 11.22), proved from the Clifford obstruction
class in `H²(G/N, ℂ^×)` and the vanishing of `H²` of a finite cyclic group with coefficients in a
divisible group with trivial action. Prove that if `θ̃_T` extends `θ̃` to `T`,
`Res_{G_1} Ind_T^{G_0} θ̃_T` is the sum of the distinct `G_0`-conjugates of `θ̃` once each and
`Sw(Ind_T^{G_0} θ̃_T) = [G_0 : T] · sw(θ)` (same locator). Prove that for `V` a continuous
representation of `G_{K_0}` whose wild action factors through this `G_1` compatibly with conjugation
by inertia (not for an arbitrary `G_1`-module), the multiplicities `m_θ` are constant on `G_0`-orbits
and `Sw(V) = Σ_O m_θ · Sw(Ind_T^{G_0} θ̃_T)` (Serre 1987, (1.2.2), p. 181). *Needs:* §1.3 (the Mackey
decomposition); `TauCetiRoadmap.RepresentationTheory/InductionRestriction` layer 5 (Clifford's theorem
and correspondence) and layer 7 (`cliffordObstruction`); §3.1.

### 3.3 Weil–Deligne and global conductors

**The conductor of a Weil–Deligne representation.** For `K` a nonarchimedean local field with `q`
residue elements and a Weil–Deligne representation `(r, N)` on `V` over a field of characteristic zero
(§2.4), define `a(r, N) := Sw(r) + dim V − dim (ker N)^{r(I_K)}` (intended signature
*Conductor.wdConductor* `D : ℕ`), the Swan term using only `G_K^u ⊆ P_K ⊆ W_K` for `u > 0`. The monodromy
contribution is `dim V^{r(I_K)} − dim (ker N)^{r(I_K)} ≥ 0`, not `dim V − dim ker N`. Its API is
`a(r, N) = a(r) + dim V^{r(I_K)} − dim (ker N)^{r(I_K)}`; `a(r, 0) = a(r)`; `a(ρ) = a(WD ρ)` for `ℓ ≠ p`,
for every Frobenius lift and every trivialisation of `ℤ_ℓ(1)`; invariance under Frobenius
semisimplification; additivity on direct sums; invariance under unramified twists; and
`a(Sp(n) ⊗ χ) = n − 1` for `χ` unramified and `n · a(χ)` otherwise (Ulmer, §§6–8, pp. 5–7). *Needs:*
§3.2; §2.4, §2.5; `TauCetiRoadmap.ClassFieldTheory` layer 9.

**Checks.**
- `V = C²`, `r` unramified, `N ≠ 0`: `a = 1`; the Kummer representation of a Tate parameter has `a = 1`
  on both sides of `a(ρ) = a(WD ρ)`.
- `a(r, 0) = a(r)`, and unramified `r` with `N = 0` gives `0`.
- For `Sp(2) ⊗ χ` with `χ` tamely ramified, `a = 2`; replacing `(ker N)^{r(I)}` by `ker N` gives
  `2 + 0 − 1 = 1`.

**The conductor in the local constant.** Prove that for `K/ℚ_p` finite, a Weil–Deligne representation
`V` over `ℂ` and `ω_s = |·|^s` read on `W_K`,
`ε(V ⊗ ω_s, ψ, dx) = q^{−(a(V) + n(ψ) dim V) s} ε(V, ψ, dx)` (Deligne 1973, 8.12, p. 572; FSY, (5.33),
p. 54). *Needs:* §2.7; the conductor of Weil–Deligne representations above.

**Global conductors.** For a number field `F`, `ρ : G_F → GL(V)` continuous and unramified outside a
finite set (§2.2), and `Σ` a finite set of finite places containing every place of residue
characteristic `char C` when it is positive and every place above `ℓ` when `ρ` is `ℓ`-adic (`Σ = ∅` is
allowed for Artin representations; intended predicate *AdmissibleExcludedPlaces* `ρ Σ`), define
`N^Σ(ρ) := ∏_{v ∉ Σ} 𝔭_v^{a_v(ρ)}`, `a_v(ρ) = a(ρ_ι)` for an embedding `ι` at `v` (§2.1);
`N(ρ) := N^∅(ρ)` for Artin `ρ`; `N^{(ℓ)}(ρ) := N^{{v | ℓ}}(ρ)` for `ℓ`-adic `ρ`; and the prime-to-`p`
conductor `N(ρ̄) := N^{{v | p}}(ρ̄)` for `ρ̄` over a finite field of characteristic `p`. Places in `Σ`
are excluded from the product, not given exponent `0`. Intended signatures:
*Conductor.globalConductor* `ρ Σ : Ideal (𝓞 F)`, *Conductor.primeToPConductor* `ρ̄ : Ideal (𝓞 F)`. Its API
is `v_𝔭(N^Σ) = a_v` off `Σ` and `0` on `Σ`; `N^Σ = 1` iff `ρ` is unramified at every finite `v ∉ Σ`;
`N(ρ̄)` prime to `p`; independence of the isomorphism class and of the `ι_v`; multiplicativity on
direct sums, and `N^Σ(ρ) N^Σ(ρ') | N^Σ(ρ'')` for an extension `ρ''` of `ρ'` by `ρ` with equality when
inertia images are finite of order invertible in the coefficients; and the positive generator over `ℚ`
(Serre 1987, §1.2, (1.2.3), p. 181). *Needs:* §3.2; §2.1; `TauCetiRoadmap.NumberFieldArithmetic` layer
5; Mathlib `IsDedekindDomain.HeightOneSpectrum`, `Ideal.absNorm`.

**Checks.**
- The trivial representation has `N^Σ = (1)` for every `Σ`.
- The Dirichlet character of conductor `4`, read as a character of `G_ℚ`, has `N = 4`.
- For `p` odd, `N(ω_p) = 1` although `ω_p` ramifies at `p`: the places above `p` must be excluded.
- `ρ̄ = χ̄_{−4} ⊕ 1` over `F_3` has `N(ρ̄) = 4`, while over `F_2` the same representation is trivial
  with `N(ρ̄) = 1`: the conductor of a reduction is computed from the reduction.

### 3.4 Functoriality

**Exact sequences, duals, twists, base change.** For `V` of the setting prove: Swan conductors are
additive in exact sequences `0 → V' → V → V'' → 0`, so `Sw(V) = Sw(V^ss)` (BK, §2, Lemma 2.4, p. 229);
`a(V) ≥ a(V') + a(V'')` with equality iff `V^{I_K} → V''^{I_K}` is onto, `a` is additive on direct sums
and `a(V) ≥ a(V^ss)` (same page, (2.1)); `Sw(V^∨) = Sw(V)` and `a(V^∨) = a(V)`, also for infinite inertia
image (same locator); twisting by an unramified character changes neither `a` nor `Sw`, while twisting
by a tamely ramified character leaves `Sw` and the positive breaks unchanged but can change the tame
term (same locator); if a character `χ` has a positive break `u(χ)` exceeding every break of `V`, then
all breaks of `V ⊗ χ` lie in `{u(χ)}`, with equality of break sets when `V ≠ 0`,
`Sw(V ⊗ χ) = u(χ) dim V` and `a(V ⊗ χ) = a(χ) dim V` (Ulmer, §10,
Prop. 1, p. 8); finite unramified extensions of `K`, and passage to the completion of `K^ur`,
preserve `a` and `Sw` (Serre 1970, §2.1, p. 7); for `L/K` finite tame of ramification index `e` the
positive breaks are multiplied by `e` and `Sw_L(V|_{G_L}) = e · Sw_K(V)` (same locator); and extension
of the coefficient field preserves `Sw` and `a` (same page). *Needs:* Layer 1 (restriction, duals,
tensor products, twists, semisimplification); Mathlib `Representation.dual`, `Representation.tprod`;
`TauCetiRoadmap.LocalFieldsRamification` Layer 2; §3.0 (open-subgroup and completed
maximal-unramified comparisons); §2.2 (inertia under finite extensions); §3.1 (breaks).

**Checks.**
- The unipotent `(1 a; 0 1)` of inertia over `ℚ_ℓ` (an `ℓ`-adic special representation) has `a = 1`, its
  semisimplification `a = 0`: the Artin conductor is only superadditive.
- A tame ramified character `χ` has `a(χ) = 1` and `a(χ ⊗ χ⁻¹) = 0`: tame twists change the tame term.
- `a(V^∨) = a(V)` for the Kummer representation of a Tate parameter (both `1`).
- For `V = 0` and a character `χ` with positive break, `V ⊗ χ = 0` still has no breaks and both
  conductor formulas give `0`.

### 3.5 Induction and the conductor–discriminant formula

**Invariants of induced representations.** Prove that for `Γ` profinite, `H` open, `D` closed normal
and `U` a finite-dimensional representation of `H`, `dim (Ind_H^Γ U)^D = [Γ : HD] · dim U^{H ∩ D}`; that
for `L/K` finite separable of residue degree `f`, `dim (Ind_{G_L}^{G_K} V)^{I_K} = f · dim V^{I_L}`; and
that finite wild image on `G_L` gives finite wild image of `Ind_{G_L}^{G_K} V` (BK, §6, p. 245). *Needs:*
§1.3; §2.2.

**The local induction formula.** Prove that in the setting, for `L/K` finite separable in `K^sep` with
`e, f, d(L/K)`, `δ(L/K) = f · d(L/K)`, and `V` a continuous representation of `G_L` over a field of
characteristic `≠ p` with `ρ(P_L)` finite, `Ind_{G_L}^{G_K} V` has finite wild image and in `ℚ`:
(a) `codim (Ind V)^{I_K} = ([L : K] − f) dim V + f codim V^{I_L}`; (b)
`Sw_K(Ind V) = f Sw_L(V) + (δ(L/K) − [L : K] + f) dim V`; (c) `a_K(Ind V) = δ(L/K) dim V + f a_L(V)`. In
particular `a_K(Ind 1) = δ(L/K)` (conductor–discriminant) and `Sw_K(Ind 1) = f(d(L/K) − e + 1)`; `V` need
not factor through a finite quotient (BK, §2, (2.5), p. 230; Serre 1961, n° 3.7, (31), p. 138).
*Needs:* the invariants target above; §3.0 (upper numbering on open subgroups); §3.1 (the eventual Herbrand formula and break decomposition); §1.3.

**The global induction formula.** Prove that for `F'/F` finite extensions of number fields and a
finite place `v` of `F`, `v(𝔡_{F'/F}) = Σ_{w | v} δ(F'_w/F_v)`, by combining the localisation of the
different with the valuation of the relative discriminant. Prove that for `Σ` admissible, `Σ'` the
places above it, and `ρ` a representation of `G_{F'}` with conductor defined outside `Σ'`,
`N_F^Σ(Ind ρ) = (𝔡_{F'/F})_Σ^{dim ρ} · Nm_{F'/F}(N_{F'}^{Σ'}(ρ))`, `𝔡_{F'/F}` the relative
discriminant and `(·)_Σ` its part prime to `Σ`; and that for `F = ℚ`, `M` quadratic and `ψ` of finite
order, `N(Ind ψ) = |d_M| · Nm_{M/ℚ}(𝔣(ψ))` with `𝔣(ψ)` the Artin conductor ideal of `ψ` (prime-to-`ℓ`
parts for `ℓ`-adic `ψ`), which is the conductor of the corresponding Hecke character by §3.2 (BK,
(2.5), p. 230). *Needs:* the local induction formula; §3.3; `TauCetiRoadmap.NumberFieldArithmetic`
layer 5 (§5.9, the different localizes; §5.10, the relative discriminant valuation); Mathlib
`differentIdeal`, `NumberField.discr`, `Representation.ind`.

**Checks.**
- `a(Ind_{G_{ℚ_2(i)}}^{G_{ℚ_2}} 1) = 2 = v_2(d_{ℚ(i)})`, and `Ind 1 = 1 ⊕ χ_{−4}` gives `0 + 2`.
- For `L/K` unramified, `δ = 0` and `a_K(Ind V) = f a_L(V)`.
- For `L/K` tame of index `e`, `Sw_K(Ind 1) = f(d − e + 1) = 0` since `d = e − 1`.

**Hasse–Arf integrality.** Prove that for finite Galois `L/K` and a representation `W` of `Gal(L/K)`
in characteristic zero, `a(W), Sw(W) ∈ ℕ`, by Brauer induction from the case of characters and the
local induction formula above (Serre 1961, n° 3.7, Thm 2, p. 138). Prove that for `V` of the setting,
`Sw(V), a(V) ∈ ℕ`; that both are independent of the auxiliary `L`, of the algebraic closure, of the
extension of the valuation and of the isomorphism class; that `a(V) = 0` iff `I_K` acts trivially,
`Sw(V) = 0` iff `P_K` acts trivially, and `a(V) = codim V^{I_K}` iff `V` is tame (Serre 1987, §1.2
(a), p. 181). *Needs:* the targets on characters and wild characters of §3.2; the local induction
formula above; `TauCetiRoadmap.RepresentationTheory/InductionRestriction` layer 6 (Brauer's induction
theorem).

### 3.6 Reduction modulo `ℓ`

**Conductors of reductions.** In the setting let `ℓ ≠ p`, `E/ℚ_ℓ` finite, `ρ` continuous on an
`E`-space `V`, `Λ` a stable lattice and `ρ̄_Λ := Λ/𝔪_EΛ`. Prove `Sw(ρ̄_Λ) = Sw(ρ) = Sw(ρ̄_Λ^ss)`
(Darmon–Diamond–Taylor 2007, Lemma 2.7, pp. 54–55);
`a(ρ̄_Λ) = a(ρ) − (dim ρ̄_Λ^{I_K} − dim V^{I_K}) ≤ a(ρ)`, with equality exactly when
`Λ^{I_K} ⊗ k_E → ρ̄_Λ^{I_K}` is surjective, as it is whenever the inertia image is finite of order
prime to `ℓ` (same lemma); `a(ρ̄_Λ^ss) ≤ a(ρ̄_Λ) ≤ a(ρ)`, with `a(ρ̄_Λ^ss)` independent of `Λ` (Ulmer,
§6, p. 5); and for a global `ℓ`-adic `ρ` of finite ramification, `N^{(ℓ)}(ρ̄_Λ) | N^{(ℓ)}(ρ)` with
quotient `∏_{v ∤ ℓ} 𝔭_v^{dim ρ̄_Λ^{I_v} − dim V^{I_v}}`, and `N^{(ℓ)}(ρ̄_Λ^ss) | N^{(ℓ)}(ρ)`
(Darmon–Diamond–Taylor 2007, Lemma 2.7). *Needs:* §3.1, §3.4, §1.9 (independence of the residual
semisimplification).

### 3.7 Computations and Artin–Schreier characters

**Small conductors.** For `K` a nonarchimedean local field of residue characteristic `p` and
coefficients of characteristic `≠ p`, prove: a rank-two Weil–Deligne representation with unramified
`r` and `N ≠ 0` has conductor `1` (Darmon–Diamond–Taylor 2007, Prop. 2.12, p. 57); `dim V = 2`, `P_K`
acting trivially and `V^{I_K} = 0` give `a(V) = 2`, covering two nontrivial tame inertia characters and
the induction of a character of the unramified quadratic extension that is nontrivial on inertia
(Serre 1987, §1.2 (c), p. 181); the ramified quadratic characters of `G_{ℚ_2}` have conductor `2` for
`ℚ_2(√−1)`, `ℚ_2(√3)` and `3` for `ℚ_2(√±2)`, `ℚ_2(√±6)`; and every ramified character of order `3` of
`G_{ℚ_3}` has conductor `2` (same locator). *Needs:* §3.2, §3.3, §3.5; §2.3 (tame inertia and the
fundamental characters).

**Artin–Schreier characters.** Let `K` have characteristic `p > 0` in the setting, `u ∈ K` with
`v(u) = −m < 0`, `p ∤ m`, and `L = K(α)`, `α^p − α = u`. Prove that `L/K` is totally ramified and cyclic
of degree `p` with the single break `m` in both numberings (Serre 1961, n° 4.4, Lemme 4(a)–(b),
pp. 144–145, printed pagination);
that every nontrivial character `ψ` of `Gal(L/K)` has `Sw(ψ) = m`, `a(ψ) = m + 1`, and the different
exponent is `(p − 1)(m + 1)` (Deligne 1974, §8, Lemme (8.13), p. 306); that for `V` of the setting with
breaks `< m`, every break of `V ⊗ ψ` is `m`, `Sw(V ⊗ ψ) = m dim V` and `a(V ⊗ ψ) = (m + 1) dim V` (Ulmer,
§10, pp. 7–8); and that for `k` finite and `y ∈ k[[x]]` of valuation `d` with `p ∤ d`, the character of
`T^p − T = y⁻¹` has conductor exponent `d + 1`, so Deligne's sheaf `ℱ_j` has Swan conductor `d` at
infinity (Deligne 1974, (8.12)–(8.13)). *Needs:* §3.2, §3.4.

**Checks.**
- Over `F₂((t))`, `α² − α = t⁻¹` has break `1`, character conductor `2` and different exponent `2`.
- Over `F₃((t))`, `α³ − α = t⁻²` has break `2`, character conductor `3` and different exponent `6`.
- The condition `p ∤ m` is necessary: `α^p − α = t⁻ᵖ` becomes
  `β^p − β = t⁻¹` after `β = α − t⁻¹`, so its break is `1`, not `p`.

### Examples

A nontrivial tame quadratic character at an odd residue prime has Swan conductor `0` and Artin
conductor `1`. The special Weil–Deligne block `Sp(2)` has two-dimensional inertia invariants and
one-dimensional monodromy kernel, hence conductor `0 + 0 + (2 − 1) = 1`. The trivial representation
has both conductors `0`. Over `ℚ_2`, `χ_{−4}` and `χ_8` have conductors `2` and `3`, and the character
`χ_{−4}χ_8` of `ℚ_2(√−2)` has conductor `3`.

### Dependencies

Layers 1 and 2; `TauCetiRoadmap.LocalFieldsRamification` layers 2–4;
`TauCetiRoadmap.ClassFieldTheory` layers 7 and 9; `TauCetiRoadmap.NumberFieldArithmetic` layer 5;
`TauCetiRoadmap.RepresentationTheory/InductionRestriction` layers 5–7;
`TauCetiRoadmap.AlgebraicCurves` layer 8 (function-field ramification groups, for comparison).

## Layer 4: residual images and oddness

This layer classifies the images of rank-two residual representations: oddness at real places,
Borel and Cartan subgroups of `GL₂` over finite fields, Dickson's classification and Serre's
propositions over a prime field, dihedral and bad dihedral images, and the behaviour of images under
restriction to subfields. It is consumed by the large-image hypotheses of Layer 7 and by every
automorphy lifting statement in rank two.

Standing hypotheses: `F` is a number field, `k` a field of characteristic `p`, `k̄ = F̄_p` when `k` is
finite, and `π : GL₂(k̄) → PGL₂(k̄)` the projection. Proposed names live in the namespaces `GaloisRep`,
`GL2Cartan` and `GL2Subgroup`. DP = Dieulefait–Pacetti, arXiv:2108.07577v2; ACC+ = Allen, Calegari,
Caraiani, Gee, Helm, Le Hung, Newton, Scholze, Taylor, Thorne 2023; CN = Caraiani–Newton 2023;
KW = Khare–Wintenberger 2009.

### 4.1 Complex conjugation and oddness

**Complex conjugations.** Define `GaloisRep.IsComplexConjugation v c` for an infinite place `v` of `F`
and `c ∈ G_F`: for some embedding `ι : F̄ → ℂ` above `v`, `ι ∘ c = conj ∘ ι`. At a real place complex
conjugations exist, have order `2` and form one conjugacy class; `c_{ι∘σ} = σ⁻¹ c_ι σ`. A predicate is
used rather than a chosen element, so no statement depends on a choice of `ι`. Tau Ceti's
`complexConjugationAt` is relative to a finite extension `L/K`; the absolute predicate is defined
here (Serre 1987, (1.3.8), p. 182). *Needs:* Mathlib `NumberField.InfinitePlace`,
`starRingEnd`.

**Oddness.** Define *GaloisRep.IsTotallyOddChar* `μ` for a continuous `μ : G_F → A^×` (`μ(c) = −1` for
every complex conjugation at every real place); for a continuous rank-two `ρ` over `A`,
*GaloisRep.IsOddAt* `ρ v` (`det ρ(c) = −1` for every complex conjugation `c` at `v`), *GaloisRep.IsOdd* `ρ`
(odd at every real place) and *GaloisRep.IsNontrivialAt* `ρ v` (`ρ(c) ≠ 1`). On free carriers the
determinant is `LinearMap.det`. Its API is invariance under twisting by a character
`ψ` with `ψ(c)² = 1`, under coefficient extension and under restriction to a totally real
subextension, and the characterisation, for `2` invertible in a field `K`, of *IsOddAt* as `ρ(c)` being
conjugate to `diag(1, −1)`, equivalently `tr ρ(c) = 0` (Serre 1987, (1.3.8), p. 182). *Needs:* §1.1.

**Checks.**
- `χ̄_p ⊕ 1` over `F_p`, `p` odd, is odd; the trivial representation over `F₂` is odd, since
  `−1 = 1`.
- `χ_{−3} ⊕ χ_{−4}` over `F_5` has `ρ(c) = −1`, determinant `1`: not odd, although `ρ(c) ≠ 1`.
- `ρ` over `ℤ_ℓ` (`ℓ` odd) is odd iff its reduction is; over `ℚ(√2)` oddness at one real place is not
  enough; over `ℚ(i)` every representation is odd.

**Absolute irreducibility from oddness.** Prove that a nonscalar element of `ρ(Γ) ⊂ GL₂(k)` with split
characteristic polynomial makes every stable line over every extension `k`-rational, so irreducibility
and absolute irreducibility agree for such images; that an irreducible `ρ : G_F → GL₂(k)` odd at a real
place, `char k ≠ 2`, is absolutely irreducible (Serre 1987, 3.3, p. 198); and that for `char k = 2` the
same holds when `ρ(c_v) ≠ 1` at a real place (KW (I), Lemma 6.1, p. 10). *Needs:* §1.7.

*Lean:* `GaloisRep.isAbsolutelyIrreducible_of_isOddAt`.
### 4.2 Borel and Cartan subgroups

**Unipotent subgroups.** Prove that for `char k = p > 0` and a nontrivial finite `p`-subgroup `P` of
`GL(V)`, `dim V = 2`, every element of `P` is unipotent of exponent `p`, `P` is elementary abelian and
conjugate into the upper unitriangular group, fixes exactly one line `V^P` pointwise, and its
normaliser stabilises that line. Hence a subgroup with a nontrivial normal `p`-subgroup is reducible;
`GL₂(F_q)` has `q + 1` Sylow `p`-subgroups, the unipotent radicals of the Borel subgroups; a finite `G`
reducible over `k̄` with `p | |G|` has a normal Sylow `p`-subgroup fixing the stable line; and such a
subgroup of `PGL₂(k̄)` fixes a point of `P¹` (Serre 1972, §2.3, p. 280). *Needs:* Tau Ceti `GL2Borel`.

**Cartan subgroups.** For `k` finite with `q` elements and `dim V = 2`, define *GL2Cartan.split* `D₁ D₂`
(the stabiliser of two distinct lines), *GL2Cartan.nonsplit* `k'` (the units of a subfield `k'` of
`End_k(V)` with `q²` elements), *GL2Cartan.IsCartan*, *GL2Cartan.halfSplit* `D₁ D₂` (the elements of the
split Cartan acting trivially on `D₂`) and the normaliser `N(C)`. Its API is `[N(C) : C] = 2` for `C`
non-split, or split with `q ≥ 3`; for a split Cartan with `q ≥ 3`, membership in its normaliser means
preserving or swapping the two lines; `π(C)` cyclic of order `q ∓ 1` with dihedral normaliser
`π(N(C))`; conjugation; for `p ≠ 2`
and `tr² ≠ 4 det`, the unique Cartan containing an element, split iff the discriminant is a square;
the diagonal model; agreement of the non-split Cartan with Tau Ceti's `GL2NonSplitTorus`; and Serre's
Proposition 14, that over `F_ℓ` a Cartan (resp. split half-Cartan) inside `N(C)` equals `C` (resp. lies
in `C`), provided `ℓ ≥ 5` when it is split and `ℓ ≥ 3` otherwise (Serre 1972, §§2.1–2.2,
pp. 278–280). *Needs:* Tau Ceti `GL2NonSplitTorus`, `diagGL`, `centralizer_diagGL`,
`isConj_iff_of_notMem_range_scalar`.

**Checks.**
- A non-split Cartan has `q² − 1` elements and its normaliser `2(q² − 1)`.
- For `q = 2` the split Cartan is trivial and its normaliser is `GL₂(F₂) ≅ S₃`, of index `6`, not `2`.
  For the coordinate lines `D₁, D₂`, `g = [[0,1],[1,1]]` lies in the normaliser, but sends `D₁` to
  `D₂` and `D₂` to `⟨e₁ + e₂⟩`, so it does not preserve their pair.
- Outside `C` in `N(C)` (non-split, or split with `q ≥ 3`) elements have trace `0` and scalar square; a
  split and a non-split Cartan are never conjugate.

**Transvections.** Prove that for `ℓ` prime and `a, b ∈ F_ℓ^×`, `(1 a; 0 1)` and `(1 0; b 1)` generate
`SL₂(F_ℓ)` (false over `F₉`); hence a subgroup of `GL(V)` over `F_ℓ` with two elements of order `ℓ`
fixing distinct lines contains `SL(V)` (Serre 1972, Prop. 15, p. 280).

### 4.3 Sylow subgroups and `PSL₂`

**Dickson's Sylow analysis.** Prove that for `s = p^n` and `H ⊂ PSL₂(F_s)` with `p | |H|`, the Sylow
`p`-subgroups of `H` are the nontrivial `H ∩ U_μ` (`U_μ` the unipotent subgroup fixing `μ ∈ P¹(F_s)`),
of order `p^m` and number `1 + f p^m`; if `f = 0`, `H` fixes a point; if `f ≥ 1`, then `m | n` and, up
to `PGL₂(F_s)`-conjugacy, exactly one of: `p^m > 2`, `f = 1`, `H = PSL₂(F_{p^m})`; `p^m = 2` and `H`
dihedral of order `2(1 + 2f)`; `p` odd, `n/m` even, `f = 1`, `H = PGL₂(F_{p^m})`; `p = 3`, `m = 1`,
`n` even, `f = 3`, `H ≅ A_5` (Dickson 1901, §§251–254, pp. 272–279).

**Finite subgroups prime to the characteristic.** Prove that for `K` algebraically closed and a finite
`H ⊂ PGL₂(K)` of order `Ω` prime to `char K`, the class equation
`1 − Σ (d_i − 1)/(f_i d_i) = 1/Ω` over the `r ≤ 3` classes of maximal cyclic subgroups (orders `d_i`,
normaliser indices `f_i ∈ {1, 2}`) forces `H` to be cyclic, dihedral of order `2n` (`n ≥ 2`), `A_4`,
`S_4` or `A_5`; likewise in `PGL₂(k)` for `char k ∤ Ω` (Dickson 1901, §256, pp. 280–282).

**Normal subgroups.** Use Mathlib's `Matrix.SL2.commutator_eq_top` for perfectness of matrix
`SL₂(k)`: for `#k ≥ 4`, choose `a ∉ {0, 1, −1}`, so `a ≠ 0` and `a² ≠ 1`. Use
`Matrix.ProjectiveSpecialLinearGroup.rank_two_simple'` with the same witness for simplicity of
`PSL₂(k)` (Mathlib, `LinearAlgebra/Matrix/SpecialLinearGroup.lean`, §SL2, and
`LinearAlgebra/Projectivization/PSL/PSL2.lean`). Prove that for `k = F_q`, `q ≥ 4`: the normal
subgroups of `GL₂(k)` are central or contain `SL₂(k)`; those of `SL₂(k)` are `1`, `{±1} ∩ SL₂` and
`SL₂`; `PSL₂` is the only proper nontrivial normal subgroup of `PGL₂` for `q` odd, and `PGL₂ = PSL₂`
for `q` even;
`GL₂^ab ≅ k^×` and `PGL₂^ab ≅ k^×/k^{×2}`; and that the fields with `q ≤ 3` need separate statements.
*Needs:* Mathlib `Matrix.SL2.commutator_eq_top`,
`Matrix.ProjectiveSpecialLinearGroup.rank_two_simple'`; Tau Ceti
`Matrix.SpecialLinearGroup.not_isSolvable_fin_two`.

**Checks.**
- For `q = 4`, a generator of `F_4^×` has order `3` and supplies the perfectness witness;
  `GL₂(F_4)^ab ≅ F_4^×` and `PGL₂(F_4)^ab = 1`.
- For `q = 5`, the centre of `SL₂(F_5)` is `{±1}` and `PGL₂(F_5)^ab ≅ ℤ/2`.
- `SL₂(F_2) ≅ S_3` is not perfect; in `GL₂(F_3)` the quaternion subgroup `Q_8` is normal,
  noncentral and does not contain `SL₂(F_3)`, so the cardinality hypothesis is necessary.

**Automorphisms.** Prove that `Aut PSL₂(F_q) = Aut PGL₂(F_q) = PGL₂(F_q) ⋊ Gal(F_q/F_p)` for `q ≥ 4`;
that for `q = p ≥ 5` every automorphism of `PGL₂(F_p)` is inner, while conjugation by an element of
nonsquare determinant is an outer automorphism of `PSL₂(F_p)`; Goursat's lemma for subgroups of `S^r`
with `S` non-abelian simple, and `Aut(S^r) = Aut(S)^r ⋊ S_r`. The automorphism theorem is the case of
`PSL₂` of Steinberg's theorem that automorphisms of Chevalley groups over perfect fields are products
of inner, diagonal, graph and field automorphisms (Steinberg, *Lectures on Chevalley groups*, §10, Thm
30). Prove the application: for `ρ̄₁, ρ̄₂ : G_F → GL₂(k̄)` with standard projective images over
`F_{q_i}`, `q_i ≥ 4`, the projective kernel fields `M_i` have `M₁ ∩ M₂ = F`, or `M₁ ∩ M₂` quadratic
over `F` (both of `PGL₂`-type with `q_i` odd), or `M₁ = M₂` with `q₁ = q₂`, equal types, and `ρ̄₁`,
`ρ̄₂` projectively conjugate up to a Frobenius twist (Newton–Thorne 2026, proof of Lemma 5.7,
p. 41: the intersection is a common quotient of the two projective images, and `PSL₂(F_q)` is
simple and the unique proper nontrivial normal subgroup of `PGL₂(F_q)`). *Needs:* Mathlib
`Subgroup.goursat`.

**Checks.**
- In `F_5`, conjugation by `diag(2, 1)` normalises `SL₂` but is not conjugation by an element of `SL₂`,
  and is outer on `PSL₂(F_5)`: an inner realisation would give an element centralising both elementary
  transvections, hence scalar, forcing `2` to be a square mod `5`.
- `PSL₂(F_4) ≅ A_5` admits the nontrivial field automorphism, so not all automorphisms are inner when `q`
  is a proper prime power.
- `PSL₂(F_2) ≅ S_3` and `PSL₂(F_3) ≅ A_4` are not simple.

### 4.4 Dickson's classification

**Dickson's theorem.** Prove that a finite subgroup of `PGL₂(k̄)` fixes a point of `P¹`, or is
conjugate to `PSL₂(F_q)` or `PGL₂(F_q)`, or is dihedral of order `2n` with `p ∤ n`, `n ≥ 2`, or is
`A_4`, `S_4`, `A_5` (Darmon–Diamond–Taylor 2007, Thm 2.47, p. 81); that for `q ≥ 4` the subgroups
`PSL₂(F_q)` and `PGL₂(F_q)` are unique up to conjugacy, and `A_5` is conjugate to `PSL₂(F_4)` or
`PSL₂(F_5)` in characteristic `2` or `5` (Dickson 1901, §260, p. 286); that an absolutely irreducible
`G ⊂ GL₂(k)`, `k` finite, has noncyclic projective image fixing no point, which is dihedral,
exceptional, or conjugate to `PSL₂(F_0)` or `PGL₂(F_0)` with `F_0 = F_p(tr(g)²/det g : g ∈ G)` (KW
(I), §6, p. 10); that a finite `G ⊂ GL₂(k̄)` with `π(G)` conjugate to `PSL₂(F_0)` or `PGL₂(F_0)`,
`#F_0 ≥ 4`, has up to conjugation `[G, G] = SL₂(F_0)` and `G ⊂ k̄^× · GL₂(F_0)`, and conversely
`SL₂(F_1) ⊂ G` with `#F_1 ≥ 4` makes `π(G)` standard over some `F_0 ⊇ F_1` (ACC+, Lemma 7.1.6, p.
1090); that for `p = 2` and `G` finite irreducible in `GL₂(k̄)`, `π(G)` is dihedral of order `2n`, `n`
odd `≥ 3`, if `G` is solvable, and conjugate to `PSL₂(F_{2^r})`, `r ≥ 2`, otherwise (KW (I), Lemma
6.1, p. 10); that an absolutely irreducible `G ⊂ GL₂(k̄)` with an element of projective order `> 5` is
not exceptional, hence projectively dihedral if solvable and containing a conjugate of `SL₂(F_p)` if
contained in no torus normaliser (Clozel–Thorne 2017, Lemma 7.5, p. 48); and that proper subgroups of
`PSL₂(F_q)` have index `≥ q + 1` unless `q ∈ {2, 3, 5, 7, 9, 11}`, with least indices
`2, 3, 5, 7, 6, 11` (Dickson 1901, §262, p. 286). *Needs:* §4.2, §4.3; Tau Ceti
`conjClassesGLFinTwoEquiv`, `exists_isConj_normalForm`, `natCard_GL_fin_two`.

*Lean:* `GL2Subgroup.dickson_projectiveImage`.
### 4.5 Serre over a prime field

**Serre's propositions.** Let `V` be a plane over `F_ℓ` and `G ⊂ GL(V)`. Prove: if `ℓ | #G`, then
`G ⊇ SL(V)` or `G` lies in a Borel subgroup (Serre 1972, Prop. 15, p. 280); if `ℓ ∤ #G`, then `π(G)` is
cyclic (`G` in a Cartan), dihedral (`G` in a Cartan normaliser), `A_4`, `S_4` or `A_5` (the last only for
`ℓ ≡ ±1 mod 5`), only the first two occurring for `ℓ = 2, 3` (Serre 1972, Prop. 16, p. 281); a
semisimple `G` contains `SL(V)`, or lies in a Cartan subgroup or its normaliser, or has `π(G)` among
`A_4, S_4, A_5`, and a reducible semisimple `G` lies in a split Cartan; `G` containing a Cartan or a
split half-Cartan, with `ℓ ≠ 5` in the split cases, is `GL(V)` or lies in a Borel or a Cartan
normaliser (Serre 1972, Prop. 17, p. 282); and for `ℓ ≠ 2`, a normal subgroup of `GL(V)` containing a
Cartan or a split half-Cartan is `GL(V)` (Serre 1972, Prop. 18, p. 283). *Needs:* §§4.2–4.4.

**Checks.**
- `G = {(1 a; 0 1)}` has `ℓ | #G` and lies in a Borel without containing `SL(V)`; an irreducible `G` with
  `ℓ | #G` contains `SL(V)`.
- Over `F_7` the projective image `A_5` does not occur, since `60 ∤ |PGL₂(F_7)| = 336`; over `F_11` it
  does.
- Over `F_9`, `(1 1; 0 1)` and `(1 0; 1 1)` generate `SL₂(F_3)`, a proper subgroup of `SL₂(F_9)`: the
  generation statement is for prime fields only.

### 4.6 Dihedral and bad dihedral images

**Abelian projective image.** Prove that for `k` algebraically closed and `G ⊂ GL₂(k)` irreducible
with `π(G)` abelian, `char k ≠ 2`, `π(G) ≅ (ℤ/2)²`, and the nonscalar elements have trace `0` and
scalar square; in particular `π(G)` is never cyclic (DP, proof of Lemma 1.13, p. 8).

**Dihedral images are induced.** For `Γ` profinite, `k` an algebraically closed topological field and
`ρ : Γ → GL₂(k)` continuous with `π ∘ ρ` of open kernel and finite image, prove that `ρ` is
irreducible with dihedral projective image of order `2n`, `n ≥ 2`, iff `ρ ≅ Ind_Δ^Γ χ` for an open `Δ`
of index `2` and a continuous `χ : Δ → k^×` with `χ ≠ χ^σ`; then `ρ|_Δ ≅ χ ⊕ χ^σ`, `π(ρ(Δ))` is cyclic
of order `n = ord(χ/χ^σ)` with `char k ∤ n`, traces vanish off `Δ`, `det ρ = (χ ∘ Ver) · ε_Δ` (`ε_Δ`
trivial in characteristic `2`), and `Δ` is unique for `n ≥ 3`, with three choices for `n = 2`. For
`char k ≠ 2` an irreducible `ρ` is induced from `Δ` iff `ρ ⊗ ε_Δ ≅ ρ`. If an irreducible `ρ` is
reducible on an open normal `Γ'` with `Γ/Γ'` abelian, `ρ(Γ')` is diagonalisable with two
eigencharacters (`ρ` induced from the stabiliser of an eigenline) or scalar (`char k ≠ 2`,
`π(ρ(Γ)) ≅ (ℤ/2)²`). In characteristic `2`, `n` is odd `≥ 3` and a finite-order `det ρ` has odd order
(Serre 1972, §2.6, p. 282). *Needs:* §1.3 (the determinant of an induced representation).

**Bad dihedral representations.** For `p` odd define *GaloisRep.cyclotomicSubfield* `F p = F(ζ_p)` and
*GaloisRep.cyclotomicSquareSubfield* `F p`, the fixed field `F'` of the squares of `Gal(F(ζ_p)/F)`
(`F' = F` iff `[F(ζ_p) : F]` is odd), the restriction *GaloisRep.resFixingSubgroup* `E ρ` to the fixing
subgroup of an intermediate field, and *GaloisRep.IsBadDihedral* `p ρ̄` for a continuous
`ρ̄ : G_F → GL₂(k)`, `k` finite of characteristic `p` or `k̄`: `ρ̄` absolutely irreducible and
`ρ̄|_{G_{F'}}` not. Its API is `F' = ℚ(√p*)` for `F = ℚ`, `p* = (−1)^{(p−1)/2} p`; the same notion
with `F(ζ_p)` in place of `F'`; invariance under twists and coefficient extension; for `F = ℚ`,
inertia at `p` with projective image of order `2`; and the fact that a bad dihedral `ρ̄` is
induced from `G_{F'}` (DP, Def. 1.12, p. 7, and Lemma 1.14, pp. 8–9).

**Checks.**
- The representation of `G_ℚ` over `F₂₃` cutting out the splitting field of `x³ − x − 1` (image `S₃`) is
  bad dihedral at `23`, although its restriction to `G_{ℚ(√−23)}` is irreducible over `F₂₃`: the
  definition needs absolute irreducibility.
- `SL₂(F_p) ⊂ ρ̄(G_ℚ)` with `p ≥ 5` excludes bad dihedral; for `p = 3`, `ℚ(√−3) = ℚ(ζ_3)`.
- For `F = ℚ(√5)` and `p = 5`, `F(√p*) = F` but `F' = F(ζ_5)`, so adjoining `√p*` is the wrong
  definition; if `[F(ζ_p) : F]` is odd nothing is bad dihedral.
- For `p = 3`, `F = ℚ(√2, √3)` and `F' = F(ζ_3) = F(i)`, the completion at `v | 3` is
  `F_v = ℚ_3(√2, √3)`, whose unramified quadratic subfield contains `i`; hence `F'/F` splits at
  `v`. Here `√3` is a uniformizer, so `X⁸ − √3` is Eisenstein and gives a totally tamely ramified
  extension of degree `8`. Since `ζ_8 = (1 + i)/√2 ∈ F'`, the extension `L = F'(α)`, with
  `α⁸ = √3` and `α` positive real, has group
  `Gal(L/F) = ⟨r, c | r⁸ = c² = 1, crc = r⁻¹⟩`, with inertia `⟨r⟩` at `v`. For `z ∈ F_9^×`
  of order `8`, `ρ̄(r) = diag(z, z⁻¹)` and `ρ̄(c) = (0 1; 1 0)` give an odd bad dihedral
  representation whose projective inertia has order `4`: the eigenvalue ratio `z²` has order `4`.

**The bad dihedral criterion.** Prove that for `L/F` finite cyclic Galois, `F'` the fixed field of the
squares of `Gal(L/F)`, `k` algebraically closed and `ρ : G_F → GL₂(k)` with open kernel, `ρ|_{G_{F'}}`
is irreducible iff `ρ|_{G_L}` is; hence for `p` odd, `k` finite of characteristic `p` and `m ≥ 1`,
absolute irreducibility on `G_{F'}`, `G_{F(ζ_p)}` and `G_{F(ζ_{p^m})}` are equivalent. A bad dihedral
`ρ̄` has `ρ̄ ⊗ k̄ ≅ Ind_{G_{F'}} χ` with `χ ≠ χ^σ`, dihedral projective image of order `2n`, `p ∤ n`,
and `|ρ̄(G_F)|` prime to `p`; for `F = ℚ`, `π(ρ̄(I_p))` has order `2`, so writing
`(ρ̄|_{I_p}) ⊗ k̄ ≅ ψ₁ ⊕ ψ₂` (§2.3), `ψ₁/ψ₂ = ω^a` with `(p − 1) | 2a` in level `1`, and `ψ₁ = ω_2^b`,
`ψ₂ = ω_2^{pb}` with `(p + 1) | 2b` in level `2` (DP, Lemmas 1.13–1.14, pp. 8–9). *Needs:* §2.3
(fundamental characters).

### 4.7 Restriction and large image

**Images under restriction.** Prove that for `ρ : G_F → GL_n(A)` continuous with `A` discrete, kernel
field `K = (F^sep)^{ker ρ}` and `F'/F` finite separable, `ρ(G_{F'})` is the image of `Gal(K/K ∩ F')`,
so `ρ(G_{F'}) = ρ(G_F)` when `K ∩ F' = F`, and `ρ(G_{F'(ζ_p)}) = ρ(G_{F(ζ_p)})` when `F'` is linearly
disjoint from `K(μ_p)`, likewise for projective images with the projective kernel field; that a
perfect `H ⊂ ρ(G_F)` survives soluble towers `F'/F`; and that absolute irreducibility and the Dickson
type pass to `F'` in these cases, "not bad dihedral" only under disjointness from `K(μ_p)` (ACC+,
proof of Lemma 7.1.6, p. 1090).

**Restriction to the cyclotomic field.** Let `ρ̄ : G_F → GL₂(k)` be continuous, `k` finite of
characteristic `p`, `G = ρ̄(G_F)` and `H = ρ̄(G_{F(ζ_p)})`. Prove: (a) for `p` odd, absolute
irreducibility on `G_{F(ζ_{p^m})}`, `G_{F(ζ_p)}` and `G_{F'}` are equivalent; (b) if `ρ̄` is
irreducible and `ρ̄|_{G_{F(ζ_p)}}` is not absolutely irreducible, `G` lies in a Cartan normaliser; (c)
if moreover `k = F_p` and `det ρ̄ = χ̄_p`, up to conjugacy `G = C_s^+(3)` or `G ⊂ C_ns(3)` for
`p = 3`, and `G ⊂ C_ns^+(5)` for `p = 5` with `[F(ζ_5) : F] = 4`; (d) for `p ≥ 5`,
`SL₂(F_p) ⊂ G ⊂ GL₂(F_p)` and `det ρ̄` trivial on `G_{F(ζ_p)}` give `H = SL₂(F_p)`, and
`G ⊇ SL₂(F_q)`, `q ≥ 4`, gives `H ⊇ SL₂(F_q)`; (e) for `p > 3`, `ρ̄(G_{F̃}) ⊇ SL₂(F_p)` (`F̃` the
normal closure) and `F'/F` finite, linearly disjoint from `F̄^{ker ρ̄}` with `p` unramified in `F'/ℚ`,
`ζ_p` does not lie in the compositum of `F'` with the kernel field of the action on trace-zero
endomorphisms; (f) if `ζ_5 ∉ F`, `G ⊂ GL₂(F_5)`, `det ρ̄ = χ̄_5` and `π(H)` is conjugate to
`PSL₂(F_5)`, the projective kernel field does not contain `ζ_5`; (g) for `l ≥ 3`, a normal
`Δ ⊴ GL₂(F_l)` with `det Δ = F_l^×` is `GL₂(F_l)`; (h) for `p > 2` and `ρ̄|_{G_{F(ζ_p)}}` absolutely
irreducible, the `G_F`-invariants of the trace-zero endomorphisms of `V`, and of their twist by
`χ̄_p`, vanish (CN, Lemmas 6.1.4 and 7.1.1, pp. 88–92; ACC+, Lemmas 7.1.6 and 7.1.8, p. 1090; KW (II),
Lemma 4.3, p. 40). *Needs:* §§4.2–4.6.

**Persistence of large image.** Prove that for `p ≥ 5` and a finite `G ⊂ GL₂(k̄)` containing a
conjugate of `SL₂(F_{p^a})` with `p^a ≥ 5`, every subgroup of index `< 2p` contains that conjugate
when `a ≥ 2`; that a perfect `H ⊂ ρ̄(G_F)` persists under soluble towers; and that a continuous
`ρ̄ : G_ℚ → GL₂(k̄)` unramified outside `p`, with `ρ̄|_{G_{ℚ_p}}` absolutely irreducible and
`ρ̄|_{I_p} ≅ ω_2^a ⊕ ω_2^{pa}`, `gcd(a, p + 1) = 1`, has image containing a conjugate of `SL₂(F_p)`
(Dickson 1901, §262, through *index_ge_of_ne_top_PSL2* and `Matrix.SL2.commutator_eq_top` for
the index bound; Newton–Thorne 2026, Lemma 2.3(3), p. 11, states persistence for
`a ≥ a₀(p) ≥ 3`; Boxer–Calegari–Gee 2025, Thm 3.1, p. 516, for the local-image criterion).

**Checks.**
- For `p = 5`, `a = 2`, proper subgroups of `PSL₂(F₂₅)` have index at least `26 > 2p`;
  persistence applies already at `a = 2`.
- For `p = 5`, `a = 1`, the inverse image of `A₄ ⊂ PSL₂(F₅) ≅ A₅` in `SL₂(F₅)` has
  index `5 < 2p` and does not contain `SL₂(F₅)`: `a ≥ 2` cannot be omitted.
- A perfect subgroup survives restriction through a quadratic extension, whereas a quadratic
  character becomes trivial over its kernel field; persistence through soluble towers needs
  perfectness.

**Characteristic two.** Let `F` be finite of characteristic `2`, `F_0 ⊂ F` with `|F_0| = 2^r`,
`r ≥ 2`, `G_0 = SL₂(F_0)` acting on `Ad = M₂(F)` by conjugation, `Z = F · 1` and `Ad⁰` the trace-zero
matrices. Prove that a continuous absolutely irreducible `ρ̄ : G_K → GL₂(F)` with non-solvable image,
`K` a number field, has `π(ρ̄(G_K))` conjugate to `PGL₂(F_0) = PSL₂(F_0) ≅ SL₂(F_0)` for such an
`F_0`; that `H⁰(G_0, Ad) = H⁰(G_0, Ad⁰) = Z`, `H⁰(G_0, Ad/Z) = H⁰(G_0, (Ad⁰)^*) = 0 = H¹(G_0, Ad)`;
that the `G_0`-submodules of `Ad` are `0, Z, Ad⁰, Ad`; that one-dimensional `F[G_0]`-modules are
trivial; and that `Ad⁰/Z` is the Frobenius twist of the natural module (KW (II), Lemma 4.3, p. 40).
*Needs:* Mathlib `groupCohomology`.

### Examples

Over `F_5`, conjugation by `diag(2, 1)` is inner on `PGL₂` and outer on `PSL₂`. The split case of
Proposition 17 needs `ℓ ≠ 5`: `PGL₂(F_5) ≅ S_5`, the image of a split Cartan is cyclic of order `4`
and lies in a subgroup `S_4`, and the preimage of that `S_4` contains the split Cartan but is not
`GL₂(F_5)`, fixes no line (the octahedral group is transitive on `P¹(F_5)`), and lies in no Cartan
normaliser (whose projective images have order `8` or `12`). At `q = 2, 3`, `PSL₂(F_q)` is not simple.
The `S₃`-representation over `F₂₃` of `x³ − x − 1` is the basic bad dihedral example, and
`χ_{−3} ⊕ χ_{−4}` over `F_5` the basic even representation with `ρ(c) ≠ 1`.

### Dependencies

Layers 1 and 2; Mathlib's matrix groups and `groupCohomology`; Tau Ceti's `GL₂` toolkit.

## Layer 5: recognition by Frobenius polynomials

Frobenius elements are dense in `G_K`, so a continuous representation is determined up to
semisimplification by its Frobenius characteristic polynomials on a set of places of density one.
This layer proves that, with its rank-two and finite-field variants, and supplies the descent to the
field of traces with its Brauer-class obstruction, Haar-measure forms of the density theorem,
Carayol's lemma, the Frobenius identities used for `GSp₄`, potentially abelian representations and
recognition for representations of function fields over finite fields.

Standing hypotheses: `K` is a number field, `Frob_w` an arithmetic Frobenius lift at a place `w | v`
(all `w | v` allowed), density is Dirichlet density unless natural density is named, and `ρ^ss` is the
semisimplification of §1.7. Proposed names live in `GaloisRep`. BLGGT = Barnet-Lamb–Gee–Geraghty–Taylor
2014; Chenevier = Chenevier, arXiv:0809.0415v2.

### 5.1 Density of Frobenius elements

**Frobenius sets.** Define `GaloisRep.frobeniusSet Pl`, the set of arithmetic Frobenius lifts at the
maximal ideals of `O` (§2.1) above the places in a set `Pl` of finite places. Prove that for `Pl` of
Dirichlet density one, an open normal `U ≤ G_K` and `g ∈ G_K`, the places `v ∈ Pl` unramified in
`K̄^U` such that some `w | v` has every Frobenius lift in `gU` have Dirichlet density
`#C/[G_K : U] > 0`, `C` the conjugacy class of `gU` (Serre 1981, §2.1, Théorème 1, p. 131;
Darmon–Diamond–Taylor 2007, Thm 2.3, p. 52). Prove that `frobeniusSet Pl` is dense in `G_K`
(Deligne–Serre 1974, 6.12, p. 523); that if a continuous `φ : G_K → H` to a Hausdorff group kills `I_w`
for every `w` above some `v ∈ Pl`, the well-defined elements `φ(Frob_w)` are dense in the compact group
`φ(G_K)`, and two continuous maps on `φ(G_K)` to a Hausdorff space agreeing on them agree; that for `H`
finite discrete, `S` the ramification set of `φ` and `T` finite, every `h ∈ φ(G_K)` is `φ(Frob_w)` for
`v ∉ S ∪ T` in a set of Dirichlet density `#(class of h)/#φ(G_K) > 0`, hence infinite; and that a
property of `φ(Frob_w)` for all `w` above all `v` outside a finite set holds on `φ(G_K)` (Deligne–Serre
1974, 6.12, p. 523; Serre 1981, §2.1, Théorème 1, p. 131). *Needs:* `TauCetiRoadmap.Chebotarev` layer
10 (`hasDirichletDensity_frobeniusPrimeSet`); `TauCetiRoadmap.ArithmeticDirichletSeries` layer 7;
Mathlib `NumberField.Set.HasDirichletDensity`, `ConjClasses`; Tau Ceti
`NumberField.Chebotarev.frobeniusPrimeSet`, `NumberField.isArithFrobAt_eq_of_isUnramifiedAt`; §2.1.

**Checks.**
- For `φ` the cyclotomic character mod `N`, the places with `φ(Frob_p) = a` have density `1/φ(N)`
  (Dirichlet's theorem), each class of `(ℤ/N)^×` being a conjugacy class of size `1`.
- For `Pl` the primes of density one omitting a finite set, `frobeniusSet Pl` is dense, while
  the Frobenius lifts above finitely many primes are not.
- Agreement of two continuous characters on `frobeniusSet Pl` forces equality; for abstract characters
  it does not (§5.3, the third check).

### 5.2 Prescribed quadratic residue symbols

**Multiquadratic fields and Legendre symbols.** Prove that for nonzero integers `d₁, …, d_r`, signs
`ε_i ∈ {±1}` and `M = ℚ(√d₁, …, √d_r)`, an automorphism `σ` of `M/ℚ` with `σ(√d_i) = ε_i √d_i` for all
`i` exists iff `∏_{i∈J} ε_i = 1` for every `J` with `∏_{i∈J} d_i` a square, and that `[M : ℚ]` is the
order of the subgroup of `ℚ^×/ℚ^{×2}` generated by the `d_i`. Prove that, with the same data, the
following are equivalent: infinitely many odd primes `p ∤ d₁ ⋯ d_r` have `(d_i/p) = ε_i` for all `i`;
that set has Dirichlet density `2^{−m} > 0`, `2^m = [M : ℚ]`; the sign condition. In particular two
non-squares (even with square product) are simultaneously nonresidues at infinitely many primes, and
three non-squares with square product never are (Darmon–Diamond–Taylor 2007, Thm 2.3, p. 52, and the
remark after Thm 2.4). *Needs:* §5.1; Mathlib `legendreSym`, `jacobiSym`; Tau Ceti
`Multiquadratic.galoisGroupEquiv`, `NumberField.exists_isArithFrobAt_multiquadratic`,
`NumberField.isArithFrobAt_apply_sqrt`.

**Checks.**
- `2`, `3` and `6` are never simultaneously nonresidues mod `p > 7`.
- `2` and `8` (square product) are simultaneously nonresidues at every `p ≡ ±3 mod 8`.
- For `r = 0` the condition is empty and every odd prime qualifies.

### 5.3 Recognition on a dense subset

Here `Γ` is profinite, `E₁, E₂` topological fields with continuous embeddings into a common Hausdorff
topological field `E`, `ρ_i : Γ → GL(V_i)` continuous `n`-dimensional over `E_i`, and
`W_i = V_i ⊗_{E_i} E`.

**Recognition.** Prove that `det(X − ρ₁(γ)) = det(X − ρ₂(γ))` in `E[X]` for all `γ` in a dense `D ⊂ Γ`
gives `W₁^ss ≅ W₂^ss`, and `W₁ ≅ W₂` when both are semisimple; that for `Γ = G_K`, if both are
unramified at every `v` of a set of density one and their Frobenius polynomials agree there,
`W₁^ss ≅ W₂^ss`, with no finiteness of the ramification sets assumed; and that if `n!` is invertible
in `E` and `tr ρ₁ = tr ρ₂` on a dense `D`, `W₁^ss ≅ W₂^ss` (Darmon–Diamond–Taylor 2007, Prop. 2.6 with
(b), pp. 53–54; Deligne–Serre 1974, Lemme 3.2 with proof and footnote (1), p. 513; Chenevier, Ex.
2.31, p. 38). *Needs:* §1.2, §1.7, §1.8; §2.2; §5.1.
*Lean:* `GaloisRep.iso_of_frobenius_charpoly_eq` (the semisimple Frobenius statement
over two coefficient fields in a common Hausdorff field).

**Checks.**
- For `Γ = ℤ/3`, `E = F₄`, `n = 2` (`2! = 0`), `1 ⊕ 1` and `χ ⊕ χ` with `χ` faithful have trace `0`
  everywhere but polynomials `(X − 1)²` and `(X − ω)²`: the trace statement needs `n!` invertible.
- For `n = 0` both sides are zero.
- `Γ = ∏_{i∈ℕ} ℤ/2`, `D` the dense finite-support subgroup: a nonzero functional on `Γ/D` gives an
  abstract character `Γ → F₃^×` trivial on `D` and `−1` at the constant-one sequence, so recognition
  needs continuity.

### 5.4 Rank two

**Trace and determinant.** For `A` commutative, `Γ` a group and `ρ : Γ → GL₂(A)`, with `T = tr ∘ ρ`
and `δ = det ∘ ρ`, prove that `δ` is multiplicative, `T(1) = 2`, `T(gh) = T(hg)` and
`δ(g) T(g⁻¹h) − T(g) T(h) + T(gh) = 0`; that `(T, δ)` corresponds to the determinant law `det ∘ ρ` on
`A[Γ]` under the bijection between two-dimensional determinants and such pairs; and that for two
rank-two representations equality of all characteristic polynomials, of `(T, δ)` and of the
determinant laws are equivalent. Witness: for `g = h = diag(a, b)` the identity reads
`2ab − (a + b)² + (a² + b²) = 0`; with `T(gh⁻¹)` in place of `T(g⁻¹h)` it fails for `g = diag(2, 3)`,
`h = 1` over `ℚ`: `6 · (1/2 + 1/3) − 5 · 2 + 5 = 0` but `6 · 5 − 5 · 2 + 5 = 25` (Chenevier, Lemma
1.9, p. 11). Prove that if `A` is Hausdorff and two continuous rank-two representations have equal
trace and determinant on a dense subset, their characteristic polynomials and determinant laws agree
everywhere; when `A` is a field their semisimplifications are isomorphic; and for `Γ = G_K` comparison
at the Frobenius elements of an unramified set of density one suffices, with no invertibility of `2`
(Dieulefait–Pacetti, arXiv:2108.07577v2, Remark 4, p. 7). *Needs:* Mathlib `Matrix.trace_mul_comm`,
`Matrix.aeval_self_charpoly`, `Matrix.charpoly_fin_two`; IntegralHeckeAndGaloisDeterminants Layer 0
(two-dimensional determinants on a group); §5.1.

**Checks.**
- The numerical witness above.
- `ρ = 1 ⊕ 1` gives `T = 2`, `δ = 1`, and the identity reads `2 − 4 + 2 = 0`.
- Over `F₂`, `1 ⊕ 1` and the unipotent `(1 1; 0 1)` of `ℤ/2` have equal `T` and `δ` and are not
  isomorphic, only their semisimplifications are.

### 5.5 Image algebra and Brauer class

Let `k` be a field with algebraic closure `k̄`, `Γ` a group and `ρ : Γ → GL_n(k̄)` absolutely irreducible
(§1.7), so `n ≥ 1`; no condition on the characteristic.

**Automorphisms of matrix algebras over a local ring.** Prove that for `R` commutative local and
`d ≥ 0`, every unital `R`-algebra endomorphism of `M_d(R)` is `x ↦ g x g⁻¹` for `g ∈ GL_d(R)` unique
up to `R^×`, hence an automorphism. For `d > 0`, reduce the endomorphism modulo the maximal ideal.
It is a unital endomorphism of the simple finite-dimensional residue-field matrix algebra, hence
injective and bijective. Its determinant as an `R`-linear map is nonzero modulo the maximal
ideal and therefore a unit; the original map is an algebra automorphism. Apply
IntegralHeckeAndGaloisDeterminants §1.3 / *Inner conjugacy of local matrix algebras* for the
conjugator and use the scalar centralizer for uniqueness. For `d = 0`, both the matrix algebra
and its general linear group have a single element. Locality is necessary: over
`ℤ[√−5]` with `I = (2, 1 + √−5)`, `I ⊕ I ≅ R²` gives a non-inner automorphism of `M₂(R)` (Chenevier,
proof of Thm 2.22(i), p. 34; the supplied inner-conjugacy theorem also cites Allen–Newton–Thorne,
proof of Thm 2.4, p. 5). *Needs:* that supplier theorem; simplicity of matrix algebras over a
field, determinant reduction and Mathlib `Matrix.isUnit_iff_isUnit_det`,
`Matrix.mem_range_scalar_of_commute_single`.

**Checks.**
- For `d = 0`, the sole endomorphism is conjugation by the sole element of `GL₀(R)`.
- For `d = 1`, scalar compatibility forces the endomorphism to be the identity.
- Over `ℤ₃`, conjugation by `(1 1; 0 1)` sends `E₀₀` to `(1 −1; 0 0)`; its residue map
  is bijective and its determinant on the four-dimensional matrix module is a unit.

**The image algebra.** Define `GaloisRep.traceField ρ = k(tr ρ(γ) : γ ∈ Γ) ⊂ k̄`,
`GaloisRep.imageAlgebra ρ = B(ρ)`, the `k(ρ)`-subalgebra of `M_n(k̄)` generated by `ρ(Γ)`, the Brauer
class `β(ρ) ∈ Br(k(ρ))` of `B(ρ)` (intended signature *brauerClass* `ρ : BrauerGroup (traceField ρ)`),
and *GaloisRep.schurIndex* `ρ = s(ρ)`, Tau Ceti's `Algebra.index` of `B(ρ)` over `k(ρ)`. Prove that
`B(ρ)` is central simple of dimension `n²` over `k(ρ)` with `k̄ ⊗_{k(ρ)} B(ρ) ≅ M_n(k̄)` by
multiplication; that `ρ ≅ ρ'` gives equal `k(ρ)` and `β(ρ)`; that `β(ρ) = 1` iff `B(ρ) ≅ M_n(k(ρ))`
iff `ρ` is conjugate into `GL_n(k(ρ))`; that for `k(ρ) ⊂ k' ⊂ k̄`, `β(ρ)` maps to `[k' ⊗ B(ρ)]` and
`ρ` is realisable over `k'` iff `k'` splits `B(ρ)`; that a finite `k(ρ)` forces `β(ρ) = 1`; that if
`k(ρ) = k` and `D` is the determinant of `ρ` descended to `k`, `B(ρ) ≅ k[Γ]/ker D`; that
`det(X − b) ∈ k(ρ)[X]` for `b ∈ B(ρ)` (the reduced characteristic polynomial), so the `det(X − ρ(γ))`
generate `k(ρ)`; that `B(ρ) ≅ M_a(Δ)` with `Δ` a division algebra of dimension `s(ρ)²` and
`n = a s(ρ)` in every such presentation; that `s(ρ) | n`; and that `s(ρ) = 1` iff `β(ρ) = 1` (BLGGT,
proof of Lemma A.1.5, p. 85; Chenevier, Def.-Prop. 2.18(iii), p. 32; Deligne–Serre 1974, proof of
Lemme 6.13, p. 523). *Needs:* Mathlib `BrauerGroup`; Tau Ceti `BrauerGroup.mk`,
`BrauerGroup.baseChange`, `BrauerGroup.mk_eq_one_iff_isSplittingField`, `CSA.of`, `Algebra.index`,
`Algebra.index_dvd_deg`, `Algebra.isSplittingField_self_iff_index_eq_one`,
`IsSimpleRing.exists_algEquiv_matrix_centralDivisionRing`, `subsingleton_brauerGroup_of_finite`;
IntegralHeckeAndGaloisDeterminants Layer 0 (determinants); the automorphisms of matrix algebras above.

*Lean:* `GaloisRep.imageAlgebra_isCentralSimple`.

**Checks.**
- For the two-dimensional irreducible representation of `Q₈` over `ℂ` and `k = ℝ`, `k(ρ) = ℝ`,
  `B(ρ) ≅ ℍ` and `s(ρ) = 2`; a definition trivialising `β` for real traces fails.
- For a faithful character `χ` of `ℤ/3` and `k = ℚ`, the `ℚ`-span of the image has dimension `2` and is
  not central over `ℚ`, while `B(χ)` over `k(χ) = ℚ(ζ₃)` has dimension `1`.
- For `k = F_q` and `ρ` with finite image, `k(ρ)` is finite and `β(ρ) = 1` (Tau Ceti's
  `subsingleton_brauerGroup_of_finite`); for the `Q₈` representation, `s(ρ) = 2` over `ℚ` and `ℚ_2` and
  `s(ρ) = 1` over `ℚ_ℓ`, `ℓ` odd, since `(−1, −1)` ramifies exactly at `2` and `∞` (Tau Ceti's
  `Quaternion.mk_ne_one`).

**Independence of characters.** Prove that for pairwise nonisomorphic finite-dimensional absolutely
irreducible representations `ρ_1, …, ρ_r` of a group `Γ` over a field `k`, `k[Γ] → ∏ End_k(V_i)` is
surjective (Jacobson density); the traces `tr ρ_i` are linearly independent; equal traces give
isomorphic absolutely irreducible representations of equal dimension, in any characteristic; and for
`σ : k' → k` and `ρ` absolutely irreducible over `k'`, `ρ ⊗_σ k ≅ ρ ⊗ k` iff `σ` fixes the traces
(Chenevier, Def.-Prop. 2.18, last sentence, p. 32). *Needs:* Mathlib `jacobson_density`.

### 5.6 The descent obstruction

**Simple modules over a perfect field.** Let `k` be perfect, `W` a finite-dimensional simple
`k[Γ]`-module with image algebra `B = M_a(Δ)`, `Z` the centre of `Δ`, `[Δ : Z] = s²` and `m = as`.
Prove that `W ⊗ k̄ ≅ ⊕_{τ : Z → k̄} ρ_τ^{⊕s}` with the `ρ_τ` pairwise nonisomorphic absolutely
irreducible of dimension `m`, so `dim_k W = m s [Z : k]`; that `ρ_τ` has trace field `τ(Z)`, image
algebra `B ⊗_{Z,τ} τ(Z)` and Schur index `s`; and that an absolutely irreducible `ρ` over `k̄` with
trace field finite over `k` lies in the scalar extension of a unique simple `k[Γ]`-module, simple
modules corresponding to `Gal(k̄/k)`-orbits of such `ρ` (Chenevier, Thm 2.16, p. 31; BLGGT, proof of
Lemma A.1.5, p. 85). *Needs:* §5.5; `TauCetiRoadmap.RepresentationTheory/SemisimpleAlgebras` layer 2.

**Forms.** Let `ρ` be finite-dimensional semisimple over `k̄` with constituents of trace fields finite
over `k`. Prove that all `det(X − ρ(γ))` lie in `k[X]` iff `Gal(k̄/k)` preserves the multiset of
constituents; that if it does, with `Z_O`, `s_O`, `m_O` the trace field, Schur index and common
multiplicity of an orbit `O`, `ρ` has a `k`-form iff `s_O | m_O` for every `O`; that for `ρ`
absolutely irreducible with trace field `k` a `k`-form exists iff `β(ρ) = 1`, and an `L`-form for
`k ⊂ L ⊂ k̄` iff `β(ρ)` dies in `Br(L)`; and that a `k`-valued determinant `D` attached to `ρ` is
`∏_O N_{Z_O/k} ∘ Nrd_{S_O/Z_O}^{m_O}`, `S_O` the image algebra of `O`, so the determinant descends
without a `k`-form (BLGGT, proof of Lemma A.1.5, p. 85; Chenevier, Thm 2.16, p. 31, and Def. 2.19, p.
33; Deligne–Serre 1974, proof of Lemme 6.13, p. 523). *Needs:* §1.7, §1.8;
IntegralHeckeAndGaloisDeterminants Layer 1 (§1.2, semisimple reconstruction).

*Lean:* `GaloisRep.realizable_iff_imageAlgebra_split`.
### 5.7 Realisation over finite fields and trace fields

**Finite fields.** Prove that for finite fields `k ⊂ k'`, `Γ` profinite and `ρ : Γ → GL_n(k')` continuous
semisimple with all characteristic polynomials in `k[X]`, there is a continuous `k`-form with the same
kernel; and that for `ρ : G_K → GL_n(F̄_p)` continuous semisimple, the field generated over `F_p` by the
coefficients of the Frobenius polynomials at the unramified places is finite and `ρ` is the base change
of a continuous representation over it (Deligne–Serre 1974, Lemme 6.13 with proof, p. 523). *Needs:*
§5.6, §5.1, §1.4; Tau Ceti `subsingleton_brauerGroup_of_finite`.
*Lean:* `GaloisRep.realizable_of_charpoly_mem`.

**Distinct eigenvalues.** Let `M` have characteristic zero and `r : Γ → GL_n(M̄)` be semisimple with all
traces in `M`. Prove that the `M`-span `B` of `r(Γ)` is a finite-dimensional semisimple `M`-algebra with
`B ⊗_M M̄` carried isomorphically onto the `M̄`-span of `r(Γ)`; that if some `r(g₀)` has `n` distinct
eigenvalues in `M`, `r` descends to `M`; and that for `Γ` profinite, `M` a coefficient field and `r`
continuous, the `M`-form is continuous with a stable `O_M`-lattice (BLGGT, Lemma A.1.5, p. 85, and proof
of Lemma 5.3.1, p. 71). *Needs:* §5.6, §1.2, §1.6.

*Lean:* `GaloisRep.conj_into_of_trace_mem_of_distinct_eigenvalues`.
### 5.8 Haar measure on open matrix groups

**Haar measure.** Let `A` be a compact Hausdorff topological ring with additive Haar probability `μ⁺`.
Prove that multiplication by a unit on either side preserves `μ⁺`; that for `G ⊂ A^×` compact and open
in `A`, Tau Ceti's `haarProb G` is the normalised restriction of `μ⁺`; and that for `A = M_n(O_E)`
with residue field of `q` elements, `μ⁺(GL_n(O_E)) = ∏_{i=1}^n (1 − q^{−i})` (Serre 1981,
Introduction, p. 124). *Needs:* Mathlib `MeasureTheory.distribHaarChar_mul`,
`MeasureTheory.Subgroup.index_mul_measure`, `Matrix.card_GL_field`; Tau Ceti `haarProb`.

**Compact subgroup charts.** For finite `E/ℚ_ℓ` and compact `P ≤ GL_n(E)`, construct
its structure as a `ℚ_ℓ`-analytic group by the closed-subgroup theorem after scalar restriction.
Construct matrix logarithm and exponential on a sufficiently small open subgroup, a normal open
uniform pro-`ℓ` subgroup, and finitely many translated charts on `ℤ_ℓ^d`,
`d = dim_{ℚ_ℓ} Lie(P)`. Prove that the inclusion in `M_n(E)` is analytic and that Haar measure
in each chart is equivalent to additive product Haar measure with a nowhere-zero analytic density.
These charts precede the analytic null-locus theorem and supply §7.6's matrix logarithm input
(Dixon–du Sautoy–Mann–Segal, *Analytic Pro-p Groups*, second edition, Theorems 8.32 and 9.6;
Schneider, *p-adic Lie Groups*, §§18, 27, Theorem 27.1, pp. 192–195).
*Needs:* Mathlib finite-dimensional `ℚ_ℓ` spaces, convergent power series and Haar measure;
ProfiniteProPGroups Layer 3 for pro-`ℓ` Frattini theory. Construct the closed-subgroup and
logarithm/exponential comparison here.

**Checks.**
- `1 + ℓ^a M_n(O_E)` for sufficiently large `a` has chart dimension `[E:ℚ_ℓ] n²`.
- The embedded `ℤ_ℓ^× ≤ E^×` has dimension one over `ℚ_ℓ`; it need not be an `E`-analytic subgroup.
- A finite subgroup has dimension zero and singleton charts; Haar-null conclusions require a
  function nonzero on every such chart.

**Analytic zero sets.** For a restricted power series with coefficients in finite `E/ℚ_ℓ`
on `ℤ_ℓ^d`, not all coefficients zero, prove that its zero set has product Haar measure zero.
Use RestrictedPowerSeries §2.4 at radius one over `E`: Strassmann's bound gives finitely
many zeros in `O_E`, hence in `ℤ_ℓ ⊂ O_E`. In several variables write the series in the last
variable, choose a nonzero coefficient series, and apply induction to its zero set; off this
exceptional null set the fibre has finitely many zeros, so Fubini gives the result. Apply this on
each compact subgroup chart to analytic functions vanishing on no nonempty open subset
(Conrad, [*Infinite series in p-adic fields*](https://kconrad.math.uconn.edu/blurbs/gradnumthy/infseriespadic.pdf),
Theorem 10.1, p. 37, for Strassmann's theorem; Serre 1981, §6.4, proof of Proposition 13, p. 168).
*Needs:* RestrictedPowerSeries §2.4 (Strassmann's bound); compact subgroup charts above;
Mathlib convergent power series and product integration.

**Checks.**
- A nonzero constant has empty zero set, also in dimension zero.
- `f(x,y) = x` on `ℤ_ℓ²` has a full one-dimensional fibre at `x = 0`, but a null zero set.
- The constants `ℓ^m` have empty zero sets and converge uniformly to zero, whose zero set has
  measure one; nullity cannot be deduced by taking uniform limits of polynomial truncations.

**Null zero loci.** Prove that for `A` a compact Hausdorff second-countable topological domain without
isolated points and a nonzero polynomial in `N` variables over `A`, the zero set in `A^N` is closed
and null for the product Haar probability; and that for `G` open in `GL_n(O_E)` and a nonzero
polynomial over `E`, the zero set on `G` is Haar-null, so a polynomial vanishing on a subset of `G` of
positive measure is zero (Serre 1981, §6.4, proof of Prop. 13, p. 168). Prove the analytic form needed
for groups that are not open in `GL_n(O_E)`: for `G` a compact `ℓ`-adic Lie group (for instance a
compact open subgroup of `GSp_{2a}(E)` or of the `E`-points of any smooth closed subgroup of `GL_n`)
and a polynomial on `M_n(E)` whose restriction to `G` vanishes on no open subset, the zero set on `G`
is Haar-null; the proof reads the restriction in an exponential chart of an open uniform subgroup,
where it is a nonzero convergent power series on `ℤ_ℓ^d`, and applies the analytic zero-set theorem
above (Serre 1981, §6.4, p. 168). *Needs:* the compact subgroup charts and analytic zero sets above;
Mathlib `MeasureTheory.Measure.measure_prod_null`, `Polynomial.rootSet_finite`.

**Checks.**
- For `A = F_q` (every point isolated) `X^q − X` vanishes on all of `A`: the zero set has measure `1`.
- For `n = 0` the product is empty and `μ⁺(GL_0) = 1`; for `O_E = ℤ_p`, `n = 1`,
  `μ⁺(ℤ_p^×) = 1 − p^{−1}`.
- The zero polynomial has zero set `G` of measure `1`.

### 5.9 Haar-measure Chebotarev

**Densities from Haar measure.** Let `ρ : G_K → G` be a continuous surjection onto a profinite group,
unramified outside a finite `S`, `μ` Tau Ceti's `haarProb G`, and for a conjugation-stable `C ⊂ G` let
`Σ_C = {v ∉ S : ρ(Frob_v) ∈ C}`. Prove that for `C` clopen, `Σ_C` has Dirichlet and natural density
`μ(C)`; for `C` closed, the upper Dirichlet density of `Σ_C` is at most `μ(C)`, so positive upper density
forces `μ(C) > 0`; and if `μ(∂C) = 0`, `Σ_C` has Dirichlet density `μ(C)` (CG, App. §A.4, proof of
Lemma A.8, p. 890; Serre 1981, Introduction, p. 124, and §7.2, Théorème 15 with Cor. 1–2,
pp. 174–175). Prove that for `G` open in `GL_n(O_E)` (or a compact `ℓ`-adic Lie group, §5.8) and a
conjugation-invariant polynomial whose zero locus on `G` is Haar-null, the places with
`f(ρ(Frob_v)) = 0` have density zero. For open matrix groups it suffices that the polynomial is
nonzero; for a general compact `ℓ`-adic Lie group require that its restriction vanish on no
nonempty analytic open subset, as in §5.8. For a non-invariant polynomial with Haar-null zero locus, the closed null set `⋂_{h∈G} h{f = 0}h⁻¹` gives the same for
whole conjugacy classes (Serre 1981, Introduction, p. 124). *Needs:* §5.1, §5.8;
`TauCetiRoadmap.Chebotarev` layers 10 and 14; `TauCetiRoadmap.ArithmeticDirichletSeries` layer 7
(upper and lower densities); Mathlib `OpenNormalSubgroup`; Tau Ceti `haarProb_apply`.

**Checks.**
- A nontrivial quadratic character `η : G_ℚ → {±1}` and `f(x) = x − 1` give density `1/2`
  for the zero locus, although `f` is nonzero somewhere on the image; its Haar measure is `1/2`.
- On an open subgroup of `GL_n(O_E)`, the discriminant polynomial has a null zero locus and
  repeated Frobenius eigenvalues occur with density zero.
- A clopen conjugacy class in a finite quotient has density its cardinality divided by the
  group order, agreeing with Haar probability.

### 5.10 Carayol's lemma

**Strict conjugacy.** Let `R` be complete Noetherian local with maximal ideal `𝔪` and finite residue
field `k`, `Γ` profinite and `r, r' : Γ → GL_d(R)` continuous with the same absolutely irreducible
reduction `ρ̄`. Prove that equality of traces, or of characteristic polynomials, on a dense subset
gives `r' = g r g⁻¹` for `g` in the kernel of reduction `GL_d(R) → GL_d(k)`, unique up to a scalar in
`1 + 𝔪`; no invertibility of `d!` is assumed (Chenevier, Thm 2.22(i), p. 34, and Thm B, p. 4; CG,
§6.3, proof of Thm 6.13, p. 842). *Needs:* IntegralHeckeAndGaloisDeterminants Layer 1 (§1.1
Cayley–Hamilton algebras, §1.3 henselian lifting); §5.5; Mathlib `Matrix.aeval_self_charpoly`; §5.1.

*Lean:* `GaloisRep.carayol_conj_of_trace_eq`.

**Symplectic forms and gluing.** Write `GSp_{2a}(A) = {g ∈ GL_{2a}(A) : gᵀ J g = ν(g) J, ν(g) ∈ A^×}`
for the standard alternating `J = Matrix.J`. Prove that for `A` Noetherian local and `I`-adically
complete for an ideal `I ⊆ 𝔪`, `a ≥ 1`, every `ḡ ∈ GSp_{2a}(A/I)` lifts to `GSp_{2a}(A)` with any
prescribed unit multiplier lifting that of `ḡ`, and `ḡ ≡ 1 mod 𝔪/I` lifts to `g ≡ 1 mod 𝔪`, with `2`
not assumed invertible (the group scheme `GSp_{2a}` is smooth over `ℤ`). Prove that if `d = 2a`, the
characteristic polynomials agree on a dense subset and `r, r'` take values in `GSp_{2a}(R)` with the
same multiplier, the strict conjugator can be chosen in `ker(GSp_{2a}(R) → GSp_{2a}(k))`. Prove that
for decreasing open ideals `a_j ⊆ 𝔪` cofinal in the `𝔪`-adic topology, monic `P_γ ∈ R[X]` of degree
`d` on a dense subset and continuous lifts `r_j : Γ → GL_d(R/a_j)` of `ρ̄` with characteristic
polynomial `P_γ mod a_j` there, strict conjugations make the `r_j` compatible and they glue to a
continuous lift over `R`, unique up to strict conjugacy, symplectic with multiplier `ν` when every
`r_j` is (CG, §6.3, proof of Thm 6.13, p. 842). *Needs:* the strict conjugacy target; Mathlib
`Matrix.J`, `Matrix.symplecticGroup`, `IsLocalRing`.

### 5.11 Frobenius identities

**Characteristic polynomials annihilating a second representation.** Let `p` be prime,
`ρ : G_ℚ → GL₄(ℚ̄_p)` and `s : G_ℚ → GL_n(ℚ̄_p)` continuous, `n ≥ 1`, with
`P_ρ(Frob_l)(s(Frob_l)) = 0` for `l` in a set of density one where both are unramified,
`P_ρ(g) = det(X − ρ(g))`. Prove that `P_ρ(g)(s(g)) = 0` for every `g ∈ G_ℚ`, and on the Zariski
closure of `(ρ, s)(G_ℚ)` (BCGP25, §4.11, p. 109). The `GSp₄` semisimplicity
criteria built on this are §7.6. *Needs:* §5.1, §1.5.

**Checks.**
- For `s = ρ`, the identity is Cayley–Hamilton at every group element.
- For `ρ = 1^{⊕4}`, a nontrivial rank-two unipotent representation satisfies the identity:
  `(s(g) − 1)^4 = 0`. Annihilation alone does not imply semisimplicity of `s`.
- For `ρ = 1^{⊕4}` and a nontrivial scalar character `s = χ`, the polynomial evaluates to
  `(χ(g) − 1)^4`, nonzero for some `g`; it cannot vanish on a density-one Frobenius set.

### 5.12 Potentially abelian representations

**Structure.** Fix a field `F`, an algebraically closed `E` of characteristic zero, a continuous
irreducible `ρ : G_F → GL_n(E)` and a finite Galois `L/F` with `ρ(G_L)` abelian. Prove that
`ρ|_{G_L} ≅ ⊕_{i=1}^b χ_i^{⊕a}`, `ab = n`, the `χ_i` distinct continuous characters forming one
`Gal(L/F)`-orbit under `χ^σ(h) = χ(σ̃ h σ̃⁻¹)`; that with `K_i` the fixed field of the stabiliser of
`χ_i`, `[K_i : F] = b`, the `χ_i`-isotypic part `V_i` is an irreducible representation of `G_{K_i}`
and `ρ ≅ Ind_{G_{K_i}}^{G_F} V_i`; and that `b = 1` iff `ρ(G_L)` is scalar, which implies finite
projective image, while conversely finite projective image gives `b = 1` for `L` the fixed field of
its kernel (BCGP25, Lemma 10.2.3 with proof, pp. 212–213). *Needs:* §1.3,
§1.12, §1.4.

**Checks.**
- For a character, `a = b = 1` and the projective image is trivial.
- Inducing a character from a quadratic extension, with distinct conjugate characters on its
  Galois group, gives `a = 1`, `b = 2` and two conjugate isotypic lines.
- The faithful irreducible rank-two representation of `Q₈` over `ℂ` restricts to its centre
  as one character with multiplicity two: `a = 2`, `b = 1`, with finite projective image `C₂²`.

### 5.13 Function fields over finite fields

Let `𝔽_q` have characteristic `p`, `C` a smooth geometrically connected curve over `𝔽_q` with function
field `K_C`, and `U ⊂ C` a nonempty open. Continuous representations of `G_{K_C}` unramified at every
closed point of `U` play the role of lisse sheaves on `U`; they factor through the Galois group
`G_{K_C, U}` of the maximal extension of `K_C` unramified at the closed points of `U`, and
`G_{K_C, C}` is a quotient of `G_{K_C, U}`.

**Restricted-ramification function-field groups and Frobenius.** Construct `G_{K_C,U}` as the
quotient of `G_{K_C}` by the closed normal subgroup generated by the inertia groups at all closed
points of `U`. Define these decomposition and inertia groups using extensions of the closed-point
discrete valuations to `K_C^sep`; prove that they are closed, conjugate under changes of extension,
and agree in finite Galois quotients with the valuation-theoretic groups. Identify the quotient
with the Galois group of the maximal extension unramified on `U`, and with the étale fundamental
group of `U` by normalization of finite unramified extensions. Construct the arithmetic Frobenius
conjugacy class at `x` by lifting `a ↦ a^{q^{deg x}}` in its residue Galois group. Prove independence
modulo inertia, conjugacy independence, compatibility in finite quotients and the surjection
`G_{K_C,U} → G_{K_C,C}` (SGA 1, Exposé XIII, §2; Stacks, tags 03QR and 0BQM).
*Needs:* AlgebraicCurves Layers 0, 2 and 6 (function fields, valuations and normalization);
EtaleCohomologyFoundations §F.0.2 `finiteEtaleGaloisCategory` (finite étale covers and
fundamental groupoids), §F.0.A1 (decomposition and inertia groups of a cover); Mathlib infinite Galois correspondence.

**Checks.**
- A constant extension `𝔽_{q^a}K_C/K_C` is unramified everywhere and its Frobenius at `x`
  acts by `q^{deg x}`; replacing this by `q` loses the closed-point degree.
- For `C = ℙ¹`, `U = G_m` and `a` prime to `p`, `T ↦ T^a` is unramified on `U` but ramified
  at `0` and `∞`; it factors through `G_{K_C,U}` and need not factor through `G_{K_C,C}`.
- The identity extension has trivial Frobenius at every closed point.

For `x ∈ |U|`, set `deg x = [κ(x):𝔽_q]` and `N(x) = q^{deg x}`. A subset `S ⊂ |U|` has
closed-point Dirichlet density `δ` when
`lim_{s → 1⁺} (Σ_{x ∈ S} N(x)^{−s}) / log(1/(s − 1)) = δ`, with real `s > 1`.
The counting targets below prove convergence of these sums and density one for `|U|`;
thus normalization by the all-point sum gives the same density.

**Curve point-counting input.** For every smooth projective geometrically connected curve `D/𝔽_Q`
of genus `g` and every integer `r ≥ 1`, use SchemeAndStackFoundations §5.11's numerical theorem
to obtain `|#D(𝔽_{Q^r}) − (Q^r + 1)| ≤ 2g Q^{r/2}`. Smooth geometric connectedness implies
geometric integrality here; genus is preserved by finite-field extension. Apply the supplied
surface-intersection bound to `D × 𝔽_{Q^r}`, without a rational base point, a Jacobian realization
or an auxiliary coefficient prime. Removing a finite set `Z` of geometric points changes the
count by at most `#Z`, uniformly in `r`. This is the numerical input for the finite-cover counts
below (Milne, *Algebraic Geometry*, 2024, Chapter 11, Theorem 11.53, Corollary 11.54,
Example 11.55 and the Frobenius application, pp. 37–38).
*Needs:* SchemeAndStackFoundations §5.11, *The Weil bound via surfaces*; AlgebraicCurves Layer 12
(geometric and function-field genus comparison).

**Checks.**
- `D = ℙ¹` has `g = 0` and exactly `Q^r + 1` points.
- In genus one the bound is `2Q^{r/2}`; the Frobenius trace occurs with a minus sign.
- The bound requires geometric connectedness: `ℙ¹_{𝔽_{Q²}}` viewed over `𝔽_Q` has no
  `𝔽_Q`-points and has `2(Q² + 1)` points over `𝔽_{Q²}`.

**Chebotarev for function fields.** Let `Y → U` be a connected finite étale Galois cover with
finite group `H`, corresponding to a continuous surjection `φ : G_{K_C,U} → H`. Let its exact
constant field be `𝔽_{q^a}`, and write `H_geom = ker(H → Gal(𝔽_{q^a}/𝔽_q))`.
For a conjugacy class `B ⊂ H`, let `b ∈ ℤ/a` be its image, identifying arithmetic `q`-Frobenius
with `1`. For `n ≥ 1`, let `π_B(n)` count the degree-`n` closed points with `φ(Frob_x) ∈ B`.
Prove `π_B(n) = 0` if `n ≢ b mod a`, and
`π_B(n) = (#B/#H_geom) q^n/n + O_Y(q^{n/2}/n)` if `n ≡ b mod a`, with a constant independent of `n`.
Construct the Frobenius twists of the geometric components of the smooth projective completion
of `Y`, by finite-field descent, and identify their rational points with the corresponding
Frobenius fixed points. Apply the preceding curve bound to these twists; use orbit counting and
remove points defined over proper subfields to pass to closed points. This supplies the finite-cover
counting theorem, including covers with enlarged constants. Sum over the allowed degrees using
`Σ_{n ≥ 1, n ≡ b mod a} z^n/n = (1/a) log(1/(1 − z)) + O(1)` as `z → 1⁻`.
Deduce Dirichlet density `#B/#H > 0` (Serre, *Zeta and L functions*, 1965, Theorem 7;
Kisin–Zhou 2025, proof of Prop. 5.3.5, p. 54).
*Needs:* the preceding curve point-counting input and restricted-ramification groups;
SchemeAndStackFoundations Layer 1 (effective descent); EtaleCohomologyFoundations §F.0.2
(finite étale Galois categories); Mathlib real power series and finite-group orbit counting.

**Checks.**
- The trivial cover gives `π(n) = q^n/n + O_U(q^{n/2}/n)` and density one for `|U|`.
- For the constant cover `U × 𝔽_{q^a} → U`, a class `b` occurs only in degrees `n ≡ b mod a`
  and has Dirichlet density `1/a`; no geometric-connectedness hypothesis on `Y` is imposed.
- Deleting finitely many closed points changes the weighted sum by a bounded function near
  `s = 1` and leaves every Dirichlet density unchanged.

**Profinite Frobenius density.** Prove that the union of all arithmetic Frobenius conjugacy
classes at closed points of `U` is dense in `G_{K_C,U}`. For a nonempty open subset, choose a
coset of an open normal subgroup contained in it; the finite-cover theorem realizes the conjugacy
class of its image, and a conjugate of the resulting Frobenius lies in that coset
(Kisin–Zhou 2025, proof of Prop. 5.3.5, p. 54).
*Needs:* the finite-cover Chebotarev theorem above; §5.1's profinite finite-quotient argument.

**Checks.**
- The image meets every element of every finite quotient after allowing all conjugates.
- Restricting to degree-one closed points cannot give density in the constant quotient `ℤ/a`
  when `a > 1`.
- Deleting any finite set of closed points preserves profinite Frobenius density.

**Recognition.** Prove that for `ℓ ≠ p`, `E` a finite extension of `ℚ_ℓ` or `ℚ̄_ℓ`, and `V₁, V₂`
continuous rank-`n` representations of `G_{K_C, C}` over `E`, if at every closed point `x ∈ |U|`
`det(1 − Frob_x t | V₁) = det(1 − Frob_x t | V₂)` in `E[t]`, the same kind of Frobenius being used on
both sides, then `V₁^ss ≅ V₂^ss`, and `V₁ ≅ V₂` when both are semisimple (Kisin–Zhou 2025, proof of
Prop. 5.3.5, p. 54). *Needs:* the profinite Frobenius density target above; §5.3.

**Checks.**
- In rank one, equality at Frobenius gives equality of the two continuous characters.
- A nontrivial unipotent extension of the trivial character by itself, factoring through the
  constant quotient `ℤ_ℓ`, has the same Frobenius polynomials as `1 ⊕ 1` and the same
  semisimplification, but is not isomorphic to it.
- Arithmetic and geometric Frobenius give the same recognition criterion when both
  representations use the same choice; their individual polynomials need not agree.

### Examples

For `g = diag(2, 3)` and `h = 1` over `ℚ`, the rank-two trace identity gives `0` with the correct inverse
and `25` with the incorrect one. The dense finite-support subgroup of `∏_{i∈ℕ} ℤ/2` separates continuous
recognition from an abstract character trivial on that subgroup. The representation of `Q₈` is the
basic example of a representation with real traces not realisable over `ℝ`.

### Dependencies

Layers 1 and 2; `TauCetiRoadmap.Chebotarev` layers 10 and 14;
`TauCetiRoadmap.ArithmeticDirichletSeries` layer 7; RestrictedPowerSeries §2.4;
`TauCetiRoadmap.RepresentationTheory/SemisimpleAlgebras` layer 2; IntegralHeckeAndGaloisDeterminants
Layers 0 and 1; EtaleCohomologyFoundations §§F.0.2, F.0.A1; Tau Ceti's Brauer group,
central simple algebras and Haar probability.

## Layer 6: Tate modules of elliptic curves and abelian varieties

This layer produces the representations of Layer 1 attached to abelian varieties: the `ℓ`-adic Tate
module with its Weil pairing and determinant, its residual representation, the Tate-curve
representation, general local Euler factors, `λ`-adic Tate modules for real or complex multiplication,
compact-image conditions and Serre's wild bound.

Standing hypotheses: `K` is a field, `K̄ = AlgebraicClosure K ⊇ K^sep`, `G_K` its absolute Galois
group; `A` is an abelian variety over `K` of dimension `g` (Tau Ceti's
`AlgebraicGeometry.AbelianVariety K`); `ℓ` is a prime different from `char K`; `G_K` acts on `A(K̄)`
coordinatewise; torsion is taken over `K^sep`, never over `K`. Elliptic curves are Mathlib's
`WeierstrassCurve` with `IsElliptic`. Proposed names live in the namespace `TateModule`.

### 6.1 The Tate module

<a id="prime-to-residue-characteristic-torsion-specialization"></a>

**Reduction of torsion of order prime to the residue characteristic.** Let `K` be a complete
discretely valued field with perfect residue field `k`, let `E/K` have good reduction `Ẽ/k`, and
let `N ≥ 1` be invertible in `k`. Prove that all geometric `N`-torsion is defined over `K^ur` and
that reduction gives a `G_K`-equivariant isomorphism
`E[N](K^ur) ≃ Ẽ[N](k^sep)`, where `G_K` acts on the right through `G_k`. In particular the
reduction map into `Ẽ(k^sep)` is injective and inertia acts trivially. For `k` finite of order `q`,
arithmetic Frobenius corresponds to the `q`-power Frobenius endomorphism of `Ẽ`. The kernel of
reduction has no `N`-torsion. For each finite separable residue extension `k'/k`, use its finite
unramified lift `K'/K`, which is complete: Hensel lifting on the smooth model and invertibility
of `[N]` on the formal-group kernel give the unique torsion lift over `K'`; this point-level
lifting is part of the target, built on EllipticCurves Layer 4's reduction map and formal-group
kernel. Prove compatibility under finite unramified extension, with the
inclusions `E[N] → E[M]` for `N | M`, and with `[M/N] : E[M] → E[N]` when `M` is invertible in
`k`; then pass to the union `K^ur`. Injectivity after any finite complete extension containing
a geometric torsion point identifies all geometric torsion with these unramified lifts.
Reduction commutes with the decomposition-group action and hence with arithmetic Frobenius
(Silverman, *The Arithmetic of Elliptic Curves*, VII.3.1(b), p. 192, and VII.7.1, pp. 201–202).
*Needs:* EllipticCurves Layer 2 (geometric torsion), Layer 3 (finite-field Frobenius) and Layer 4
(reduction on points and the formal-group kernel); LocalFieldsRamification Layer 2 (finite
unramified extensions); §2.1 (decomposition groups).

**Checks.**
- For `y² = x³ + 1` over `ℚ₅` and `N = 7`, reduction identifies all `49` geometric torsion
  points; arithmetic Frobenius has polynomial `X² + 5` over `F₇`. Its determinant is `5`,
  whereas geometric Frobenius has determinant `5⁻¹ = 3`.
- For the same curve and `N = 5`, the characteristic-zero geometric torsion has `25` points
  and its supersingular reduction has only the identity as a geometric `5`-torsion point;
  injectivity fails when `N` is not invertible in the residue field.
- For `y² = x³ − x` over `ℚ₅` and `N = 2`, the points `(0,0)`, `(1,0)`, `(−1,0)` reduce to
  three distinct nonzero points fixed by arithmetic Frobenius, together with the identity.
- The algebraic maximal unramified extension of `ℚ₅` is not complete; every torsion lift in
  the construction lies in a finite complete unramified extension, and uniqueness makes its
  image in the union independent of that extension.

<a id="weierstrass-scheme-torsion-specialization-comparison"></a>

**Weierstrass and elliptic-scheme torsion specialization.** Under the preceding hypotheses,
choose an integral good-reduction Weierstrass equation for `E`, and let `𝓔/O_K` be its smooth
proper elliptic scheme. Use the point-group identifications of ModularCurves Layers 1C–1D and
the abelian-scheme identification of AbelianSchemesAndArithmeticModuli A1.6. For compatible
geometric generic and special points of `Spec O_K`, let `sp_N` be specialization of `𝓔[N]`
under the henselian finite-étale equivalence. Prove that the following square commutes, with
the left vertical map using the preceding identification of all geometric torsion over `K^ur`:

```text
E[N](K^ur)          -- red_N -->  Ẽ[N](k^sep)
  | ι_K,N                         | ι_k,N
  v                               v
𝓔_K[N](K^sep)      -- sp_N  -->  𝓔_k[N](k^sep)
```

Here `red_N` is the equation-level reduction map and the vertical arrows are the canonical
point-group identifications restricted to torsion. Identify `sp_N` with reduction of integral
sections of the finite étale group scheme `𝓔[N]`; the commutativity follows from the same
coordinate reduction on the Weierstrass model. Prove compatibility with the inclusions into
the full point groups, the inclusions of `N`-torsion into `M`-torsion for `N | M`, all maps
`[M/N] : E[M] → E[N]` for positive invertible `M`, finite unramified extension, and the
decomposition-group action. For finite `k`, this identifies arithmetic Frobenius with the
`q`-power endomorphism on both special-fibre point groups; it also identifies the inverse-limit
specializations on `T_ℓ` for `ℓ ≠ char k`
(Stacks, Lemma 15.13.2, [tag 09ZL](https://stacks.math.columbia.edu/tag/09ZL);
Silverman, VII.3.1(b), p. 192). *Needs:* the preceding torsion-specialization target;
SchemeAndStackFoundations §0.14, `henselian_finiteEtale_equivalence`;
ModularCurves Layers 1C–1D; AbelianSchemesAndArithmeticModuli A1.6 and A3.2.

**Checks.**
- For `N = 1`, all four torsion groups are trivial and both maps send the identity to the
  identity.
- For `y² = x³ − x` over `ℚ₅`, both reductions fix the four geometric `2`-torsion points;
  for every `P ∈ E[4]`, their level maps give `red_2([2]P) = [2]red_4(P)`.
- For `y² = x³ + 1` over `ℚ₅` and `N = 7`, both specialization maps intertwine arithmetic
  Frobenius of determinant `5 mod 7`; substituting geometric Frobenius gives determinant `3`.
- For the same curve and `N = 5`, `𝓔[5]` is not étale over `ℤ₅`; the finite-étale comparison
  does not apply to the collapse of geometric `5`-torsion under reduction.

**The Tate-module representation adapter.** For `ℓ ≠ char K`, use the geometric fibre over
`Spec K` of `AbelianTate A ℓ` (AbelianSchemesAndArithmeticModuli A4.1), identified there with
`TauCeti.TateModule ℓ (A(K^sep))`. Write *TateModule.tateModule* `A ℓ` for this supplied carrier and
package its supplied continuous action as
*TateModule.tateModuleRep* `A ℓ : ContinuousRep G_K ℤ_[ℓ] (`*tateModule* `A ℓ)`.
Prove that the limit topology is the `ℤ_ℓ`-module topology using `AbelianTate.rank` and
`AbelianTate.modPow`, so the action is jointly continuous by §1.1. Define its rational coefficient
extension `V_ℓA` through §1.2 and the adelic action on `T̂A = ∏_ℓ T_ℓA`. The rank `2g`, projections,
reduction, functoriality and geometric base change are supplied by A4.1; the adapter preserves these
maps and their actions (Milne 2008, Ch. I, Remark 7.3, p. 34). *Needs:*
AbelianSchemesAndArithmeticModuli A4.1; §§1.1–1.2; Tau Ceti `TateModule`.

**Checks.**
- For `y² = x³ − x` over `ℚ` and `ℓ = 5`, `T_5` has rank `2` and `T_5/5` has `25` elements, while the
  limit of the rational torsion `E[5^n](ℚ)` is `0`.
- `A = Spec K` (dimension `0`) gives `T_ℓA = 0`.
- `y² = x³ + 1` over `F̄_5` is supersingular, `E[5^n](F̄_5) = 0` and `T_5E = 0`: `ℓ ≠ char K` is
  needed (for ordinary curves the `p`-rank is `g`, not `2g`).

<a id="elliptic-residual-representation"></a>

**Basis-free elliptic residual representation.** For an elliptic Weierstrass curve `E/K`
and a prime `p`, define *TateModule.residualRep* `E p` on
`E[p](K̄) = AddSubgroup.torsionBy (E⁄K̄).toAffine.Point p` over `ZMod p`, by making Tau Ceti's
`torsionGaloisAction` linear via `AddMonoidHom.toZModLinearMap`. Use the unfolded group
`AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K`; transport its Krull topology along the defining
identification with `Field.absoluteGaloisGroup K` when packaging a `ContinuousRep`.
When `p` is invertible in `K`, prove dimension two, open kernel, and determinant equal to
Mathlib's `modularCyclotomicCharacter`, by Galois equivariance and nondegeneracy of the Weil pairing.
For `K` a number field and good `v ∤ p`, prove unramifiedness and
`tr(ρ̄(Frob_v)) = a_v(E) mod p`, where `a_v(E) = #k_v + 1 − #E_v(k_v)`; over `ℚ` this is
`a_ℓ mod p`. Use §6.1's reduction of torsion of order prime to the residue characteristic and
EllipticCurves Layer 3's finite-field Frobenius calculation. Give the scalar extension to `F̄_p`,
its matrix form in any basis, conjugation under change of basis, and basis-independent trace and determinant
(DDT, §2.2, pp. 55–57, especially Proposition 2.8(a) and Proposition 2.11(a);
Silverman, *The Arithmetic of Elliptic Curves*, III.6.4(b), III.8 and VII.3).
*Needs:* Tau Ceti `torsionGaloisAction`, `nonempty_basis_torsionBy`, `weilPairing_torsionGaloisAction`;
Mathlib `modularCyclotomicCharacter`; EllipticCurves Layers 2–3; §§1.2 and 2.1;
§6.1, *Reduction of torsion of order prime to the residue characteristic*.

**Checks.**
- For `y² = x³ − x` over `ℚ`, geometric `E[5]` has dimension two, even though its
  rational `5`-torsion is zero.
- For `y² = x³ + 1` at the good prime `5`, `#E(F₅) = 6`, so the trace on `E[7]` is `0`
  and the determinant of arithmetic Frobenius is `5` in `F₇`.
- A curve with a rational point of order `p` has a trivial residual line and quotient
  character `χ̄_p`; dimension two does not imply irreducibility.
- In characteristic `p`, a supersingular elliptic curve has no nonzero geometric
  `p`-torsion, so the invertibility hypothesis is essential.

**Residual representations of Tate modules.** Use `AbelianTate.modPow` to identify
`T_ℓA ⊗ F_ℓ ≅ A[ℓ](K^sep)` and prove
`(Λ/ℓΛ)^ss ≅ A[ℓ](K^sep)^ss` for every stable lattice `Λ ⊂ V_ℓA`; and that for `E` elliptic, `E[ℓ]` is
reducible iff `E` has a `K`-rational cyclic `ℓ`-isogeny, the stable lines being the kernels, with
character `ψ` on the line and `χ̄_ℓ ψ⁻¹` on the quotient (`ψ` trivial for `ℓ = 2`, not necessarily for
odd `ℓ`) (Silverman, *The Arithmetic of Elliptic Curves*, III.4.12 and Remark III.4.13.2, for the
isogeny with a given Galois-stable finite kernel; Darmon–Diamond–Taylor 2007, §2.2, Prop. 2.8(a),
p. 56, for the determinant). *Needs:* §1.9;
AbelianSchemesAndArithmeticModuli A3.3 and A4.1;
`TauCetiRoadmap.EllipticCurves` layers 1–2 (isogenies, Vélu quotients).

**Checks.**
- For a curve with a rational point of order `ℓ`, its residual representation has a trivial line.
- A rational cyclic `ℓ`-isogeny need not have a rational generator of its kernel when `ℓ` is odd.
- Changing the lattice preserves the residual semisimplification but can change the extension
  class, as in §1.9.

**The elliptic comparison.** Prove that a Weierstrass curve `W` with `IsElliptic` over `K` defines an
abelian variety `E_W` of dimension one with `E_W(L) ≅ (W⁄L).toAffine.Point` naturally in `L/K`
(the group law is given by morphisms; Silverman, *The Arithmetic of Elliptic Curves*, Ch. III,
Thm 3.6); that `T_ℓ(E_W)` is
isomorphic, as a topological `ℤ_ℓ[G_K]`-module, to Tau Ceti's
`TateModule ℓ (W⁄(AlgebraicClosure K)).toAffine.Point`, with
`W.tateModuleGaloisRepresentation (K := AlgebraicClosure K) ℓ`. Identify its acting group
`AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K` with Mathlib's `Field.absoluteGaloisGroup K` by its
definition. For every `n`, the inclusion `K^sep → K̄` identifies the `ℓ^n`-torsion point groups:
the supplied kernels are finite étale because `ℓ ≠ char K` (A3.2), and their geometric points
are unchanged by this extension (Stacks, Lemma 58.2.2, tag 03QR).
Prove compatibility with the transition maps and with the Galois restriction
`TauCeti.absoluteGaloisGroupRestrictEquiv`, giving the comparison with the separable-closure
carrier of `AbelianTate` in arbitrary characteristic. Through this same comparison, identify
isogeny point maps with `T_ℓ` of homomorphisms, and
`(W⁄(AlgebraicClosure K)).tateModuleWeilPairing` with the pairing of §6.2 for the principal
polarisation `P ↦ [(O) − (P)]`; the cyclotomic target is identified by the same comparison of roots
of unity. Prove that `TauCeti.det_tateModuleGaloisRepresentation` agrees with §6.2.
Prove for an isogeny `φ : W₁ → W₂` (Tau Ceti's `Isogeny`) that `T_ℓ[n] = n`,
`e₂(T_ℓφ x, T_ℓφ y) = deg φ · e₁(x, y)`, and for `W₁ = W₂`, `det T_ℓφ = Isogeny.degree φ` and
`tr T_ℓφ = 1 + deg φ − deg(1 − φ)` (Milne 2021, Ch. II, §6, Prop. 6.4, p. 71). *Needs:*
`TauCetiRoadmap.EllipticCurves` layers 1–3; Tau Ceti `Isogeny`, `Isogeny.frobeniusIsogeny`,
`oneSubFrobeniusIsogeny`, `degree_oneSubFrobeniusIsogeny_eq_pointCount`;
AbelianSchemesAndArithmeticModuli A3.2, A4.1 and A6.10–A6.11 for finite étale torsion, the
geometric realization and endomorphism trace and determinant.

**Checks.**
- For `y² = x³ − x` over `ℚ` and `ℓ = 5`, this comparison identifies two rank-two geometric
  modules; `TateModule 5 W.toAffine.Point` uses rational points and is zero, so cannot be its target.
- `[n]` on an elliptic curve has Tate trace `2n` and determinant `n²`.
- The Frobenius endomorphism has trace `q + 1 − #E(F_q)` and determinant `q`.
- The principal-polarization comparison gives target `ℤ_ℓ(1)` with cyclotomic action, not its dual.
- Over `K = F_p(t)` with `ℓ ≠ p`, every `ℓ^n`-torsion point is already over `K^sep`;
  passage to `K̄` preserves the Tate module and pairing even though the two fields differ.

**Functoriality of the arithmetic adapter.** Transport `AbelianTate.map` and
`AbelianTate.baseChange` through the adapter. The supplied product comparison is
`T_ℓ(A × B) ≅ T_ℓA ⊕ T_ℓB` (Tau Ceti's `AbelianVariety.prod`); the supplied isogeny theory gives
that an isogeny `φ` of degree `d` (Tau Ceti's `IsIsogeny`) gives `T_ℓφ`
injective with cokernel `(ker φ)(K^sep)[ℓ^∞]` of order the `ℓ`-part of `d`, and `ψφ = [m]` gives
`T_ℓψ ∘ T_ℓφ = m`; that base change to `L/K` restricts `ρ_{A,ℓ}` to `G_L`; and that an isomorphism
`τ : K ≅ K'` transports `ρ_{A,ℓ}` to `ρ_{A^τ,ℓ}` (Milne 2008, Ch. I, p. 52). *Needs:* AbelianSchemesAndArithmeticModuli A3.1–A3.4 and A4.1;
Tau Ceti `AbelianVariety.baseChange`, `AbelianVariety.prod`.

**Checks.**
- `[ℓ]` induces multiplication by `ℓ` on the lattice, with cokernel of order `ℓ^{2g}`.
- A prime-to-`ℓ` isogeny induces an integral isomorphism; an `ℓ`-isogeny gives a rational
  isomorphism but need not give an integral one.
- Finite base change restricts the action to `G_L`, rather than inducing it to `G_K`.

### 6.2 Weil pairing and determinant

**The arithmetic Weil-pairing adapter.** Consume the intrinsic torsion pairings and polarized
pairings of AbelianSchemesAndArithmeticModuli A3.5, A3.7, A3.9 and the dual Tate pairing of A4.1:
`e_ℓ : T_ℓA × T_ℓA^∨ → ℤ_ℓ(1)` and
`e^λ_ℓ(x,y) = e_ℓ(x,T_ℓλ y)`, where `ℤ_ℓ(1)` is Tau Ceti's `PadicTateTwist`.
Transport them through the representation adapter and §1.2's identification with the cyclotomic
rank-one representation. Prove `e_ℓ(gx,gy) = χ_ℓ(g)e_ℓ(x,y)` and that the rational polarized action
lands in the similitudes with multiplier `χ_ℓ`. Integral perfectness holds when `ℓ ∤ deg λ`;
rational nondegeneracy holds for every polarization. Reduction, alternation, perfectness, products
and Rosati adjointness are the supplied pairing API (Mumford, §§20, 23; Milne 2008, Ch. I,
§§13–14, pp. 57–60). *Needs:* AbelianSchemesAndArithmeticModuli A3.5, A3.7, A3.9, A4.1;
§§1.2, 6.1; Tau Ceti `PadicTateTwist`.

**Checks.**
- For an elliptic curve and a basis `P, Q` of `T_ℓE`, `e_ℓ(P, Q)` generates `ℤ_ℓ(1)`.
- `λ = [ℓ] ∘ λ_E` gives `ℓ · e_ℓ`, which is not perfect.
- For complex conjugation `c`, `e_ℓ(cx, cy) = −e_ℓ(x, y)` in additive notation: `χ_ℓ(c) = −1`.

**Determinant and oddness.** Prove that for `B` a nondegenerate alternating form of rank `2g` over a
field and `B(hx, hy) = μ B(x, y)`, `det h = μ^g` (in matrix form over any commutative ring for
`g = 1`, Tau Ceti's `Matrix.det_eq_of_transpose_mul_J_mul_eq_smul`); hence `det ρ_{A,ℓ} = χ_ℓ^g` for
any polarisation of any degree, and `det E[ℓ]` is Mathlib's `modularCyclotomicCharacter` for `E`
elliptic. Prove that for complex conjugation `c` at a real place and every `ℓ`, `2` included, the
`±1`-eigenspaces of `c` on `V_ℓA` are Lagrangian of dimension `g`, so `tr = 0` and `det = (−1)^g`;
that the saturated rank-`g` eigenlattices `T_ℓA^±` span `T_ℓA` for `ℓ` odd; that for `ℓ = 2` their sum
contains `2T_2A` and its quotient in `T_2A` is killed by `2`, without equalling `2T_2A` in general;
and that elliptic curves over totally real fields are odd in the sense of §4.1 (Darmon–Diamond–Taylor
2007, §2.2, Prop. 2.8(a), p. 56; Serre 1972, §5.2(iv), p. 304). The integral linear algebra is
*Involution.eigensum* `c = ker(c − 1) + ker(c + 1)` for an involution of a module over any
commutative ring, which contains `2x` for every `x` (from `2x = (x + cx) + (x − cx)`) and is
everything when `2` is a unit. The intersection of the eigenmodules is killed by `2`, so absence
of `2`-torsion suffices for directness; invertibility of `2` guarantees a direct-sum decomposition
of the whole module. *Needs:* §4.1;
Mathlib `Matrix.J`.

**Checks.**
- On `ℤ²`, `c = diag(1, −1)` has eigensum `ℤ²`, strictly larger than `2ℤ²`; likewise on `ℤ_2²`.
- The swap `c(x, y) = (y, x)` on `ℤ²` has eigensum `{(x, y) : x ≡ y mod 2}`, containing `(1, 1)` and
  `2ℤ²` but not `(1, 0)`.
- Over `ℚ` the swap eigensum is the whole plane; in characteristic two the `+1` and `−1` labels
  coincide, so a rank statement for two eigenspaces needs characteristic `≠ 2`.

### 6.3 The Tate curve and local Euler factors

**The Tate curve.** Prove that for `K` finite over `ℚ_p`, `q ∈ K^×` with `|q| < 1`, `E_q` the Tate
curve of `TauCetiRoadmap.EllipticCurves` layer 4 and any `ℓ`, the uniformisation `K̄^×/q^ℤ ≅ E_q(K̄)`
gives `0 → ℤ_ℓ(1) → T_ℓE_q → ℤ_ℓ → 0`, with `t = (q^{1/ℓ^n})_n` lifting `1` and `σt = t + κ(σ)` for
the Kummer cocycle `κ`, so `ρ(σ) = (χ_ℓ(σ) κ(σ); 0 1)`; that `E_q[ℓ^n]` is an extension of `ℤ/ℓ^n` by
`μ_{ℓ^n}`; that for `ℓ ≠ p`, `κ = v(q) t_ℓ` on `I_K` (§2.3), inertia acts through a nontrivial
unipotent group, `(V_ℓE_q)^{I_K} = ℚ_ℓ(1)` and `WD(V_ℓE_q) ≅ Sp(2)`; and that `E_q[ℓ^n]` is unramified
iff `ℓ^n | v(q)` for `ℓ ≠ p` (Darmon–Diamond–Taylor 2007, §2.2, Prop. 2.12, pp. 57–58). *Needs:*
`TauCetiRoadmap.EllipticCurves` layer 4 (`L^×/q^ℤ ≅ E_q(L)`, Galois-equivariant); §2.3, §2.4.

**Checks.**
- For `ℓ ≠ p`, `q = p^ℓ` over `ℚ_p` has unramified `E_q[ℓ]` and ramified `V_ℓE_q`.
- For `ℓ ≠ p`, `q = p` has ramified `E_q[ℓ]`.
- For `K = ℚ₃`, `ℓ = 3`, `q = 3³`, divisibility holds but `μ₃ ⊂ E_q[3]` is ramified.

<a id="inertia-filtration-predicates"></a>

**Inertia filtration predicates.** For a representation `ρ` on a finite projective `A`-module
`M`, a subgroup `I ≤ Γ` and a submodule `T`, define *InertiaUnipotentTowards* `ρ I T` by
`(ρ(σ) − 1)(M) ⊆ T` for all `σ ∈ I`. Define *IsInertiaFiltration* `ρ I T` by requiring `T`
to be `Γ`-stable, `I` to fix `T` pointwise, and *InertiaUnipotentTowards* `ρ I T`; equivalently,
`0 ⊆ T ⊆ M` has trivial inertia action on both graded pieces. Define
*HasMultiplicativeType* `ρ I T χ` for a character `χ : I →* Aˣ` by
`ρ(σ)t = χ(σ)t` for every `σ ∈ I`, `t ∈ T`, with continuity of `χ` for continuous actions.
Prove invariance under equivariant isomorphism, restriction, and scalar extension (for `T`
use its tensor-image submodule); an inertia filtration implies
`(ρ(σ)−1)(ρ(τ)−1) = 0` for `σ,τ ∈ I`. For Tate-curve prime-to-residue-characteristic torsion,
the cyclotomic submodule gives this filtration; on residual `p`-torsion at residue
characteristic `p` it instead has multiplicative type `χ̄_p` (DDT, §2.2,
Propositions 2.11–2.12, pp. 57–58). *Needs:* §1.2 and the Tate-curve target above.
This character-valued formulation follows the Imperial College London FLT project's
inertia-filtration interfaces.

**Checks.**
- `[[1,a],[0,1]]` with `T = Ae₁` fixes `T` and the quotient; `T = 0` fails when `a ≠ 0`.
- `[[χ(σ),0],[0,1]]` has multiplicative type `χ` on `Ae₁`; if `χ` is nontrivial on `I`,
  it does not give an inertia filtration with trivial graded pieces.
- A Jordan block of size three is unipotent but its square difference from `1` is nonzero;
  the two-step inertia-filtration predicate excludes it.

<a id="unramified-splitting-character"></a>

**Unramified splitting character.** Let `K` be a nonarchimedean local field with valuation ring
`O_K` and residue field `k`, and let `W` be a minimal Weierstrass equation over `K` with
multiplicative reduction. Write `T² + a₁T + n` for the monic node quadratic, with `n` the constant
coefficient of the node polynomial divided by the unit `c₄`, so `n ∈ O_K` and `a₁² − 4n` is a
unit (Tau Ceti's split-multiplicative twist file). Prove that `O_K[T]/(T² + a₁T + n)` is finite
étale over `O_K`; hence `L = K[T]/(T² + a₁T + n)` is either `K × K`, exactly when the reduction is
split, or an unramified quadratic field extension, exactly when it is nonsplit. Define the
splitting character `δ_W : G_K → {±1}` as trivial in the split case and as Tau Ceti's
`Algebra.IsQuadraticExtension.quadraticCharacter` of `L/K`, composed with restriction, otherwise.
Prove that `δ_W` is trivial on `I_K` in every residue characteristic, `2` included, and that
`δ_W(Frob)` is `+1` or `−1` according as the reduction is split or nonsplit. Prove that
`quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map` gives a `G_K`-isomorphism
`E[m] ≅ E^L[m] ⊗ δ_W` for every `m ≥ 1`, hence equal restrictions to `I_K`, with `E^L` having split
multiplicative reduction (Darmon–Diamond–Taylor 2007, §2.2, Prop. 2.12 and its proof, pp. 57–58;
Silverman, *Advanced Topics*, V.5; Serre, *Local Fields*, III §5). The étale step is that a
monic polynomial with unit discriminant over a local ring has finite étale quotient; unramifiedness
of `L/K` follows. *Needs:* §2.3 for `I_K`; EllipticCurves Layer 5 and Tau Ceti's
`exists_quadraticTwist_hasSplitMultiplicativeReduction` for the twist; Mathlib's finite étale
algebras and unramified extensions of a DVR.

**Checks.**
- Over `ℚ_ℓ` with `ℓ` odd, a nonsplit node quadratic has unit discriminant `u` with `u` a nonsquare
  mod `ℓ`, and `L = ℚ_ℓ(√u)` is the unramified quadratic extension.
- Over `ℚ₂`, the node quadratic `T² + T + 1` has discriminant `−3`, a unit; `L = ℚ₂(ζ₃)` is
  unramified although `2` is not invertible, while `ℚ₂(√−1)` is ramified and is never a splitting
  field here.
- Twisting by a ramified quadratic character turns multiplicative into additive reduction, so
  bare existence of some quadratic twist does not determine the inertia action.

<a id="multiplicative-residual-unramified-criterion"></a>

**Multiplicative residual unramified criterion.** Let `K` be a nonarchimedean local field
of residue characteristic `ℓ`, `E/K` have multiplicative reduction, `v_K` the integer-normalized valuation and `p ≠ ℓ` prime.
Prove `E[p]` unramified iff `p ∣ v_K(j(E))`. The Tate parameter has
`v_K(q) = −v_K(j(E))`; the Kummer cocycle on inertia is this integer times the surjective
mod-`p` tame character. For nonsplit multiplicative reduction, the target above gives
`E[p] ≅ E^L[p] ⊗ δ_W` with `δ_W` trivial on inertia, including when `p = 2`, and `E^L` split, so
EllipticCurves Layer 4's equivariant Tate uniformization applies to `E^L`
(DDT, Proposition 2.12(a)–(c), pp. 57–58; Silverman, *Advanced Topics*, V.5).
*Needs:* §2.3's tame character; the Tate-curve, unramified splitting character and residual
elliptic targets; EllipticCurves Layer 4.
*Lean:* `TateModule.multiplicative_residual_unramified_iff`.

**Checks.**
- For `q = ℓ^p` over `ℚ_ℓ`, `E_q[p]` is unramified while `V_pE_q` is ramified.
- For `q = ℓ`, `E_q[p]` is ramified; an unramified quadratic twist has the same inertia action.
- For `K = ℚ₃`, `p = ℓ = 3`, `q = 3³`, divisibility holds but `μ₃ ⊂ E_q[3]` is ramified.

**Local Euler factors.** Define `H¹_ℓ(A) = V_ℓA^∨` for `A` over a nonarchimedean local field `F_v` of
residue characteristic `≠ ℓ`, and
*TateModule.localEulerFactor* `A = det(1 − T Φ_v | H¹_ℓ(A)^{I_v}) ∈ ℚ_ℓ[T]` with `Φ_v` geometric
(equivalently the coinvariants of `V_ℓA` with arithmetic Frobenius). Its API is the coinvariant form;
isogeny invariance; products; degree `≤ 2g`, with equality iff
unramified; and agreement with the Weil–Deligne local factor of §2.5. The partial `L`-function is
`∏_{v ∉ S} L_v(A, q_v^{−s})⁻¹` for `S` containing the bad places and those above `ℓ`
(Darmon–Diamond–Taylor 2007, §1.7, p. 46). *Needs:* §2.5.

**Checks.**
- The Tate curve over `ℚ_p` has `L = 1 − T`.

### 6.4 Coefficients and images

**Endomorphism coefficients.** Let `E ⊆ End⁰_K(A) = End(A) ⊗ ℚ` be a number field of degree `d` and
`O = E ∩ End_K(A)`. Consume the action of `End_K(A)` from `AbelianTate.map` and the freeness of
`V_ℓA` over `E ⊗ ℚ_ℓ`, of rank `2g/d`, from AbelianSchemesAndArithmeticModuli A6.12
(Milne 2008, Ch. I, Proposition 10.23). Prove that this supplied action commutes with `G_K`; for a prime `λ | ℓ` of `E`, the
`λ`-adic Tate module `V_λA = V_ℓA ⊗_{E⊗ℚ_ℓ} E_λ` and, for `O_E ⊆ End_K(A)`, `T_λA = T_ℓA ⊗ O_{E,λ}`;
and `A[λ] = {x ∈ A[ℓ] : λx = 0}`. Intended signatures: *TateModule.lambdaTateModule* `A E λ` with its
`ContinuousRep` over `E_λ`. Its API is the decomposition `V_ℓA = ⊕_{λ|ℓ} V_λA`, `dim V_λA = 2g/d`,
freeness of `T_λA`, `A[λ] ≅ T_λA/λ`, `det V_λA = χ_ℓ` for `E` totally real, fixed by Rosati, with
`d = g`, oddness, compatibility with the action of endomorphisms, and coefficient extension
(Ribet 1992, §3, pp. 4–5). *Needs:* §6.2; AbelianSchemesAndArithmeticModuli A3.9, A4.1, A6.12
(Rosati and coefficient action).

The downstream Frobenius comparison for these coefficient summands at good `v ∤ ℓ`,
with endomorphisms extending to `𝒜/O_v`, is owned by
NeronModelsAndSemistableAbelianVarieties §5.0b.

**Checks.**
- `y² = x³ − x` over `ℚ(i)` and `ℓ = 5` (split in `ℚ(i)`): two one-dimensional summands.
- `E = ℚ`: `V_λA = V_ℓA`.
- Over `ℚ` the action of `[i]` does not commute with complex conjugation (`c[i] = −[i]c`), so the
  `λ`-adic decomposition needs the endomorphisms to be defined over `K`.

**Open image.** For `k` a number field and `(A, λ)` principally polarised of dimension `g ≥ 1`,
define the image `ρ_{A,p}(G_k)`, closed in the similitude group of `(T_pA, e^λ_p)`;
*TateModule.IsPGaloisGeneric* (the
image is open there) and *TateModule.IsGaloisGeneric* (the adelic image is open in `GSp_{2g}(Ẑ)`). Its
API is equivalence with finite index; *IsGaloisGeneric* implies *IsPGaloisGeneric*; invariance under
finite `k'/k`; agreement after a symplectic framing; and independence of the principal polarisation
(Masser–Zannier 2020, §5.1, p. 658). *Needs:* §6.2.

**Checks.**
- For `y² = x³ − x` over `ℚ` the image lies in a Cartan normaliser and has infinite index.
- For `g ≥ 1`, the image never lies in the symplectic group `{μ = 1}`, since its uniquely
  determined multiplier is `χ_p`, which has infinite image.
- For `A = Spec k`, `T_pA = 0` and the linear action is trivial and symplectic; the zero form
  does not determine a multiplier, so this case is outside the open-image target.
- *IsGaloisGeneric* is invariant under finite base change.

### 6.4a Frattini detection of full profinite image

**Frattini detection of full profinite image.** Let `P` be a profinite group and `Φ(P)` the
intersection of its maximal proper open subgroups. If `Φ(P)` is open, then `P/Φ(P)` is finite,
and every closed subgroup `J ≤ P` surjecting onto this quotient equals `P`. For pro-`p` groups
this is the Burnside basis theorem; the statement here applies to any profinite group.
A proper closed subgroup lies in a proper open subgroup and hence in a maximal proper open
subgroup `M`; then `J Φ(P) ⊆ M`, contradicting surjectivity. Thus the implication
`J Φ(P) = P ⇒ J = P` holds even without openness; openness makes the detecting quotient finite
(Masser–Zannier 2020, proof of Lemma 5.1, p. 659).
*Needs:* ProfiniteProPGroups Layers 0 and 3 (closed and open subgroups, Frattini theory);
Mathlib `frattini`.

**Checks.**
- For `P = ℤ/4`, `Φ(P) = {0, 2}`, and the proper subgroup `{0, 2}` does not surject onto `P/Φ(P)`.
- Projection `ℤ_p² → ℤ/p` onto the first coordinate is surjective on `ℤ_p × {0}`; its kernel
  is not contained in `Φ(P)`, so this quotient does not detect full image.
- For `P = ∏_ℓ ℤ/ℓ` over all primes, `Φ(P) = 1` is not open, and each finite quotient is hit
  by a proper closed subgroup, the kernel of projection to an unused factor.

**Finite Frattini quotient of a compact matrix group.** For compact `P ≤ GL_n(E)`,
`E/ℚ_ℓ` finite, prove that the profinite Frattini subgroup `Φ(P)` is open. Choose the normal open
uniform pro-`ℓ` subgroup `U` from §5.8; `Φ(U) = U^ℓ[U,U]` is open by finite generation and is
contained in every maximal proper open subgroup of `P`: otherwise `M Φ(U) = P` would imply
`(M ∩ U) Φ(U) = U`, contradicting the pro-`ℓ` Burnside basis theorem. Thus `Φ(U) ≤ Φ(P)`.
Combine this with §6.4a's full-image detection in `P/Φ(P)`
(Masser–Zannier 2020, proof of Lemma 5.1, p. 659; Schneider, §27, Theorem 27.1).
*Needs:* §5.8 compact subgroup charts; ProfiniteProPGroups Layer 3 (Frattini and Burnside basis);
§6.4a, *Frattini detection of full profinite image*.

*Lean:* `TateModule.compact_matrix_frattini_isOpen`.

**Checks.**
- For `P = ℤ_ℓ`, `Φ(P) = ℓℤ_ℓ`; surjectivity modulo `ℓ` detects a full closed subgroup.
- For finite `P`, the quotient is finite and the conclusion reduces to finite Frattini theory.
- `∏_{i≥0} C_ℓ` has trivial, non-open Frattini subgroup; compactness without the finite-dimensional
  matrix-group hypothesis does not give a finite detecting quotient.

### 6.6 Serre's wild bound

**Serre's wild bound.** Prove that for `K` of characteristic `0` in the conductor setting,
`e_K = v_K(p)`, `V` of dimension `N` over a field of characteristic `≠ p` and `ρ` continuous with
finite image `G = Gal(L/K)`, lower groups of orders `g_i` and `g_1 = p^c`,
`Sw(V) ≤ N e_K (c + 1/(p − 1))` and hence `a(V) ≤ N(1 + e_K c + e_K/(p − 1))`, by Hilbert's formula
and Hensel's bound for the different; the strict form for non-cyclic `G_1` is not asserted (Serre
1987, §4.9, Prop. 9 and (4.9.4), pp. 215–216). *Needs:* §§3.1, 3.2.

### Examples

`T_pμ_{p^∞} = ℤ_p(1)` has `χ_p(Frob_l) = l`, `χ_p(c) = −1` and Hodge–Tate weight `+1`, and is
`det T_pE` for every `E/ℚ`. The split Tate curve is ramified with `(V_ℓE_q)^I = ℚ_ℓ(1)`, on which
Frobenius has polynomial `X − q_K`, and `L = 1 − T`. For `y² = x³ + 1` and `p ∈ {5, 11, 17, 23}`,
`a_p = 0` and `P_p = X² + p`. `y² = x³ − x` has abelian image on `G_{ℚ(i)}`, `V_ℓE ⊗ ℚ̄_ℓ ≅ Ind ψ`,
and `a_p = 0` for `p ≡ 3 mod 4` (Milne 2021, Ch. IV, §9, p. 158). Over `F_q`, `a = q + 1 − #E(F_q)`,
and arithmetic Frobenius on `T_ℓE` and geometric Frobenius on `H¹` both have polynomial `X² − aX + q`,
with Euler factor `1 − aT + qT²` (Darmon–Diamond–Taylor 2007, §2.1, p. 50).

### Dependencies

Layers 1–5; AbelianSchemesAndArithmeticModuli A3, A4.1, A6.10–A6.12;
`TauCetiRoadmap.EllipticCurves` layers 1–4; ProfiniteProPGroups Layers 0 and 3;
`TauCetiRoadmap.LocalFieldsRamification` layer 2;
`TauCetiRoadmap.NumberFieldArithmetic` layer 5; Tau Ceti's abelian varieties, isogenies and elliptic
Tate modules.

## Layer 7: dimension-general arithmetic API

This layer supplies the operations and image conditions that automorphy lifting consumes in every
dimension: continuous symmetric, exterior and tensor powers, tensor induction and restriction of
scalars; the adjoint, trace-zero adjoint and adjoint modulo scalars; similitude groups and the
Clozel–Harris–Taylor group `𝒢_n`; polarised representations, their signs and oddness; `GSp₄`-valued
representations; Zariski closures and strong irreducibility; projective lifting; finite-group
cohomology; Clebsch–Gordan modulo `p`; and adequate, enormous, vast and tidy images with the
Taylor–Wiles image conditions.

Standing hypotheses: `Γ` is profinite and `A` a topological commutative ring (§1.1); Frobenius is
arithmetic and `χ_ℓ` has Hodge–Tate weight `+1`; `c_v` is a complex conjugation at a real place `v`
(§4.1); `ε̄` is the mod `p` cyclotomic character; finite-group cohomology is Mathlib's
`groupCohomology`; "the field of `ρ`" is the fixed field of `ker ρ`. Proposed names live in
`ContinuousRep`, *PolarizedRep*, *SimilitudeGroup*, *GSp4Rep*, `GaloisRep` and `ResidualImage`.
Sources: BCGNT = Boxer–Calegari–Gee–Newton–Thorne 2025; BCGP21 and BCGP25 = the two
Boxer–Calegari–Gee–Pilloni papers of 2021 and 2025 respectively; BCG = Boxer–Calegari–Gee 2025;
BLGG = Barnet-Lamb–Gee–Geraghty 2013; CHT =
Clozel–Harris–Taylor 2008; CGH = Calegari–Geraghty–Harris 2019; NT26 = Newton–Thorne 2026; NT23 =
Newton–Thorne 2023; GHTT = Guralnick–Herzig–Taylor–Thorne 2012; GHT = Guralnick–Herzig–Tiep 2017; GN =
Gee–Newton 2022; Pat = Patrikis 2019; KT = Khare–Thorne 2017; Th12, Th17 = Thorne 2012, 2017; Qian =
Qian 2023.

### 7.1 Powers, tensor induction, restriction of scalars

**Symmetric, exterior and tensor powers.** Define *ContinuousRep.symPower* `ρ d`,
*ContinuousRep.extPower* `ρ d` and the tensor power on `Sym[A]^d M` (the quotient symmetric power; `d!`
is not assumed invertible), `⋀[A]^d M` and `⨂^d M`, through Tau Ceti's
`Representation.symmetricPower`, `Representation.exteriorPower` and `Representation.tensorPower`,
adding the module topology, joint continuity and finite projectivity of rank `binom(n + d − 1, d)`,
`binom(n, d)`, `n^d` for `M` of constant rank `n` and `A ≠ 0`. With `Dρ =` *ContinuousRep.detLineRep* `ρ`
from §1.1, prove `∧^n ρ ≅ Dρ`, `∧^d ρ = 0` for `d > n`,
`∧^d ρ ≅ (∧^{n−d} ρ)^∨ ⊗ Dρ` for `d ≤ n`, and `ρ ⊗ ρ ≅ Sym² ρ ⊕ ∧² ρ` when `2 ∈ A^×`. Its API is
the ranks, functoriality, base change, the characteristic polynomial, the top exterior power as the
determinant, the tensor-square decomposition, the exterior pairing and agreement of the underlying
representations with Tau Ceti's (BCG, proof of Thm 2.1, p. 513; NT26, Lemma 2.2, p. 10). *Needs:* Tau
Ceti `Representation.symmetricPower`, `Representation.exteriorPower`, `Representation.tensorPower`,
`SymmetricPower.finrank_eq`; §1.1.

**Checks.**
- `Sym⁰ ρ` is trivial of rank one; a basis of a free rank-`n` carrier identifies `∧^n ρ`
  with `ofCharacter (det ρ)`, including `n = 0`.
- For the trivial action on `I = (2, 1 + √−5)` over `ℤ[√−5]`, `∧¹I = I = Dρ` and
  `det ρ = 1`; the exterior duality at `d = 1` gives `A^∨ ⊗ I ≅ I`, not `I ≅ A`.
- For `det(X − ρ(g)) = (X − α)(X − β)`, `Sym² ρ(g)` has roots `α², αβ, β²`.
- For `GL₂(F_3)` on `V = F_3²`, `Sym³V ≇ Γ³V = (Sym³V)^∨ ⊗ det³` (`V ⊂ Sym³V` and
  `Hom(Sym³V, V) = 0`), so the quotient symmetric power is not self-dual in characteristic `p`; for
  `GL₂(F₂)` on `V`, `V ⊗ V ≅ V ⊕ P(1)` is projective while `Sym²V ⊕ ∧²V ≅ V ⊕ 1 ⊕ 1` is not, so the
  tensor-square decomposition needs `2 ∈ A^×`.

**Universal characteristic polynomials.** Prove that there are monic
`S_{n,d}, E_{n,d} ∈ ℤ[c_1, …, c_n][T]` of degrees `binom(n + d − 1, d)` and `binom(n, d)` with
`det(T − Sym^d f) = S_{n,d}(c(f); T)` and `det(T − ∧^d f) = E_{n,d}(c(f); T)` for every commutative
`R`, free `M` of rank `n` and `f : M → M`, `c(f)` the coefficients of `det(T − f)`; the roots are the
`d`-fold products of the roots `α_i` with, resp. without, repetition; `d = 0` gives `T − 1` and
`n = 0 < d` gives `1` (BCG, proof of Thm 2.1, p. 513).

**Tensor induction.** For `H ≤ Γ` open with an explicit finite-index witness, of index `m`, `(V, ρ)` of rank `n` over `H` and a transversal
`t` with `g t_i = t_{π_g(i)} h_i(g)`, define *ContinuousRep.tensorInd* `H t ρ` on `⨂_{Γ/H} V`, `g`
putting `ρ(h_i(g)) v_i` in slot `π_g(i)`: Tau Ceti's `Subgroup.tensorInducedRepresentation` with rank
`n^m` (`A ≠ 0`), the module topology and joint continuity (which uses openness); equivalently it is
read through the transversal-dependent monomial homomorphism `Γ → H^m ⋊ S_m` of
`TauCetiRoadmap.ProfiniteCohomology` layer 13. Prove that the trace is
`∏_j tr ρ(t_{i_j}⁻¹ g^{l_j} t_{i_j})` over the cycles of `g` on `Γ/H`, with characteristic polynomial
universal in the cycle polynomials for `V` free; and that for transversals `t` and `t' = tu`
(`u_x ∈ H`), `T_{t,t'} = ⨂_x ρ(u_x)⁻¹` intertwines, with `T_{t,t} = id` and
`T_{t',t''} T_{t,t'} = T_{t,t''}` (any group, `H` of finite index; continuous for `H` open;
Berger 1977, Prop. 2.14, pp. 12–13, whose pure-tensor intertwiner works over every commutative ring).
The Asai representation: for `K/F` quadratic, `As(ρ) = ⊗-Ind_{G_K}^{G_F} ρ`; its quadratic twist
`As(ρ) ⊗ η_{K/F}` also extends `ρ ⊗ ρ^σ`. For `A` a field and this restriction absolutely
irreducible, prove that extension classes up to `A`-linear isomorphism form a torsor under
`Hom(G_F/G_K, A^×)`: there are exactly two classes, represented by `As(ρ)` and its quadratic twist,
when `char A ≠ 2`, and one class when `char A = 2`, where `η_{K/F} = 1`. The construction and
polynomial formulas hold over every commutative coefficient ring; its
roots are `α_i α'_j` at `g ∈ G_K` and `∏_i (X − β_i) ∏_{i<j} (X² − β_i β_j)` at `g ∉ G_K`, `β` the
roots of `ρ(g²)`. Its API is the transversal isomorphisms, the rank, pure tensors, restriction to a
normal subgroup, the trace formula, transitivity, base change and the characteristic polynomials (CG,
§4, proof of Ex. 4.11, p. 819, for the Asai calculation). *Needs:* Tau Ceti
`Subgroup.tensorInducedRepresentation`; `TauCetiRoadmap.ProfiniteCohomology` layer 13; Mathlib
`MonoidHom.transfer`; §1.7 (absolute irreducibility and scalar endomorphisms).

**Checks.**
- Tensor induction from `H = Γ` is `ρ`; in rank one it is `ψ ∘ Ver` (Mathlib's `MonoidHom.transfer`),
  and for index two and `g ∉ H`, `Ver(g) = g²`.
- `ℤ/2` on `A²` trivially, `2 ≠ 0`: tensor induction has trace `2` at the generator, induction `0`.
- In rank two the Asai polynomial at `g ∉ H` is `(X² − aX + b)(X² − b)` for
  `det(X − ρ(g²)) = X² − aX + b`.
- For any quadratic `K/F` and the trivial rank-one `ρ` over `F_2`, `ρ ⊗ ρ^σ` is absolutely
  irreducible and `As(ρ) = As(ρ) ⊗ η_{K/F} = 1`. Its rank-one extension is unique since
  `F_2^× = {1}`.
- On `F₂² ⊗ F₂²`, the flip `τ` sends `e₀ ⊗ e₁` to the distinct tensor `e₁ ⊗ e₀`;
  it is a nontrivial unipotent involution, since `τ² = 1` and `(τ − 1)² = 0`.
- A non-open index-two subgroup of `∏_ℕ C₂` gives discontinuous tensor induction of the trivial
  rank-two `ℚ₃`-representation: the two cosets act by identity and flip. Finite index alone
  does not provide continuity.

**Cyclic tensors.** Prove that for `R` commutative, `l ≥ 1`, `V_1, …, V_l` free of rank `n`,
`A_i : V_i → V_{i+1}` (indices mod `l`), `T(v_1 ⊗ ⋯ ⊗ v_l) = A_l v_l ⊗ A_1 v_1 ⊗ ⋯` and
`B = A_l ∘ ⋯ ∘ A_1`: `tr T = tr B` and `det(X − T) = C_{n,l}(c(B); X)` for a universal monic `C_{n,l}`
of degree `n^l` with `C(e(β); X) = ∏_O (X^{|O|} − β_{j_1} ⋯ β_{j_{|O|}})` over the orbits
`O ∋ (j_1, …, j_l)` of the cyclic shift on `{1..n}^l` (the product over one period, not the whole
tuple), so `C_{n,2} = ∏(X − β_i) ∏_{i<j} (X² − β_i β_j)`; and `tr(A ⊗ A') = tr A · tr A'` with
`det(X − A ⊗ A')` universal of roots `α_i α'_j` (CG, arXiv v1, §4, proof of Ex. 4.11, p. 15).

**Checks.**
- `n = 1`, `l = 2`, `A_1 = a`, `A_2 = b`: `T = B = ab = β` and `det(X − T) = X − β`, not `X − β²`.
- `l = 2`, `B = diag(2, 3)`: `det(X − T) = (X − 2)(X − 3)(X² − 6)`.
- `l = 1`: `T = B`.

**Restriction of scalars.** For a continuous `A → B` with `B` finite projective of constant rank `r`
over `A` (with the `A`-module topology) and `(M, ρ)` of rank `n` over `B`, define
*ContinuousRep.resScalars* `ρ`: `M` over `A`, of rank `rn`. Prove
`det_A(X − ρ(g)) = N_{B[X]/A[X]} det_B(X − ρ(g))` (free case, else after localisation) and
`(Res ρ) ⊗_A A' ≅ ⊕_σ ρ ⊗_{B,σ} A'` for `B` étale split by `A'`; its API is the rank, functoriality,
the base change isomorphism and transitivity. The determinant identity is Mathlib's
`LinearMap.det_restrictScalars` over `A[X] → B[X]`; the split étale decomposition follows from
`B ⊗_A A' ≅ ∏_σ A'` and its orthogonal idempotents. *Needs:* Mathlib `Algebra.norm`,
`LinearMap.det_restrictScalars`, `Algebra.Etale`.

**Checks.**
- `Res_{A/A} ρ = ρ`.
- For `B` free of rank two and a character `ψ`, `det_A(X − ψ(g)) = X² − (ψ + ψ^σ)(g) X + ψψ^σ(g)`.

- For `E/K` quadratic, `char K ≠ 2`, and the trivial `ρ`, `Res ρ` is not `Ind ρ` (different
  `Γ`-actions on the same module); `Res` splits over a splitting field of `B`.

### 7.2 Adjoint, trace pairing and Schur's lemma

**The adjoint.** Provides the duality trace used to form the trace-zero adjoint and trace pairing.
PivotalSpherical §Layer 2 supplies left and right trace and the common spherical `trace`.
AdicSpacesPartIII §R3.8 / *projective-trace-realization* supplies their comparison with the
contraction trace on finite projective modules, including the identification `End_A(A) ≅ A`, as
`LinearMap.projectiveTrace_eq_categoricalTrace`. Section 7.2 consumes this comparison and transports
the supplied `LinearMap.projectiveTrace` to continuous representations, with their conjugation
action on endomorphisms; it owns the trace-zero adjoint and the pairing consequences below.

For `ρ` of rank `n ≥ 1` define *ContinuousRep.ad* `ρ` on `End_A(M)` by conjugation
(Mathlib's `Representation.linHom ρ ρ`), *ContinuousRep.endTrace* as a local consumer alias for the
AdicSpacesPartIII §R3.8 projective trace in the supplier contracts,
*ContinuousRep.adZero* `ρ = ker` *endTrace* and
*ContinuousRep.adQuot* `ρ = ad ρ / A·1`, both of rank `n² − 1` and kept distinct. Prove that the trace
pairing is perfect and invariant and `ad⁰ ρ ≅ (ad ρ / A·1)^∨` over every `A`; that `ad⁰ → ad/A·1` has
kernel `A[n]·1` and cokernel `A/nA`, so it is an isomorphism, with `ad = A·1 ⊕ ad⁰`, exactly when
`n ∈ A^×`; and that for constant rank `n = 2` and any `A`,
`ad/A·1 ≅ Sym² ρ ⊗ Dρ^∨` and `ad⁰ ≅ (Sym² ρ)^∨ ⊗ Dρ`, where
`Dρ =` *ContinuousRep.detLineRep* `ρ` (§1.1). After choosing a trivialization of `Dρ` these become
the scalar-character twists by `(det ρ)⁻¹` and `det ρ`, respectively.
Its API is `ad ≅ M ⊗ M^∨`, perfectness, the splitting when `n` is invertible, `1 ∈ ad⁰` iff `n = 0` in
`A`, kernel and cokernel, base change, the `n = 2` isomorphisms, and the Weil–Deligne adjoint
`(ad r, [N, −])` on §2.4's canonical parameter fields (CHT, §2.1, p. 7; ACC+, after Def. 6.2.29, p. 1044).
*Needs:* PivotalSpherical §Layer 2; AdicSpacesPartIII §R3.8 / *projective-trace-realization*,
`LinearMap.projectiveTrace_eq_categoricalTrace`, and *projective-module-trace*; Mathlib
`Representation.linHom`; Tau Ceti `ContRepresentation.linHom`; §§1.1, 2.4, 7.1.

**Checks.**
- `ad` of a character is trivial of rank one, and *endTrace* is `LinearMap.trace` on a free module.

- Over `F₂` in rank two, `1 ∈ ad⁰`, so neither a complement nor a quotient definition of `ad⁰` agrees
  with `ad/A·1`; over `F_p` with `n = p`, `tr(1 · Y) = 0` on `ad⁰` and the trace pairing on `ad⁰` is
  degenerate.
- Over `ℤ[√−5]` with `M = (2, 1 + √−5)`, Mathlib's `LinearMap.trace` of the identity is `0` while
  *endTrace* is `1`.
- For the trivial action on `M = A ⊕ I`, `A = ℤ[√−5]`, `I = (2, 1 + √−5)`,
  `Dρ` has carrier `I`. The carrier of `ad/A·1` is `A ⊕ I ⊕ I⁻¹`, with determinant line `A`,
  whereas `Sym² M = A ⊕ I ⊕ I²` has determinant line `I³ ≅ I`. Tensoring by `Dρ^∨`
  restores determinant line `A`; the trivial scalar character does not.
- Over `F₂` in rank two the formulas with `Dρ` still hold: in the basis `e₁,e₂`,
  `ad/A·1 → Sym² M ⊗ (∧² M)^∨` sends the class of `[[a,b],[c,d]]` to
  `(b e₁² + (d − a)e₁e₂ − c e₂²) ⊗ (e₁ ∧ e₂)^∨`.

**The trace pairing on matrices.** Prove that for every commutative `A`, `(X, Y) ↦ tr(XY)` on `M_n(A)`
is a perfect pairing (`LinearMap.IsPerfPair`; stronger than nondegenerate, as `2xy` on `ℤ` shows),
with dual basis `(E_{ji})` since `tr(E_{ij} E_{kl}) = δ_{jk} δ_{il}`; likewise on `End_A(M)` for
finite projective `M` with the contraction trace, by localisation to the free case. BCG, proof of Thm
2.1, p. 513, uses this trace duality. *Needs:* Tau Ceti `traceBilinForm`,
`traceBilinForm_nondegenerate`; Mathlib `LinearMap.IsPerfPair`.

**Schur's lemma over a local ring.** Prove that for `A` local, `n ≥ 1` and `ρ : Γ → GL_n(A)` with absolutely
irreducible reduction, `ρ(Γ)` spans `M_n(A)`, its centraliser in `M_n(A)` is `A` (in `GL_n(A)`,
`A^×`), and two intertwiners in `GL_n(A)` differ by `A^×`; no completeness, Noetherianity or
continuity is needed (CHT, Lemma 2.1.8, p. 13).

### 7.3 Similitude groups

**Similitude groups.** For `R` commutative, `M` finite projective of constant positive rank and `B` a
perfect `ε`-symmetric form (in the Lean, any Gram matrix `J`), define *SimilitudeGroup.groupScheme* `J`,
the points `GAut(M, B)(R') = {(g, ν) : B(gx, gy) = ν B(x, y)}`, closed in `GL(M) × G_m` with `ν`
determined by `g`; *SimilitudeGroup.multiplier*; *SimilitudeGroup.GSp* for
`J_{2m} = (0 1_m; −1_m 0) = −Matrix.J`; `GSp₄` also for the antidiagonal `J = antidiag(1, 1, −1, −1)`
of BCGP21 and CG (the same group for `gJgᵀ = νJ` and `gᵀJg = νJ`, as `J⁻¹ = −J`;
`P = diag(1₂, (0 1; 1 0))` has `Pᵀ J_4 P = J`); *SimilitudeGroup.GO* for `1_n`; `G_n = GSp_n` or
`GO_n` for `n` even or odd; and *SimilitudeGroup.lie* `= {X : ∃ c, Xᵀ J + J X = c J}`,
the matrix projection of the similitude Lie algebra. The full Lie algebra consists of pairs `(X,c)` with this relation;
for positive rank and perfect `J`, the projection is injective and identifies it with
*SimilitudeGroup.lie* (`gsp`, `go`), with `sp, so = ker dν = {X : Xᵀ J + J X = 0}` (Mathlib's
`skewAdjointMatricesSubmodule J`). Prove `gsp = sp ⊕ R·1` (central scalars with trivial adjoint action
and `dν(1) = 2`) when `2 ∈ R^×` and `det J ∈ R^×`; `det g = ν(g)^m` on `GSp_{2m}`; and
`(det g)² = ν(g)^n` on `GO_n`. For positive rank and perfect forms, these matrix descriptions
give the Lie algebras of the group schemes `ConstantForm.groupScheme`, `Symplectic.groupScheme`, `Orthogonal.groupScheme` of Tau Ceti in the
sense of `TauCetiRoadmap.ReductiveGroups` layer 2 (BLGGT, §1.1, p. 11; BCGP21, §2.1.1, p. 15; CG, §2.1,
p. 807). *Needs:* Mathlib `Matrix.symplecticGroup`, `Matrix.J`, `skewAdjointMatricesSubmodule`; Tau
Ceti `Symplectic.groupScheme`, `Orthogonal.groupScheme`, `ConstantForm.groupScheme`,
`Matrix.det_eq_of_transpose_mul_J_mul_eq_smul`; `TauCetiRoadmap.ReductiveGroups` layers 0, 2, 9.

**Checks.**
- `GSp₂ = GL₂` with `ν = det`; `Sp_{2m}` is Mathlib's `Matrix.symplecticGroup`, whose `J` is
  `−J_{2m}`.
- For `J = 0` on `ℚ¹`, the group is `GL₁ × G_m` and its Lie algebra has dimension two;
  its matrix projection *SimilitudeGroup.lie* `J = M₁(ℚ)` has dimension one. The pairs `(0,0)`
  and `(0,1)` have the same matrix projection, so no multiplier differential descends to it.

- Over `F₂`, `2J = 0` and `1 ∈ sp₄`, so `gsp₄ = sp₄ ⊕ R·1` fails.
- Over a nonzero commutative ring an alternating perfect form on a free module of odd rank does
  not exist. Over `ZMod 1`, the zero form on the singleton module `(ZMod 1)¹` is perfect.
- Over `ℚ` in rank four, `sp₄` and the scalar line are disjoint and their supremum is `gsp₄`,
  of dimension `11`, a proper subspace of the `16`-dimensional matrix algebra. The complement
  is inside `gsp₄`.

### 7.4 Polarised representations, `𝒢_n` and oddness

**Polarisations.** Define *PolarizedRep* `Γ Δ c A M`: for `Δ ≤ Γ` open of index at most two (in the
Lean, any subgroup normalized by `c`, recorded by *PolarizedRep.conj_mem*), an involution `c`
with `c ∉ Δ` if `Δ ≠ Γ`, and `(M, ρ)` over `Δ`: a continuous
`μ : Γ → A^×` and a perfect pairing with `⟨ρ(σ)x, ρ(cσc)y⟩ = μ(σ)⟨x, y⟩` and `⟨x, y⟩ = ε⟨y, x⟩` for a
sign `ε ∈ {±1}` (data when `2 = 0`), with `ε = −μ(c)` in `A` when `c ∉ Δ` (the CM sign condition); no
alternation is imposed. For `F` CM or totally real, `Γ = G_{F⁺}`, `Δ = G_F` (`G_{F⁺} ∖ G_F` restricts
to Mathlib's `NumberField.IsCMField.complexConj`), and `c = c_v` for a real place of `F⁺`; for `F`
imaginary, `ε_v = −μ(c_v)`. CHT triples: for `Δ` of index two and any `γ₀ ∉ Δ`,
`μ(δ)⟨x, y⟩ = ⟨ρ(δ)x, ρ(γ₀ δ γ₀⁻¹) y⟩` and
`⟨x, ρ(γ₀²) y⟩ = −μ(γ₀)⟨y, x⟩`; this is a polarisation when `−μ(c_v)` is a sign (domains, or `2 ∈ A^×`
with `Spec A` connected; not over `k × k`, where `μ(c_v) = (1, −1)` is possible). Prove: in rank one
with `⟨x, y⟩ = uxy`, `u ∈ A^×`, `μ|_{G_F} = r · r^c` and `ε = 1` in `A`;
in the CM/index-two case `c_v ∉ Δ`, this forces `μ(c_v) = −1`, so `(1, δ_{F/F⁺})` is polarised,
whereas `(1, 1)` is not when `2 ≠ 0` in `A`. For `F` totally real, `2 ∈ A^×` and
`Spec A` connected, `ρ` is polarised iff it factors through `GSp(M, B)` or `GO(M, B)` with
`ν ∘ ρ = μ`, `B(x, y) = ⟨x, ρ(c_v) y⟩`,
`B(y, x) = ε_v μ(c_v) B(x, y)`. If `μ(c_v) = −ε_v`, then `B` is alternating, including in rank zero.
If `M` is faithful over `A` (in particular, of positive constant rank, or nonzero over a field),
prove the converse, so `B` is alternating iff `μ(c_v) = −ε_v`. A polarised representation is
essentially conjugate self-dual, `ρ^c ≅ ρ^∨ ⊗ μ|_Δ` (BLGGT, §2.1, p. 31; CHT, Lemma 2.1.1, p. 7).
*Needs:* §1.2, §4.1, §7.3.

**Checks.**
- For `Γ = S₃`, `Δ = ⟨(12)⟩` and `c = (23)`, conjugation sends `(12)` to `(13)`;
  *PolarizedRep.conj_mem* fails, so these data cannot define a polarisation even for trivial `ρ`.

- In rank one over a domain with `2 ≠ 0` and `c ∉ Δ`, a polarisation forces `μ(c) = −1`.
- In the CM/index-two case `c_v ∉ Δ`, a rank-one character with
  `ρ(σ) ρ(c_vσc_v) = μ(σ)`, `μ(c_v) = 1` and `2 ≠ 0` is conjugate self-dual but not polarised.
- For a totally real field (including a real quadratic field with two real places), `Δ = Γ`,
  the trivial rank-one representation, multiplier `1`, pairing `xy` and sign `1` are polarised.
  Transport between real places preserves sign `1`, and the type sign `ε_v μ(c_v)` is `1`.

- For `F = ℚ`, `A = ℚ₃`, `Δ = Γ = G_ℚ` and `M = 0`, the zero pairing is perfect and alternating
  with trivial representation, multiplier `1` and sign `1`, although `1 ≠ −1`. Thus alternation
  does not determine the type sign without faithfulness.
- For `F` totally real, `n = 2`, `2 ∈ A^×` with `Spec A` connected, the pairing is `det(x, ρ(c_v) y)` and
  `ε_v = −det ρ(c_v)`.

**The group `𝒢_n`.** Define `CHTGroup n = (GL_n × GL_1) ⋊ {1, j}` over `ℤ` with
`j(g, μ)j⁻¹ = (μ g^{−T}, μ)`, `ν(g, μ) = μ`, `ν(j) = −1` and `ad(j) x = −xᵀ` (intended signature: a
group scheme over `ℤ`, with points `CHTGroup.points n R`). For `Δ ≤ Γ` of index two (open in the
topological case), `γ₀ ∉ Δ` and any ring `R`, prove that `r : Γ → 𝒢_n(R)` inducing `Γ/Δ ≅ 𝒢_n/𝒢_n⁰`
correspond to the CHT triples above on `R^n`, by `μ = ν ∘ r`, `⟨x, y⟩ = xᵀ A⁻¹ y`,
`r(γ₀) = (A, −μ(γ₀)) j`, preserving continuity. Define the maps `⊗ : (𝒢_n × 𝒢_m)⁺ → 𝒢_{nm}`,
`𝒢_n → GSp_{2n}`, and `G_n × {±1} → 𝒢_n` with `(g, −1) ↦ (g, ν(g))(A_n⁻¹, (−1)^{n+1}) j`, so
`ν = ν(g) s^n` (giving `r_ψ` for `F` imaginary quadratic). For the same index-two `Δ` and
`γ₀ ∉ Δ`, prove that an absolutely irreducible `r`
with `r^{γ₀} ≅ r^∨ ⊗ μ` extends to `𝒢_n(k)` with multiplier `μ` or `μδ` according to `sgn(r, μ)`; that
CHT induction from `Γ' ⊄ Δ` of finite index is independent of `γ₀`; and that `gl_n^{𝒢_n} = 0` over
`ℤ[1/2]` (CHT, §2.1, Lemmas 2.1.1–2.1.2, pp. 7–9; BCG, (2.1.2), p. 514; BLGGT, §1.1, p. 13).

**Checks.**
- `ν(j) = −1`.
- `n = 1`, `γ₀² = 1`: `((a, μ₀) j)² = (μ₀, μ₀²) = 1` forces `μ₀ = 1`, so `ν(r(γ₀)) = −1` over every `R`.
- For `Γ = ℤ/2` the triples are the `A` with `Aᵀ = −μA`; there are none for `ℤ/3` (no index-two
  subgroup); over `F₂`, `−1ᵀ = 1` and `gl_n^{𝒢_n} ≠ 0` for `n ≥ 1`.
- Inverting `2` is sufficient, not necessary: invariance under the elementary matrices of `GL_n(R)`
  forces a scalar `a · 1_n`, which `ad(j)` sends to `−a · 1_n`, so the invariants are the `a · 1_n`
  with `2a = 0`. Over `ℤ`, where `2 ∉ ℤ^×`, this is `0`; over `ℤ/4` it is `{0, 2 · 1_n} ≠ 0`
  for `n ≥ 1`.
- In rank zero, `gl_0 = 0` and `1_0 = 0`, so the invariant module is zero over both `F₂` and `ℤ/4`.

**Signs and places.** Prove: (1) `⟨x, y⟩_{v'} = ⟨x, ρ(c_v c_{v'}) y⟩_v` polarises `(ρ, μ)` at another
real place `v'` with `ε_{v'} = μ(c_v c_{v'}) ε_v` whenever `μ(c_v c_{v'}) ∈ {±1}`
(domains, or `2 ∈ A^×` with `Spec A` connected; over `k × k` the place can matter).
In the CM/index-two case, `c_v, c_{v'} ∉ Δ` and `ε_v = −μ(c_v)`, hence
`ε_{v'} = −μ(c_{v'})`; for totally real `F`, retain the type sign `ε_v μ(c_v)`;
(2) `det ρ(c_v σ c_v) det ρ(σ) = μ(σ)^n`, so for `F` totally real `(det ρ)² = μ^n`, and `⟨x, ρ(c_v) y⟩`
alternating forces `n` even and `det ρ = μ^{n/2}`; (3) an alternating perfect pairing on a free module
over a nonzero ring forces `n` even; (4) for `Δ ≤ Γ` open of index two, an involution `c ∉ Δ`,
`k` a field and `ρ` absolutely irreducible with
`ρ^c ≅ ρ^∨ ⊗ μ`, a covariant pairing exists, unique up to `k^×`, with an intrinsic sign `sgn(ρ, μ)`
for `char k ≠ 2`: `(ρ, μ)` is polarised iff `sgn = 1`, otherwise `(ρ, μδ)` is; the extensions
`r : Γ → 𝒢_n(k)` of `ρ` (`r|_Δ = (ρ, μ|_Δ)`, all with the same multiplier, `μ` or `μδ`), taken up to
conjugation by `GL_n(k) × {1}`, form a `k^×/k^{×2}`-torsor, `α ∈ k^×` replacing `r(γ) = (A, m) j`
by `(αA, m) j` for `γ ∉ Δ`: the elements of `GL_n(k) × {1}` carrying one extension of `ρ` to another
are the scalars `x` (Schur), acting by `A ↦ x²A`, whereas `(1, y) ∈ 𝒢_n⁰(k)` acts by `A ↦ y⁻¹A`, so
up to `𝒢_n⁰(k)`-conjugacy there is a single class (CHT, Lemma 2.1.4, pp. 9–10); in characteristic `2`
it is always polarised (`μ(c) = 1 = −1`), not necessarily alternating; (5) an irreducible
`ρ : G_K → GL₄(ℚ̄_p)` with symplectic similitude characters `ν` and `νψ`, `ψ ≠ 1`, has `ψ` of finite
order and is reducible over a quadratic subfield of the field of `ψ` (BCGP21, Lemma 8.3.1, p. 246).

**Checks.**
- `Γ = ℤ/2 = {1, c}`, `Δ = 1`, `n = 1`, `ρ` trivial: the extensions are `r_a(c) = (a, 1) j`, `a ∈ k^×`,
  with `r_a(c)² = 1` and `ν(r_a(c)) = −1`, and `(x, y) ∈ 𝒢₁⁰(k)` conjugates `r_a` to `r_{x²a/y}`. Over
  `ℚ₃` the parameters `1` and `2` give different `GL₁(ℚ₃) × {1}`-classes (`2` is not a square in
  `ℚ₃`) but one `𝒢₁⁰(ℚ₃)`-class, by `(x, y) = (1, 2)`.
- For `k` algebraically closed, or perfect of characteristic `2`, `k^×/k^{×2} = 1` and the extension
  is unique up to `GL_n(k) × {1}`-conjugacy; over `ℝ` there are two classes, in rank one the `r_{±1}`
  of the previous check, whose pairings `⟨x, x⟩ = ±x²` have opposite signs.
- In rank one an alternating pairing `uxy` has `u = ⟨1, 1⟩ = 0` and is not perfect over a nonzero
  ring, while over `F₂` the pairing `xy` is perfect and antisymmetric but not alternating: (3) needs
  alternation, not antisymmetry.

**Operations.** For `F` imaginary CM, `δ = δ_{F/F⁺}` and inputs polarised at the same `c_v`, define
the dual `(ρ^∨, μ⁻¹, ε)`; the twist `(ρ ⊗ χ, μ · (χ ∘ Ver), ε)` with the same pairing
(`(χ ∘ Ver)|_{G_F} = χχ^c` and `(χ ∘ Ver)(c_v) = χ(c_v²) = 1`); the tensor product
`(ρ ⊗ ρ', μμ'δ, εε')` with the product pairing; the exterior power `(∧^k ρ, μ^k δ^{k−1}, ε^k)` with
the determinant pairing `det⟨x_i, y_j⟩` over any `A`; the symmetric power
`(Sym^k ρ, μ^k δ^{k−1}, ε^k)` with the permanent pairing `(1/k!) Σ_s ∏ ⟨x_i, y_{s(i)}⟩` for
`k! ∈ A^×`; orthogonal sums for equal `μ, ε`; restriction to `L = L⁺F` at the place of `L⁺` where
`c_v` is a conjugation; and coefficient extension. All satisfy the CM sign condition. For `F` totally
real, `δ = 1`, the twist multiplier is `μχ²` and there is no sign condition; the type sign
`ε_v μ(c_v)` is multiplicative under `⊗` and raised to the `k`-th power. In form (a) the multipliers
are characters of `Γ` prescribed on `Δ` and at `c`, which exist for index two and not in general
(BLGGT, §1.1, p. 12).

**Checks.**
- The sign of a tensor product is the product of the signs.
- Twisting by the trivial character returns the polarisation.
- With multiplier `μμ'` instead of `μμ'δ` and `2 ≠ 0`, the tensor product violates the sign condition.

**Oddness and balance.** Define *PolarizedRep.IsTotallyOdd*: `ε_v := μ(c_{v₀} c_v) ε_{v₀} = 1` in `A`
at every real `v` of `F⁺`. For every commutative `A`, the involution identities give
`μ(c_{v₀}c_v)² = μ(c_{v₀})² μ(c_v)² = 1`. The unsquared identity `μ(c_{v₀}c_v) = 1` is automatic
over a reduced ring with `2 = 0`, but need not hold over `F₂[t]/t²`, where `(1 + t)² = 1 ≠ 1 + t`;
for `F` imaginary total oddness is `μ(c_v) = −1` for all `v`. Define
oddness of a similitude-valued `r`: for `r : G_{F⁺} → 𝒢_n(A)` with `r⁻¹(𝒢_n⁰) = G_F`, or
`GSp_{2m}`-valued, odd iff `ν(r(c_v)) = −1`; `GO_n`-valued: `+1` (both say `ε_v = 1` for
`B = ⟨·, ρ(c_v)·⟩`). A character of a totally real field is totally odd if `μ(c_v) = −1` (§4.1,
*IsTotallyOddChar*). Define *GaloisRep.IsBalancedAt* (for `2 ≠ 0`): the `±1`-eigenspaces of `ρ(c_v)`
have dimensions `a, b` with `|a − b| ≤ 1`; prove that this holds iff `tr ρ(c_v) = a − b ∈ {−1, 0, 1}`
in characteristic `0` or for `ℓ > n + 1` (`n` even), `ℓ > n` (`n` odd); that for `n ≥ 1` and `2 ≠ 0`,
`dim H⁰(⟨c_v⟩, ad⁰ V) = a² + b² − 1`, minimal iff balanced; and that for `n = 2`, balanced iff
`det ρ(c_v) = −1` (§4.1, *IsOddAt*) (BLGGT, §2.1, p. 31; ACC+, §1.2, p. 909; Calegari–Geraghty 2018,
§8.4, pp. 80–81; CG, §4, p. 812).

**Checks.**
- The cyclotomic character of a totally real field is totally odd; rank-two oddness and balance agree.
- The trivial representation of a plane over a field of characteristic `3` has `tr ρ(c) = 2 = −1` and
  is not balanced (`a = 2`, `b = 0`): the bound `ℓ > n + 1` is sharp.
- Over a reduced ring with `2 = 0` totally odd is automatic. Over `F₂[t]/t²`, take
  `Γ = C₂ × C₂`, `Δ` the second factor, `c` the first generator, `ρ` of the second generator
  `diag(1,1+t)`, the standard perfect alternating pairing, `ε = −1` and multiplier taking the
  generators to `1` and `1+t`. Every multiplier value squares to one, but the involution `cc'`
  for the second generator `c'` has transported sign `1+t ≠ 1`, so total oddness fails.

**Symmetric powers of a symplectic plane.** Prove that for a field `F` with `2, d! ∈ F^×`,
`n = d + 1`, `V = F²` with an alternating perfect `h` and `r` with multiplier `det r`, the form
`B_d(u_1 ⋯ u_d, w_1 ⋯ w_d) = (1/d!) Σ_s ∏ h(u_j, w_{s(j)})` is perfect on `Sym^d V`, covariant with
multiplier `(det r)^d`, of symmetry `(−1)^d`, with `B_d(v_i, v_{d−i}) = (−1)^i / binom(d, i)` for
`v_i = x^{d−i} y^i` in a symplectic basis `x, y` normalized by `h(x, y) = 1`; so `Sym^d r` lands in `GSp` (`d` odd) or `GO` (`d` even), identified
with `G_n` by `Pᵀ B_d P = J_n` (`n` even) or `Pᵀ B_d P = c · 1_n` (`n` odd, `F` finite of odd
characteristic; otherwise an extra hypothesis). For `d! ∉ F^×` the `d!`-scaled form is degenerate
(`d! B_d(v_0, v_d) = d! = 0`); for `p = d = 7` no invariant perfect form on `Sym⁷` exists, for
`d = 2p − 1` one does (BCG, proof of Thm 2.1, p. 513).

**Checks.**
- For `d = 1`, `B_1 = h`; with `h = 2 det` in the standard basis, `B_1(x,y) = 2`.
- In a normalized symplectic basis and `d = 2`, `B_2(x²,y²) = 1` and `B_2(xy,xy) = −1/2`.
- Rescaling `h` by `a ≠ 0` rescales `B_d` by `a^d`, while preserving perfectness.

**Representations from determinants.** Prove, through IntegralHeckeAndGaloisDeterminants Layer 1, that
an `n`-dimensional continuous determinant `D` on `A[Γ]` comes from a representation (a) for `A = k`
algebraically closed (`F̄_p` discrete, `ℚ̄_ℓ`): a continuous semisimple `ρ` with `det ∘ ρ = D`, unique
up to isomorphism (§1.2 of that roadmap); (b) for `A` complete local Noetherian with finite residue
field and `D̄` absolutely irreducible: a continuous `ρ : Γ → GL_n(A)`, unique up to conjugacy (§1.3
and §1.7). Prove that for every operation `Φ` of §§7.1–7.2, `det ∘ Φ(ρ)` depends only on `D` (for
`n ≥ 1`, `det(X − ad ρ(g)) = (X − 1) det(X − g | ad⁰) = (X − 1) det(X − g | ad/A·1)`; `n = 0` gives
`1`). Prove that in (b), in the CM/index-two case `c_v ∉ G_F`,
`2 ∈ A^×` and `D^c = D^∨ · μ|_{G_F}` give a polarisation of multiplier `μ` or
`μδ_{F/F⁺}`, the pairing unique up to `A^×`; for `2 ∉ A^×` a covariant perfect pairing with
`⟨y, x⟩ = ε⟨x, y⟩`, `ε ∈ μ_2(A)`, gives a CHT triple of multiplier `μη`, `η(c_v) = −εμ(c_v)⁻¹`, and
`μ_2(A) ⊋ {±1}` is possible. Nothing is asserted for residually reducible `D` (CHT, Lemma 2.1.4, p.
9). *Needs:* IntegralHeckeAndGaloisDeterminants Layer 1 (§§1.2, 1.3, 1.7).

**Checks.**
- For a CM field with `2 ∈ A^×`, the trivial rank-one determinant and initial multiplier `1`
  give a polarisation with multiplier `δ_{F/F⁺}`; multiplier `1` violates the CM sign condition.
- For a totally real field, the trivial rank-one determinant, multiplier `1` and pairing `xy`
  already give a polarisation; there is no index-two coset to which the CHT extension applies.
- In characteristic two the CM trivial rank-one representation with multiplier `1` has the
  perfect symmetric pairing `xy` and satisfies the CM sign identity `1 = −1`; it is not alternating.

### 7.5 `GSp₄`-valued representations

**`GSp₄`-valued representations.** Define `GSp4Rep` (`F` a number field; `2 ∈ A^×` where used): a
continuous `r : G_F → GSp₄(A)` with similitude `ν ∘ r`; *GSp4Rep.IsOdd* iff `ν(r(c_v)) = −1` at every
real `v` (over a field with `2 ≠ 0`, `r(c_v) ∼ diag(1, 1, −1, −1)` with both eigenspaces Lagrangian
and `dim H⁰(⟨c_v⟩, ad⁰ r) = 4`); `ad r = gsp₄` of rank `11` and *GSp4Rep.adZero* `r = sp₄ = Lie PGSp₄`
of rank `10` (on `skewAdjointMatricesSubmodule J₄`), not the trace-zero `sl₄`. Prove that for
`2 ∈ A^×`, `ad r = ad⁰ r ⊕ A` with trivial action on `A · 1` (not `⊕ ν`) and
`ad⁰ r ≅ Sym² r ⊗ (ν ∘ r)⁻¹`, self-dual (BCGP21, §7.5.16, p. 202, gives the symplectic
identity; `V^∨ ≅ V ⊗ ν⁻¹` supplies the similitude twist). Symplectic induction: for `K/F` quadratic, `σ ∉ G_K` and
`ρ : G_K → GL(V)` of rank two over a field with `det ρ = χ|_{G_K}`, on `W = V ⊕ σV` with `V ⊥ σV` and
`⟨σv_1, σv_2⟩ = ±χ(σ)⟨v_1, v_2⟩`, each sign gives a representation of `G_F` into `GSp(W)`, with
similitude characters `χ` and `χη_{K/F}`; and `ad⁰(Ind ρ)|_{G_K} ≅ (ρ ⊗ ρ^σ)χ⁻¹ ⊕ ad⁰ρ ⊕ ad⁰ρ^σ`,
`ad⁰(Ind ρ) ≅ As(ρ) ⊗ ν⁻¹ ⊕ Ind ad⁰ρ` for the chosen similitude `ν`. Its API is oddness, the adjoints,
the `Sym²` isomorphism, symplectic induction and its `GL₄` image, the adjoint of an induction, and
change of the Gram matrix (BCGP21, §2.2, pp. 17–18; CG, §4, p. 813; CGH, Thm 1.1). *Needs:* §7.1, §7.3;
`ResidualImage.matrixRep`, *ResidualImage.matConjRep*.

**Checks.**
- An odd `r` over a field with `2 ≠ 0` has `r(c)` with eigenvalues `1, 1, −1, −1`.
- `ad r = ad⁰ r ⊕ A` with trivial action on the scalars; replacing the trivial summand by `ν` gives
  the wrong characteristic polynomial at an element with `ν ≠ 1`.
- The two symplectic inductions have similitudes `χ` and `χη_{K/F}`, and `GSp₂ = GL₂` recovers the
  rank-two case.

**Conjugacy.** Prove that for `L` algebraically closed with `char L ≠ 2` and semisimple `r, r'`, `r`
and `r'` are `GSp₄(L)`-conjugate iff they are isomorphic as `GL₄`-representations with
`ν ∘ r = ν ∘ r'` (BCGP21, Lemma 2.1.3, p. 17). The proof decomposes into isotypic components and uses
that on a semisimple representation with `r^∨ ≅ r ⊗ ν⁻¹`, the invariant perfect pairings with
multiplier `ν` restrict to each self-dual isotypic component as a form unique up to the centraliser,
alternating or symmetric according to the constituent and pairing dual non-self-dual constituents;
this classification of invariant forms is part of the target (Gan–Takeda 2011, Lemma 6.1, pp.
1859–1860, in characteristic zero).

### 7.6 Zariski closures, strong irreducibility, projective lifting

**Zariski closures and monodromy groups.** For `G` affine of finite type over a field `K` and
`Σ ≤ G(K)` a subgroup, its Zariski closure is the closed subgroup scheme defined by Tau Ceti's
`HopfIdeal.vanishingIdeal`
(`le_vanishingIdeal_iff`, `commutator_quotientPointsSubgroup_vanishingIdeal_le`). For `K` a Hausdorff
topological field and `ρ` continuous define the monodromy group `G_ρ` (the closure of `ρ(Γ)` in
`GL(V)`; intended signature *GaloisRep.monodromyGroup* `ρ : HopfIdeal K (coordinate ring of GL_n)`), its
geometric identity component `G_ρ⁰` (Tau Ceti's `FiniteTypeCommHopfAlgCat.identityComponent`),
`Γ⁰ = ρ⁻¹(G_ρ⁰(K̄))` open normal of finite index, and for `G_F` the component field `F_ρ⁰` with
`Gal(F_ρ⁰/F) ≅ π₀(G_ρ)(K̄)`. Prove that over an algebraically closed field the closure of `α(Σ)` is
`α(Σ̄)` for a homomorphism `α` of algebraic groups (images of closed subgroups are closed), the
closure of `[Σ, Σ]` is the derived group `D(Σ̄)`, the identity component has finite index, and in
characteristic zero a bijective homomorphism of algebraic groups is an isomorphism (Borel, *Linear
Algebraic Groups*, Ch. I, §§1–2); that closures commute with field extension; that in characteristic
zero a semisimple `ρ` has reductive `G_ρ⁰` (the unipotent radical acts trivially on a semisimple
faithful representation); that a connected reductive subgroup of `GL₂` irreducible on `K̄²` is `SL₂`
or `GL₂`; and that in characteristic zero over an algebraically closed field a closed
`G ⊂ PGL₂ × PGL₂` with surjective projections is the product or the graph of an algebraic
automorphism, in which case `Ad ∘ pr₁ ≅ Ad ∘ pr₂` on `sl₂` (NT26, proof of Lemma 2.2, p. 10). *Needs:*
Tau Ceti `HopfIdeal.vanishingIdeal`, `CommHopfAlgCat.hopfIdealOrderIsoClosedSubgroup`,
`FiniteTypeCommHopfAlgCat.identityComponent`; `TauCetiRoadmap.ReductiveGroups` layer 3 (closed
subgroups, identity component, `π₀`) and layer 6 (reductive groups, derived group, linear reductivity
in characteristic zero).

**Checks.**
- For finite image, `Γ⁰ = ker ρ` and the component field is the field of `ρ`.
- The subset `{2} ⊂ G_m(ℚ)` closes to the point `2`, which excludes the identity; the
  subgroup generated by `2` is infinite and Zariski dense in `G_m`.
- `χ_ℓ` over `ℚ_ℓ` has infinite image and Zariski-dense image in `G_m` (vanishing ideal `0`).
- In the full product `PGL₂ × PGL₂`, `(diag(2, 1), 1)` acts on the first adjoint with eigenvalues
  `2, 1, 1/2` (conjugating `E₁₂` gives `2E₁₂`) and trivially on the second, so the two adjoints are
  not identified; over `F̄_p` the graph of Frobenius has bijective projections on points but is not
  the graph of an isomorphism of algebraic groups, so the algebraic statement needs characteristic
  zero.

**Goursat for `PGL₂`.** Prove that a subgroup of `PGL₂(Ω) × PGL₂(Ω)`, `Ω` algebraically closed, with
both projections surjective is the product or the graph of an abstract automorphism; this specialises
Mathlib's `Subgroup.goursat` using the simplicity of `PSL₂(Ω)` (NT26, proof of Lemma 2.2, p. 10).

**Strong irreducibility.** Define *GaloisRep.IsStronglyIrreducible* `ρ` (`ρ|_{Γ'}` irreducible for every
open `Γ' ≤ Γ`; for `G_F`, every finite separable `L/F`) and *GaloisRep.IsAbsStronglyIrreducible*
(after `⊗ K̄`). Prove that strong irreducibility implies irreducibility and passes to open subgroups,
the characterisation through finite extensions for the ordinary and absolute predicates.
Prove coefficient-extension invariance for absolute strong irreducibility. Prove that for
`K` Hausdorff of characteristic zero and `ρ` semisimple, absolute strong irreducibility holds iff
`G_ρ⁰` acts irreducibly on `V ⊗ K̄` (NT26, §2, p. 10).

**Checks.**
- Dimension one is strongly irreducible.
- An irreducible induced representation `Ind_{G_K}^{G_F} χ` is not strongly irreducible (reducible on
  `G_K`).
- A representation with finite image is strongly irreducible only in dimension one (restrict it to the
  kernel).
- For the unramified quadratic extension `E/ℚ₃`, multiplication by `1 + 3O_E` on `E` is
  irreducible on every open subgroup: those operators generate the field `E`. After extending
  coefficients to `E`, `E ⊗_{ℚ₃} E ≅ E × E` splits it into two characters. Ordinary strong
  irreducibility is not invariant under coefficient extension.

**Roots of characters.** Prove that for `Γ` profinite, `χ : Γ → ℚ̄_ℓ^×` continuous and `m ≠ 0`,
`χ = χ₁^m χ₀` with `χ₀` of finite order (`χ₁` needs the algebraic closure) (Pat, Lemma 2.3.15, p. 31).

**Checks.**
- `Γ = ℤ/2`, `χ` the sign character, `m = 2`: `χ₁(g)² = χ₁(g²) = 1 ≠ −1`, so `χ₀` cannot be dropped.
- For `χ = χ_ℓ` and `m = 1`, `χ₁ = χ_ℓ`, `χ₀ = 1`.
- For `χ` of finite order, `χ₁ = 1` and `χ₀ = χ` works.

**Finite-kernel lifting obstruction.** Let `Γ` be profinite and
`1 → C → E → G → 1` a central extension of Hausdorff topological groups, with `C` finite
discrete, its inclusion a topological embedding, and the continuous surjection `E → G` an
open quotient map admitting local continuous sections. For continuous `P : Γ → G`, pull back
the extension to `Γ`. A finite clopen refinement of its local sections gives a normalized global
continuous section `s`. Prove that `s(g)s(h)s(gh)⁻¹` is a continuous finite-valued factor set,
using the kernel's subspace topology, and define its class in continuous `H²(Γ,C)` with trivial
discrete coefficients. Prove independence of section, compatibility with restriction and finite
coefficient pushouts satisfying these topology hypotheses, and vanishing iff a continuous
homomorphic lift exists (Pat, Proposition 2.1.4 and proof, p. 17; Tau Ceti
`GroupExtension.continuous_factorSet` and `GroupExtension.continuous_sectionDiff`,
`Topology/Algebra/GroupExtension/Profinite.lean`). *Needs:* ProfiniteCohomology Layers 2 and 10;
RepresentationTheory/InductionRestriction Layer 7's factor-set algebra; these pinned continuity
declarations. The pushout classes pass to filtered colimits of discrete coefficients.

**Checks.**
- The split extension `C × Γ` gives the zero class and its canonical continuous lift.
- For `Γ = ℤ/2`, the extension `ℤ/4 → ℤ/2` with kernel `ℤ/2` has nonzero obstruction for
  the identity map: no element of order dividing two maps to the generator.
- A normalized continuous cocycle into discrete `C` is identically one on `U × U` for some
  open subgroup `U`. In contrast, the extension of `ℤ₃²` by `ℚ̄₃^×` with multiplication
  `(a,x,y)(b,x',y') = (ab 4^(xy'),x+x',y+y')` and its usual 3-adic topology has commutator
  `4^(xy'−x'y)`. Every open subgroup contains `3^Nℤ₃²`, whose two coordinate generators
  have commutator `4^(3^(2N)) ≠ 1`. It admits a continuous section but no homomorphic
  splitting on any open subgroup; it lies outside the finite discrete obstruction theorem.

**Idelic torsion-character extension.** For a number field `F`, `n ≥ 1` and a continuous
character `ω : μ_n(𝔸_F)/μ_n(F) → S¹`, prove that a finite-order continuous Hecke character
extending `ω` exists iff its restriction to `μ_n(F_v)` is trivial at every complex place.
Real-place signs are allowed. Construct the extension on GlobalNumberFields' idele-class
carrier, including extension from the image of idelic torsion to the full `n`-torsion of the
idele class group; in the Grunwald–Wang special case this intermediate extension need not be
unique. Establish the unit relations and finite-order criterion needed for the extension
(Pat, Lemma 2.3.6 and proof, pp. 27–28). *Needs:* GlobalNumberFields Layers 6–7 and 9–10
(idele norm structure, ray-class characters, infinity types and unit relations).

**Checks.**
- The trivial `ω` extends to the trivial Hecke character for every `F` and `n`.
- Over `ℚ` with `n = 2`, the product of the signs on the real and the 2-adic roots of unity
  is trivial on diagonal `μ₂(ℚ)` and extends to the finite-order character of conductor `4`.
- Over `ℚ(i)`, the product of the signs on `μ₂` at the complex place and one finite place
  descends through diagonal `μ₂(F)` but has no finite-order extension: a continuous
  finite-order character on the connected group `ℂ^×` is trivial.

**Projective lifting.** Prove that `H²(G_F, ℚ/ℤ) = 0` for `F` a number field (Tate). For trivial
discrete coefficients and `n ≥ 1`, local duality identifies `H²(G_K, ℤ/n)` with
the dual of `μ_n(K)` only for finite extensions `K/ℚ_p`. At archimedean places prove separately
`H²(G_ℂ, ℤ/n) = 0` and `H²(G_ℝ, ℤ/n) ≅ (ℤ/n)/2(ℤ/n)`. For `n | m`, the coefficient inclusion
`ℤ/n → ℤ/m`, `a ↦ (m/n)a`, is dual at nonarchimedean places to
`μ_m(K) → μ_n(K)`, `ζ ↦ ζ^{m/n}`, and induces that same coefficient map on the real quotients.
Prove these compatibilities before taking the direct limit: local roots of unity are finite for
`K/ℚ_p`, the real classes die under `ℤ/n → ℤ/(2n)`, and complex classes vanish
(Pat, Thm 2.1.1 and proof, pp. 15–16; for the real computation, Mathlib's
`Rep.FiniteCyclicGroup.groupCohomologyIsoEven` with the trivial `C₂`-action).

Prove the global bridge using ClassFieldTheory's Brauer sequence and the idelic torsion-character
extension above. For each prime `p`, restrict to `F(μ_p)` and use restriction–corestriction of
prime-to-`p` degree. When `μ_p ⊂ F`, identify `H²(G_F,ℤ/p)` with `Br(F)[p]` and prove
surjectivity of the boundary `H¹(G_F,ℚ_p/ℤ_p) → Br(F)[p]` from
`0 → ℤ/p → ℚ_p/ℤ_p → ℚ_p/ℤ_p → 0`. Local character restrictions on `μ_p(F_v)` encode the
local Brauer classes; the sum of local invariants makes the assembled character trivial on
diagonal `μ_p(F)`, and the complex components are trivial. Extend it to a finite-order Hecke
character, project to its `p`-primary part, use global reciprocity, and compare boundaries using
injectivity of the Brauer localization. Multiplication by `p` is consequently injective on the
`p`-primary torsion group
`H²(G_F,ℚ_p/ℤ_p)`, which must vanish. This proves global vanishing in addition to the local
direct-limit calculations (Pat, Theorem 2.1.1 and proof, pp. 15–16).

For a surjection `H' → H` of linear algebraic groups over `ℚ̄_ℓ` with central torus kernel `S`,
prove that every continuous `P : G_F → H(ℚ̄_ℓ)` has a continuous lift. Reduce by a flag in `S`
to `S = G_m`. Construct an algebraic isogeny complement `H'_1` with
`H'_1 ∩ S = μ_{n₀}`; for `n₀ | n`, the subgroup `H'_n = H'_1 S[n]` surjects onto `H` with
finite central kernel `μ_n`. Establish the local continuous sections for these finite isogenies
on their `ℓ`-adic points (over finite coefficient extensions) and apply the finite-kernel
obstruction above. The classes `c_n ∈ H²(G_F,ℤ/n)` use the trivial action on coefficient roots
of unity and are compatible with `a ↦ (m/n)a` for `n | m`. Their colimit is zero by Tate
vanishing, so some finite stage lifts `P` (Pat, Proposition 2.1.4 and proof, p. 17).
Two lifts differ by a continuous `S(ℚ̄_ℓ)`-valued character. For `P` unramified almost everywhere,
the lift obtained by this finite-kernel reduction is unramified almost everywhere
(Pat, Remark 2.1.5, p. 17, and proof of Lemma 2.7.4, p. 49).
For `n ≥ 1`, specialize to `GL_n → PGL_n`, with isogeny complement `SL_n`.
*Needs:* the finite-kernel obstruction and idelic torsion-character extension above;
ClassFieldTheory Layer 5 (local duality and Brauer invariants), Layer 10
(`eq_zero_of_localInv_eq_zero`, `sumLocalInv_eq_zero`) and Layers 11–12 (global reciprocity);
ProfiniteCohomology Layers 2 and 10 (continuous cohomology and filtered discrete-coefficient
colimits); ReductiveGroups Layers 0, 3 and 6–7 (linear algebraic groups and central tori).
*Lean:* `GaloisRep.exists_linear_lift`, continuous for `GaloisRep.projectiveTopology`, the quotient
topology on `PGL_n(ℚ̄_ℓ)`.

**Checks.**
- `G_ℂ = 1` gives `H²(G_ℂ, ℤ/2) = 0`, while `μ₂(ℂ)` has order two.
- `H²(G_ℝ, ℤ/2) ≅ ℤ/2` and `H²(G_ℝ, ℤ/3) = 0`; the inclusion `ℤ/2 → ℤ/4` sends the
  first class to zero in `(ℤ/4)/2(ℤ/4)`.
- For `K = ℚ₃`, `μ₂(K) = {±1}` gives nonzero `H²(G_K, ℤ/2)`; the map to `H²(G_K, ℤ/4)`
  is zero because the dual squaring map on `μ₄(ℚ₃) = {±1}` is trivial.
- For `GL_n → PGL_n`, the stages are `SL_n μ_m` for `n | m`, with kernel `μ_m`.
  Centrality makes the action on these coefficient roots trivial, independently of the
  cyclotomic action on field-theoretic roots of unity.

**Logarithm and Lie comparison.** Let `Γ` be profinite and `r,s` continuous finite-dimensional
representations over a finite extension `E/ℚ_p`, with
`charpoly(r(g))(s(g)) = 0` for every `g`. On the common compact image in `GL(V_r) × GL(V_s)`,
construct a sufficiently small open subgroup with convergent matrix logarithm and exponential
as inverse analytic charts. Its Lie algebra maps to both matrix Lie algebras; prove
`charpoly(dr(X))(ds(X)) = 0` for every `X` there by applying the group identity to small powers
and comparing exponential eigenvalues and their multiplicities. Extend scalars to a splitting
field for the weight argument. For each irreducible subquotient of `s`, prove after finite
restriction that its Lie action factors through the Lie image of `r`: the kernel acts by
nilpotents, and a nilpotent ideal in the reductive image of an irreducible representation acts
trivially. Relate Lie-stable subspaces and intertwiners to those on an open group subgroup
(Nekovář, Proposition 3.10, proof Steps 1–2, pp. 1197–1198; Schneider, *p-adic Lie Groups*,
Chapters 4–5). *Needs:* §1.5 for coefficient descent; §7.6's monodromy and reductivity target;
ReductiveGroups Layer 2 for Lie algebras. The matrix analytic charts are supplied by §5.8; the Lie comparison is built here.

**Checks.**
- A direct sum of copies of `r` satisfies both the group and Lie annihilation identities.
- For a trivial rank-one `r`, the group identity forces `s(g) = 1`; a nontrivial unipotent extension of
  trivial characters fails it, despite having trivial semisimplification.
- Logarithm is taken on a small open subgroup: a finite-order element can have logarithm zero,
  so Lie comparison alone cannot identify the action of the full component group.

**Minuscule weights and extension splitting.** Over an algebraically closed characteristic-zero
field, prove the weight-containment criterion for a reductive Lie algebra: if a finite-dimensional
module has every generalized weight among those of a fixed simple minuscule module (including central weights),
its simple constituents are copies of that module. Prove the product form needed for the two
standard `sl₂` modules, using the decomposition of a Lie subalgebra surjecting onto simple
factors into diagonal simple factors (Lie Goursat). Combine the logarithm comparison with
Nekovář's extension argument: for a continuous absolutely strongly irreducible minuscule `r` over
`ℚ̄_p`, a continuous nonzero `s` satisfying the full group annihilation identity is semisimple
and a sum of copies of `r`. For the index-two induced symplectic case below, prove the corresponding
self-extension splitting on the two standard constituents, the identification
`(SL₂ × SL₂)/μ₂ ≅ SO₄`, and the extension criterion for `O₄ = SO₄ ⋊ ⟨τ⟩`. These are the
Lie and form inputs of the two criteria below (Nekovář, Propositions 1.6, 2.2,
Theorem 3.7 and Proposition 3.10(3), pp. 1183–1198; BCGP25, proof of Proposition 4.11.2,
pp. 110–112). *Needs:* logarithm and Lie comparison; ReductiveGroups' root/weight and
semisimple Lie theory; pinned `TauCeti.IsMinuscule` and
`TauCeti.IsMinuscule.exists_weylGroup_smul_eq` (HighestWeight/Minuscule); §7.5 for invariant forms; §1.12 for finite-index constituents.

**Checks.**
- The standard `sp₄` module is minuscule; its allowed weights identify its simple constituents.
- For `sl₂`, the trivial module's weight `0` occurs in `Sym² Std`, although it is not a
  constituent. This weight-containment implication fails without the minuscule hypothesis.
- A nonsplit self-extension of a trivial character has an extra Jordan block and fails the full
  annihilation identity; matching characteristic polynomials of semisimplifications does not split it.

**Semisimplicity criteria.** Let `n ≥ 1`, `ρ : G_ℚ → GSp₄(ℚ̄_p)` and `s : G_ℚ → GL_n(ℚ̄_p)` be continuous with
`P_ρ(g)(s(g)) = 0` for all `g` (§5.11). Prove that if the Zariski closure of `ρ(G_ℚ)` contains `Sp₄`,
then `s ≅ ρ^{⊕m}` for some `m ≥ 1` (BCGP25, Prop. 4.11.1, pp. 109–110; Nekovář 2018, Prop. 3.10(3), pp.
1196–1198), using the logarithm/Lie comparison and minuscule/extension-splitting subtargets above. Suppose instead the
closure contains `SL₂ × SL₂`, `ρ` is absolutely irreducible and `ρ|_{G_E} = ϱ ⊕ ϱ^c` for an index-two
`G_E`, with similitude `ν` and `det ϱ = ν|_{G_E}`. Prove that every irreducible subquotient of
`s|_{G_E}` is `ϱ` or `ϱ^c`; that `s|_{G_E}` has no non-split self-extension of `ϱ` or `ϱ^c`; that for
`g ∉ G_E` the characteristic polynomial of `g` on `As(ϱ) ⊗ ν⁻¹` is `(X² − 1)(X² − tX + 1)`,
`t = tr ϱ(g²)/ν(g)`, with eigenvalues `1, −1, λ, λ⁻¹`; and that `s ≅ ρ^{⊕m}`, `m ≥ 1` (BCGP25, Prop.
4.11.2 and proof, pp. 110–112, with the eigenvalue list corrected). The induced case uses the
representation theory of `SL₂ × SL₂`, the identification `SL₂ × SL₂ / μ₂ ≅ SO₄` and the splitting
criterion for extensions inside `O₄ = SO₄ ⋊ ⟨τ⟩`, from the preceding subtarget. *Needs:* §5.11; §7.5;
the Zariski closures, logarithm/Lie comparison and minuscule/extension-splitting subtargets above; §1.12.

**Checks.**
- `s = ρ^{⊕m}` satisfies the identity for every `m ≥ 1`.
- The zero representation satisfies the identity but corresponds to `m = 0`, hence `n ≥ 1`
  is essential for the stated positive multiplicity.
- In the induced case the Asai polynomial at `g ∉ G_E` has both `1` and `−1` as eigenvalues;
  omitting either factor fails the extension comparison.

### 7.7 Finite-group cohomology and descent

**Restriction and coefficients.** Prove that for `k` a commutative ring, `S ≤ G` of finite index
`n ∈ k^×` and `A ∈ Rep k G`, a 1-cocycle that is a coboundary on `S` is one on `G`, so
`H¹(G, A) → H¹(S, A)` is injective, `H¹(G, A) = 0` for `#G ∈ k^×`, and in characteristic `p`
restriction to a subgroup containing a Sylow `p`-subgroup is injective (BLGG, Rem. A.1.2, p. 29).
Prove that for fields `k ⊆ k'`, `M` finite-dimensional and `M' = M ⊗ k'`: `(M')^G = M^G ⊗ k'`;
`H¹(G, M') = 0` gives `H¹(G, M) = 0`; `H⁰ = H¹ = 0` over `k` gives `H¹(G, M') = 0`; and for `G` finite
`H¹(G, M') ≅ H¹(G, M) ⊗ k'`. Proof: with a `k`-basis `(e_b)` of `k'` containing `e_0 = 1`, the
`G`-module `M'` is `⊕_b M ⊗ e_b`, so cocycles and coboundaries split into coordinates; comparing
`e_0`-coordinates shows that a `k`-valued cocycle which is an `M'`-coboundary is an
`M`-coboundary; when `M^G = 0`, finitely many `g_1, …, g_r` have `⋂ ker(g_i − 1) = 0` on `M`, so
the primitives of the coordinates of an `M'`-cocycle vanish outside the finitely many `b` met by
its values at the `g_i`; for `G` finite the inhomogeneous cochains satisfy
`C^n(G, M') = C^n(G, M) ⊗ k'`, and `− ⊗_k k'` is exact. Prove that for `U ⊴ B` of index in
`k^×` acting trivially on `N`, restriction embeds `H¹(B, N)` into `Hom_B(U, N)` (Darmon–Diamond–Taylor
2007, proof of Lemma 2.48, p. 82). *Needs:* Mathlib `groupCohomology`.

**Borel subgroups and symmetric powers.** Let `F = F_q`, `q = p^r`, `T'` a subgroup of the diagonal
torus, `U` the unipotent radical, `B = T'U`, `0 ≤ k ≤ p − 1`, `M = Sym^k(F̄_p²) ⊗ det^j`, with
`diag(a, d)` scaling `x^{k−i} y^i` by `χ_i = a^{k−i+j} d^{i+j}`; a resonance is a pair `(i, s)` with
`0 ≤ i ≤ k` and `0 ≤ s < r` such that `χ_i = (a/d)^{p^s}` on `T'`. Prove that if there is no resonance, or `T'` is non-scalar and every
resonance has `s = 0` and `i < k`, then `H¹(B, M) = 0`, hence `H¹(G, M) = 0` for `B ≤ G ≤ GL₂(F)` with
`p ∤ [G : B]`; for `SL₂(F)` and `j = 0` the resonances are `k − 2i ≡ 2p^s mod (q − 1)`, so `p ≥ 5` and
(`r ≥ 2` or `k ≠ p − 3`) give `H¹(SL₂(F), Sym^k) = 0` (for `r = 1`, `k = p − 3` the resonance is
`i = k`); for `GL₂(F_p)`, `p ≥ 5`, `k = 2`, `j = −1` the only resonance is `i = 0`, so
`H¹(GL₂(F_p), ad⁰) = 0` (CHT, proof of Cor. 2.5.4, p. 57).

**Checks.**
- For `GL₂(F_p)`, `p ≥ 5`, `k = 2`, `j = −1`, the resonance is `(0,0)`; `s = 1` is
  outside `0 ≤ s < r = 1`, although `a^p = a` on `F_p`.
- For `SL₂(F_p)` and `k = p − 3`, `(k,0)` is a resonance, and the sufficient criterion fails.
- For `T'` the full diagonal torus, `k = j = 0`, `p ≥ 5`, there is no resonance.

**`SL₂` with adjoint coefficients.** Prove that for `F` finite of odd characteristic with `#F ≠ 5`,
`H⁰(SL₂(F), ad⁰) = H¹(SL₂(F), ad⁰) = 0`; that `H¹(SL₂(F_5), ad⁰)` is one-dimensional,
`H¹(GL₂(F_5), ad⁰) = 0` and `H¹(GL₂(F_5), ad⁰ ⊗ det²)` is one-dimensional, so `H¹(G, ad⁰) = 0` for
projective image conjugate to `PGL₂(F_5)` and `≠ 0` for `PSL₂(F_5)`; and that for `n ≥ 2` and
`p > 2n + 1`, `H¹(SL₂(F), Sym^{2i}) = 0` for `1 ≤ i ≤ n − 1` (`2i < p − 3`; sharp at `p = 2n + 1`,
where `H¹(SL₂(F_p), Sym^{p−3}) ≠ 0`) (Darmon–Diamond–Taylor 2007, Lemma 2.48, p. 82; CHT, proof of
Cor. 2.5.4, p. 57).

**Galois descent of subspaces.** Prove that for `k'/k` Galois (possibly infinite) and `W' ⊆ V ⊗ k'`
stable under `1 ⊗ Gal(k'/k)`, `W' = (W' ∩ V) ⊗ k'`, which is `H`-stable and nonzero if `W'` is (ACC+,
proof of Lemma 6.2.30, p. 1044); and that for `char k = p ∤ #H` and `V` absolutely irreducible of
dimension `n ≥ 1`, `p ∤ n` (BLGG, Rem. A.1.2, p. 29). *Needs:* Mathlib
`InfiniteGalois.mem_bot_iff_fixed`.

### 7.8 Clebsch–Gordan in characteristic `p`

**Pieri and Clebsch–Gordan.** Prove that for `V` two-dimensional over a field and `r ≥ 2` invertible,
`V ⊗ Sym^{r−1}V ≅ Sym^r V ⊕ det ⊗ Sym^{r−2}V` naturally (multiplication split by `r⁻¹Δ`); this fails
over `F₂` for `r = 2` (§7.1). Prove that for `a ≥ b` and `(a + b)!` invertible,
`Sym^a V ⊗ Sym^b V ≅ ⊕_{i ≤ b} det^i ⊗ Sym^{a+b−2i}V`, so
`End(Sym^{n−1}V) ≅ ⊕_{i<n} Sym^{2i}V ⊗ det^{−i}` when `(2n − 2)!` is invertible, for every group (CHT,
proof of Lemma 2.5.2, p. 56).

**Modulo `p`.** For `V` two-dimensional over `k ⊇ F_p` perfect and `0 < r < p`, construct the
natural exact sequence
`0 → Frob V ⊗ Sym^{r−1}V → Sym^{p+r−1}V → det^r ⊗ Sym^{p−r−1}V → 0`,
where `Frob V` is the coefficient Frobenius twist and the first map multiplies `p`-th powers by
polynomials of degree `r−1`. Prove the resulting semisimplification formula
`(Sym^{p+r−1}V)^ss ≅ (det^r ⊗ Sym^{p−r−1}V)^ss ⊕ (Frob V ⊗ Sym^{r−1}V)^ss`
for every acting group. At `r = 1` the submodule is `⟨x^p, y^p⟩`. This `r = 1` sequence is
nonsplit as a rational representation of the algebraic group `SL₂` over `k` for every `p`; for
the standard action of the finite group `SL₂(F_p)` it is nonsplit when `p > 2` and splits when `p = 2`.
Restriction to a subgroup can split it. The polynomial action and submodule calculation are
Jantzen, *Representations of Algebraic Groups*, II.2.16, equations (4)–(7), pp. 185–186.
Prove also `(End Sym^{n−1}V)^ss ≅ ⊕_{i<n} (Sym^{2i}V ⊗ det^{−i})^ss` for all `n`, with an actual
isomorphism for `char k = 0` or `p > 2n − 2` (CHT, proof of Lemma 2.5.2, p. 56).

**Checks.**
- For `p > 2`, a transvection on `Sym^p V` has Jordan blocks of sizes `p,1`; a complement to
  `Frob V` for `SL₂(F_p)` would give sizes `2,p−1`, so the sequence is nonsplit.
- For `SL₂(F₂)`, `Sym² V = ⟨x²,y²⟩ ⊕ F₂·(x² + xy + y²)` is semisimple. This line is fixed
  by the finite group but not by the algebraic group: `y ↦ y + u x` changes its generator by
  `(u² + u)x²`, nonzero for `u ∉ F₂`.
- A trivial acting group splits the sequence as vector spaces; the semisimplified formula
  holds without a nonsplitting hypothesis.

**Irreducibility and one-dimensional constituents.** Prove that `Sym^a(F̄_p²)` is absolutely
irreducible for `SL₂(F)`, `0 ≤ a ≤ p − 1` (not `a = p`), so for `SL₂(F_p) ⊆ r̄(Γ)` and `1 ≤ n ≤ p`
every twist of `Sym^{n−1}r̄` is absolutely irreducible; that for `p ≥ 5` the one-dimensional
constituents of `Sym^{2i}`, `0 ≤ i ≤ p − 1`, have multiplicity `≤ 1` and occur only for `i = 0`,
`2i = p + 1` (`F = F_p` only: `V ⊗ V ⊇ ∧²V`) and `2i = 2p − 2`; and that for `p > 3`,
`r̄ : G_ℚ → GL₂(F̄_p)` with `SL₂(F_p) ⊆ r̄(G_ℚ)` and `ρ̄ = Sym^{n−1}r̄ ⊗ ψ`, every one-dimensional
constituent `χ` of `(ad ρ̄)^ss` has `χ² = 1`, so `H⁰(G_ℚ, M(1)) = 0` for every subquotient `M` of
`ad ρ̄` or its dual, in particular for `(𝔤⁰_n)^*`, `𝔤⁰_n = sp_n, so_n` (CHT, proof of Lemma 2.5.2, p.
56).

**Checks.**
- For `p > 2`, `Sym^p V` for `SL₂(F_p)` contains `Frob V = ⟨x^p, y^p⟩` without a complement.
  For `p = 2` it splits as in the preceding Checks.
- For `p = 3`, `Sym³(F̄_3²) ⊇ ⟨x³, y³⟩` is reducible, so the bound `a ≤ p − 1` is sharp.
- Over `F₂`, `V ⊗ V ≇ Sym²V ⊕ ∧²V` (§7.1), so Pieri needs `r` invertible.

### 7.9 Adequate subgroups

**Adequacy.** Let `char k = p > 0`, `n ≥ 1`, `H ⊆ GL_n(k)` (in the proposed interface any subgroup), `ad = M_n(k)`, `ad⁰` the
trace-zero matrices and `ad₀ = ad/k·1` (the natural map `ad⁰ → ad₀` is an isomorphism iff `p ∤ n`);
`g` is semisimple iff its
minimal polynomial is separable, and `e_{g,α}` is the projection to the generalised `α`-eigenspace.
Define *ResidualImage.adRep*, `ResidualImage.adZeroRep`, *ResidualImage.adQuotRep*,
*ResidualImage.IsSimpleStable*, *ResidualImage.IsEigenProjection* `e f α` (`e² = e`, range the maximal
generalised `α`-eigenspace of `f`, kernel the sum of the others), the trace condition
*ResidualImage.AdZeroTraceCondition* (every simple `k̄[H]`-submodule `W ⊆ ad⁰ ⊗ k̄` has
`tr(e_{g,α} W) ≠ 0` for some `g, α`), *ResidualImage.IsWeaklyAdequate* (the semisimple elements span
`M_n(k)`), `ResidualImage.IsAdequate` (`H¹(H, k) = 0`, `H⁰(H, ad⁰) = H¹(H, ad⁰) = 0`, and the trace
condition) and *ResidualImage.IsGHTAdequate* (`H¹(H, k) = 0`, `H¹(H, ad₀) = 0` and weak adequacy).
These three adequacy predicates include positive rank; the adjoint
carriers and the trace condition are defined also in rank zero. For finite `H`,
prove that `p ∤ n` follows from `H⁰(H, ad⁰) = 0` (`1 ∈ ad⁰` if `p | n`), and then adequate is
equivalent to GHT-adequate; that the spanning and trace forms agree without irreducibility (`e_{g,α}`
is a polynomial in the semisimple `g^{p^N} ∈ H`); that weak adequacy implies absolute irreducibility;
and that these standard equivalences and coefficient-extension, projective-image and
scalar invariance statements hold for finite `H` (scalar enlargement also finite); conjugation
preserves the predicates for arbitrary `H` (Th12, Def. 2.3, p. 7; GHT, §1, pp. 2–3; Th17, Def. 2.20, p. 14; BLGG, Def.
A.1.1, pp. 28–29).

**Checks.**
- `SL₂(F_7)` and `GL₂(F_5)` are adequate; `SL₂(F_5)` is weakly adequate but not adequate (`H¹ ≠ 0`);
  `SL₂(F_3)` is not (it has a quotient of order `3`).
- The trivial subgroup of `GL₂(k)` is not adequate (`H⁰(H, ad⁰) = ad⁰ ≠ 0`); finite rank-one image is adequate;
  `p | n ≥ 1` excludes adequacy.
- For `H = 1`, `n = 2` and `k = F₂`, both `ad⁰` and `ad₀` are three-dimensional trivial
  representations, hence are isomorphic; their natural comparison map has `k·1` in its kernel.

- `SL₂(F_4)` is GHT-adequate but not adequate (`2 | 2`), and using `ad⁰` in place of `ad₀` in the GHT
  definition fails.
- For `k = F_p(t)`, `H = ⟨t⟩ ⊂ GL₁(k)` has `H¹(H,k) = Hom(ℤ,k⁺) ≅ k`, so is not adequate,
  although the trivial subgroup with the same projective image is adequate. Adjoining infinite
  scalars can destroy adequacy, and the large-characteristic criterion requires finite `H`.
- In rank zero the raw trace and cohomology conditions are vacuous; the three adequacy
  predicates are false because they include positive rank.

**Adequacy criteria.** Throughout this target `H` and all representation images are finite and `n ≥ 1`.
Prove that `H` irreducible on `k̄^n`, with `H⁺` generated by elements of
`p`-power order and `d` the largest dimension of an irreducible `H⁺`-submodule, is adequate when
`p ≥ 2(d + 1)`, so every absolutely irreducible `H` is adequate when `p ≥ 2(n + 1)` (GHTT, Thm 9, pp.
71–72; Th12, Lemma 2.4(ii), p. 7), using the bounds on small-degree representations of finite groups
and on their extensions in GHTT's appendix, which are part of this target; that an absolutely
irreducible `H` with `p ∤ #H` is adequate (BLGG, Rem. A.1.2, p. 29); that `N ⊴ H` adequate with
`p ∤ [H : N]` gives `H` adequate (BLGG, Lemma A.1.3, p. 29); that `H` irreducible with `S ≤ H`
containing a Sylow `p`-subgroup and GHT-adequate is GHT-adequate (GHT, Rem. 6.1, p. 28); that `r₁(Γ)`
adequate, `r₂|_{ker r₁}` absolutely irreducible and `p ∤ #r₂(Γ)` give `(r₁ ⊗ r₂)(Γ)` adequate (BLGG, Lemma A.3.1,
p. 35; BCG, proof of Thm 3.1, p. 518); that for `p > 2` a finite irreducible `G ⊆ GL₂(F̄_p)` is
adequate unless `p = 3` with projective image `PSL₂(F_3)` or `p = 5` with `PSL₂(F_5)`, while
`PGL₂(F_5)` is adequate (GN, Lemma 3.2.3, p. 15; GHT, Cor. 9.5, p. 51; the case analysis is that
of BLGG, §A.2, pp. 30–35, with its binary polyhedral character and extension computations; the
statement of BLGG, Prop. A.2.1, p. 30, in arXiv v1 also lists `PGL₂(F_5)` among the exceptions,
which `H¹(GL₂(F_5), ad⁰) = 0` from §7.7 rules out); and that a nontrivial
absolutely irreducible representation `V` of `SL₂(F_{p^r})` is GHT-adequate unless `r = 1` and
`1 < dim V = (p ± 1)/2`, or `p^r ∈ {2, 3, 4}` and `dim V = p^r`, or `p^r = 9` and `dim V ∈ {3, 6, 9}`
(GHT, Cor. 9.4, p. 50). *Needs:* §7.7.
*Lean:* `ResidualImage.isAdequate_of_coprime_or_large`, `ResidualImage.isAdequate_tensor`;
`ResidualImage.pGenerated` is `H⁺`, the subgroup generated by the elements of `p`-power order.

**Checks.**
- A finite absolutely irreducible group of order prime to `p` is adequate by averaging.
- Over `F₅`, let `Γ = C₃`, `r₁ = 1` and let a generator act under `r₂` by
  `A = (0 4; 1 4)`. Then `A³ = 1` and `X² + X + 1` is irreducible over `F₅`, but
  `A + 3I = (3 4; 1 2)` is a nonzero trace-zero centralizer. Thus `r₂` is not absolutely
  irreducible and `r₁ ⊗ r₂` is not adequate despite its prime-to-five image.

- In rank one `⟨t⟩ ⊂ GL₁(F_p(t))` remains nonadequate for `p ≥ 5`; the finite-image hypothesis
  is essential even though the numerical bound holds.
- `SL₂(F₅)` fails adequacy, whereas `GL₂(F₅)` is adequate; the rank-two exceptional projective
  images distinguish these cases.

**Symmetric powers.** Prove: (1) for `p > 5`, `SL₂(F_p) ⊆ r̄(G_ℚ)` and `p − 2 ≤ n ≤ p`,
`(Sym^{n−1}r̄)(G_{ℚ(ζ_p)})` is GHT-adequate, and adequate for `n = p − 2, p − 1`; (2) for `p ≥ 5`
there is `a₀(p) ≥ 3` such that for `a ≥ a₀` and finite `G ⊆ GL₂(F̄_p)` containing a conjugate of
`SL₂(F_{p^a})`, for `0 < r < p` the images of `Sym^{r−1}` and of `φ_p Std ⊗ Sym^{r−1}` (coefficient
Frobenius on the first factor) are adequate, and every subgroup of index `< 2p` contains a conjugate
of `SL₂(F_{p^a})`; (3) for finite image with `SL₂(F_p) ⊆ r̄(Γ')` and `p ≥ 2n + 2`, `(Sym^{n−1}r̄)(Γ')`
is adequate. Clause (1) uses GHT, Cor. 9.4, p. 50, and the adequate/GHT-adequate
equivalence of §7.9 for `p ∤ n`; clause (2) is NT26, Lemma 2.3, p. 11; clause (3) uses the
large-characteristic criterion of §7.9 (GHTT, Thm 9).
*Needs:* for (1), §7.8 and §7.9's overgroup permanence and `SL₂` criterion, with §4.7 for
cyclotomic restriction; for (2), §7.8; for (3), §7.9's large-characteristic criterion and the
irreducibility of `Sym^{n−1}` on `SL₂(F_p)` in this range.

**Checks.**
- For `p = 7` and `n = 5, 6`, clause (1) gives adequacy; for `n = 7` it gives GHT-adequacy
  while adequacy fails because `p` divides the dimension.
- The `a = 1`, `p = 5`, `r = 2` case is excluded from clause (2): `SL₂(F₅)` is not adequate.
- For `n = 2`, `p = 7`, clause (3) applies; the case `p = 5` fails the bound `p ≥ 6`.

### 7.10 Enormous images

**Enormity.** For `n ≥ 1`, `k/F_p` algebraic and `H ⊆ GL_n(k)` absolutely irreducible, define
`ResidualImage.IsEnormous`: (1) no nontrivial quotient of `p`-power order; (2)
`H⁰(H, ad⁰) = H¹(H, ad⁰) = 0`; (3) every simple `k[H]`-submodule `W ⊆ ad⁰` has `W^h ≠ 0` for some
`h ∈ H` with separable characteristic polynomial (*ResidualImage.IsRegularSemisimple*). The predicate
includes positive rank and allows any field `k` with `p = ringChar k`; `k/F_p` algebraic is used where needed
(`⟨t⟩ ⊂ GL₁(F_p(t))` has quotient `ℤ/p`). Prove that `p | n` excludes enormity (`1 ∈ ad⁰`); that the
notion depends only on the image in `PGL_n` and is invariant under algebraic `k'/k`; that with all
eigenvalues in `k` it is Khare–Thorne's form and implies adequacy for finite `H`; and that for
`n = 2`, `p` odd and finite irreducible `H`, enormous is equivalent to adequate (ACC+, Def. 6.2.29,
Lemma 6.2.30, Rem. 6.2.31, pp. 1044–1045; KT, Def. 4.10, p. 22; GN, Rem. 3.2.2 and Lemma 3.2.3, p.
15).
*Lean:* `ResidualImage.isEnormous_iff_isAdequate_rankTwo`.

**Checks.**
- `SL₂(F_7)` is enormous; `SL₂(F_5)` is not (`H¹ ≠ 0`, everything else holds); `SL₂(F_3)` is not (a
  quotient of order `3`), so omitting (1) changes the notion.
- `p | n ≥ 1` excludes enormity; rank one is enormous.
- `Q₈ ⊗ Q₈ ⊂ GL₄` is adequate and not enormous: its eigenvalues are `±1, ±i`, never four distinct.

**Characteristic zero.** For `n ≥ 1`, `E/ℚ_p` finite and compact `H ⊆ GL_n(O_E)` define
*ResidualImage.IsEnormousCharZero*: every simple `E[H]`-submodule `V ⊆ M_n(E)` has `tr(e_{h,α} V) ≠ 0`
for some `h` with `n` distinct eigenvalues in `E` and an eigenvalue `α`; no cohomological or
`p`-quotient condition, and all of `M_n(E)`. Prove that it implies absolute irreducibility; that with
every `h ∈ H` having characteristic polynomial split over `E`, an enormous closed `H' ≤ H` makes
`H` enormous; and, under that same splitting hypothesis on every `h ∈ H`, that `H` is enormous if
the identity component of its Zariski closure (or its derived group) is absolutely irreducible and
contains regular semisimple elements. The splitting hypothesis makes the regular witnesses split
over `E`; geometric regular semisimplicity alone does not supply eigenvalues in `E`
(NT23, Def. 2.23, Rem. 2.24, Lemmas 2.25 and 2.28, pp. 20–23;
NT26, Lemma 4.7, p. 33).

**Checks.**
- `SL₂` with `h = diag(a, a⁻¹)`, `a² ≠ 1`, is enormous.
- The diagonal torus is not (reducible).
- Rank one is enormous.
- For `E = ℚ₃`, `Q = x² + y² + 3z²` is anisotropic and `SO(Q)(ℚ₃)` preserves `ℤ₃³`, hence is
  compact. Its connected Zariski closure acts absolutely irreducibly and has geometrically
  regular semisimple elements, but an `E`-eigenvalue must satisfy `λ² = 1` by preservation of `Q`.
  No element has three distinct eigenvalues in `E`, so this group is not enormous over `E`.

**Enormous symmetric powers.** Prove that for `n ≥ 2`, `p > 2n + 1`, `k' ⊆ k` finite and
`k^× · Sym^{n−1}GL₂(k') ⊇ H ⊇ Sym^{n−1}SL₂(k')`, `H` is enormous (GN, Lemma 3.2.5, p. 15; CHT, Cor.
2.5.4, p. 57; the printed bound `l > 2n − 1` fails for `n = 2`, `l = 5`); that for `n ≥ 2`,
`l > 2n + 1` and finite `H ⊆ GL₂(F̄_l)` containing `SL₂(F_l)`, `Sym^{n−1}H ⊆ GL_n(F̄_l)` is enormous
(ACC+, Lemma 7.1.4, p. 1089); that for `F/ℚ` finite with normal closure `F̃`, `m ≥ 1`, `l > 2m + 3`,
`r̄(G_{F̃}) ⊇ SL₂(F_l)` and `F'/F` linearly disjoint from the field of `r̄`, `(Sym^m r̄)(G_{F'(ζ_l)})`
is enormous (ACC+, Lemma 7.1.6(2), p. 1090; Qian, Lemma 2.6(1), p. 1251); and that for `n > 2`,
`p > n` and `k^× · GL_n(k') ⊇ H ⊇ SL_n(k')`, `H` is enormous (GN, Lemma 3.2.4, p. 15). The `H¹`
vanishings for `SL_n(F_q)` and `Sp_{2m}(F_q)` with adjoint coefficients used here are those of
Cline–Parshall–Scott (Cline–Parshall–Scott 1975; CHT, §2.5, pp. 58–59) and are part of this target.
*Needs:* §7.7, §7.8.

*Lean:* `ResidualImage.isEnormous_symPower`, `ResidualImage.isEnormous_of_contains_SL`;
`ResidualImage.symPowerImage` is the image of `Sym^{n−1}` of a rank-two matrix representation in a
chosen basis.

### 7.11 Big images for `GSp₄`

**Enormous, tidy and vast.** Let `k` be finite of characteristic `p ≥ 3` and `ad⁰ = sp₄ ⊗ k`
(*ResidualImage.GSp4.adZeroOf*). For `H ⊆ GSp₄(k)` define *ResidualImage.GSp4.IsEnormous*: (E1)
`H¹(H, ad⁰) = 0`; (E2) absolutely irreducible on `k⁴`; (E3) every simple `k̄[H]`-submodule
`W ⊆ ad⁰ ⊗ k̄` has some `h ∈ H` with four distinct eigenvalues and eigenvalue `1` on `W`;
*ResidualImage.GSp4.IsWeaklyEnormous*: (E2) and (E3); there is no `p`-quotient condition.
*ResidualImage.GSp4.IsTidy*: some `h` with `ν(h) ≠ 1` and no two eigenvalues (with multiplicity) in
ratio `ν(h)`. For `ρ̄ : G_F → GSp₄(k)`, *ResidualImage.GSp4.IsVast*: `ρ̄(G_{F(ζ_{p^N})})` enormous for
all large `N`, or weakly enormous for all large `N` with `ζ_p` outside the field of `ad⁰ ρ̄`. Prove
that enormity depends only on the image in `PGSp₄`, weak enormity and tidiness pass to overgroups,
for any `δ ≥ 1` with `1+p^δ` in the image of the `p`-adic cyclotomic character of `G_F`,
`ρ̄(G_{F(ζ_{p^N})})` is constant for `N ≥ 1 + δ` (`p ≥ 5`) and `N ≥ 2 + δ` (`p = 3`).
Such a `δ` exists because the cyclotomic image is open; if `p` is unramified in `F`, take `δ = 1`.
Vastness is invariant under twists (BCGP21, Def. 7.5.2, Lemma 7.5.3, Rem.
7.5.4, Lemma 7.5.5, Defs. 7.5.6 and 7.5.11, pp. 198–201).

**Checks.**
- `Sp₄(F_7)` is enormous; `SL₂(F_5) ≀ ℤ/2` is weakly enormous but not enormous; `SL₂(F_3) ≀ ℤ/2` is
  enormous despite a quotient of order `3`.
- A central scalar `λ` with `λ² ≠ 1` makes a group tidy (`ν = λ²`); over `F_3` every scalar has
  `ν = 1`.
- `Sp₄(F_p)` is not tidy (`ν = 1`).
- For `F = ℚ(ζ_{p²})`, the cyclotomic image is `1+p²ℤ_p`; `δ = 2` is allowed and `δ = 1`
  is not. The stated stabilization bounds are `N ≥ 3` for `p ≥ 5` and `N ≥ 4` for `p = 3`.

**Verification lemmas.** Prove (BCGP21 throughout): for `N ≥ 1`, `L` the field of `ad⁰ ρ̄`, `ζ_p ∉ L` or
`ρ̄(G_{F(ζ_{p^N})})` enormous gives `H¹(Gal(L(ζ_{p^N})/F), ad⁰ ρ̄(1)) = 0`, so for all large `N` if
`ρ̄` is vast (Lemma 7.5.9, p. 200); for `G = SL₂(F_3) ≀ ℤ/2 ⊆ Sp₄(F_3)`,
`Γ ⊆ {(A, B)σ^e : det A = det B}`, `Γ ∩ Sp₄ = G`, `ν(Γ) = {±1}`, `N ⊴ Γ` with `N ⊆ G`, `G/N` a
`3`-group and `Γ/N` abelian, `N = G`; hence `ζ_3 ∉ F`, image `Γ`, similitude `ε̄⁻¹` and
`ρ̄(G_{F(ζ_3)}) = G` give `ρ̄(G_{F(ζ_{3^M})}) = G` for all `M` (proof of Lemma 7.5.22, p. 205); an
absolutely irreducible `H` whose centre has order `≥ 3` is tidy (Lemma 7.5.12, p. 201); for `p ≥ 5`,
`{(A, B) : det A = det B} ⊆ H` gives tidy (Lemma 7.5.13, p. 201); for `p ≥ 11` absolute irreducibility
gives (E1) and (E2) (Lemma 7.5.14, p. 201), by the large-characteristic adequacy criterion of §7.9;
`p = 3, 5, 7` require separate
finite computations for `Sp₄(F_p)` (Lemma 7.5.15, p. 201); for `p ≥ 3`, `Sp₄(F_p)` is enormous, `GSp₄(F_p)` is tidy,
and a surjection with similitude `ε̄⁻¹` is vast and tidy (Lemma 7.5.15, p. 201); for `G ⊆ Sp₄(k)`
absolutely irreducible with `W|_H = V ⊕ V^σ` for `H` of index two, the form nondegenerate on `V` (the
Lagrangian case excluded) and `χ` the quadratic character, `ad⁰W = Sym²W ≅ Ind ad⁰V ⊕ As(V)`,
`∧²W ≅ k ⊕ k(χ) ⊕ As(V) ⊗ χ`, and `W ⊗ W` the sum of all five (§7.5.16, pp. 201–202); `As(V)` and
`Ind ad⁰V` absolutely irreducible with `G ∖ H` containing an element of order not dividing `4` and
prime to `p` give (E3) (Lemma 7.5.17, p. 202); `SL₂(k) ≀ ℤ/2 ⊆ Sp₄(k)` is weakly enormous, and
enormous iff `#k ≠ 5` (Lemma 7.5.18, pp. 202–203); for `H/F` quadratic, `r̄ : G_H → GL₂(F_5)` onto
with `det = ε̄⁻¹`, `ρ̄ = Ind r̄` with `ρ̄(G_{F(ζ_5)}) = SL₂(F_5) ≀ ℤ/2` and `5` unramified in `F`,
`ρ̄` is weakly enormous for all `N` with `ζ_5` outside the field of `ad⁰ ρ̄`, hence vast (Lemma
7.5.19, pp. 203–204); exactly `11` of the `162` conjugacy classes of subgroups of `Sp₄(F_3)` are
enormous, of orders `40, 128, 160, 192, 240, 320, 384, 384, 1152, 1920, 51840`, and `GSp₄(F_3)`, the
subgroup of order `3840`, `Δ ⋊ ℤ/2` of order `2304` with its two index-`3` subgroups of order `768`,
and `Ã₅ ⋊ ⟨σ⟩` of order `480` are tidy with enormous intersection with `Sp₄(F_3)` (§7.5.20 and Lemma
7.5.21, p. 204), as a finite subgroup-classification theorem; the Sylow-two subgroup
`Q₈ ≀ C₂` of `Sp₄(F_3)`, of order `128`, is enormous (§7.5.20, p. 203, the order-128 class); and for
`p ≥ 3`, `K/F` quadratic with `p` unramified in `K/ℚ`
(equivalently, unramified in `F/ℚ` and in `K/F` above `p`), `r̄(G_{K(ζ_p)}) = SL₂(k)`, `Proj r̄^σ ≇ Proj r̄`
(including `τ ∘ Proj r̄` for a field automorphism `τ`), `det r̄^σ = det r̄ = ε̄⁻¹`, and for `p = 3`
linear disjointness over `K(ζ_3)` of the fields of the projective restrictions, `Ind r̄` is vast and
tidy (Lemma 7.5.22, pp. 204–205); in the case where the projective images are related by a field
automorphism `τ` (the graph of `τ` inside `PSL₂(k) × PSL₂(k)`), the proof needs in addition `H¹` of
`V ⊗ V^τ` and of the adjoint to vanish and an element witnessing (E3), which are part of this target.

**Checks.**
- `Sp₄(F_3)`, `Sp₄(F_5)` and `Sp₄(F_7)` satisfy the separate small-characteristic vanishing
  and eigenvalue statements.
- At `p = 7`, let `T = SL₂(F₇)²` and `G = T ⋊ C₂` with swapping action. For a `G`-extension
  `L/F` with `ζ_7 ∈ F`, put `K = L^T` and take the first projection for `r̄`. Even when
  `K/F` is unramified above seven, the conjugate projective kernels differ and both
  determinants are `1 = ε̄⁻¹`, but `Ind r̄` has constant similitude `1` and is not tidy.
  Such extensions arise from an `S_N`-extension `E/ℚ` unramified at seven containing `G`
  as a subgroup: take `L = E(ζ_7)`, `F = E^G(ζ_7)` and `K = E^T(ζ_7)`.
  Here `F/ℚ` is ramified at seven, so absolute unramifiedness excludes the example.

- The absolutely irreducible `SL₂(F_5) ≀ C₂ ≤ Sp₄(F_5)` fails (E1); absolute irreducibility
  cannot extend Lemma 7.5.14 to `p = 5`.
- `SL₂(k) ≀ C₂` is enormous when `#k ≠ 5` and only weakly enormous when `#k = 5`.
- `|Sp₄(F₃)| = 51840 = 2^7 · 3^4 · 5` and `|Q₈ ≀ C₂| = 2^7`; the latter is a Sylow-two
  subgroup and belongs to the enormous order-128 class of §7.5.20.

**Big image in the sense of Calegari–Geraghty.** For `p > 2` and `r̄ : G_ℚ → GSp₄(k)` with
`ad r̄ = ad⁰ r̄ ⊕ k` (trivial on the centre), define *GSp4.HasBigImage*: (H1) `ζ_p ∉ ℚ(ad⁰ r̄)`, i.e.
`ker(ad⁰ r̄) ⊄ G_{ℚ(ζ_p)}`; (H2) for every `m ≥ 1` some `σ ∈ G_{ℚ(ζ_{p^m})}` has four distinct
eigenvalues and eigenvalue `1` on every irreducible constituent of `ad⁰ r̄ ⊗ k̄`; (H3) neither
`ad⁰ r̄(G_ℚ)` nor `ad⁰ r̄(1)(G_ℚ)` has a quotient of order `p`; the strong form (H3') asks this of
`ad⁰ r̄(G_{ℚ(ζ_p)})` and implies (H3). Prove that it is twist-invariant and, with absolute
irreducibility over every `ℚ(ζ_{p^N})`, implies vastness; and that for `p ≥ 5`: (1) for `K/ℚ`
imaginary quadratic with `K ⊄ ℚ(ζ_p)`, `ρ̄ : G_K → GL₂(F_p)` with `det ρ̄ = ε̄^{1−k}` and `(ρ̄, ρ̄^c)`
mapping `G_{K(ζ_p)}` onto `SL₂(F_p)²`, `r̄ = Ind ρ̄` with either symplectic form has
`ad⁰ r̄|_{G_K} ≅ (ρ̄ ⊗ ρ̄^c) ε̄^{k−1} ⊕ ad⁰ ρ̄ ⊕ ad⁰ ρ̄^c`, `r̄(G_{ℚ(ζ_{p^m})}) = SL₂(F_p)² ⋊ ℤ/2` for
all `m`, and big image; (2) `r̄(G_ℚ) = GSp₄(F_p)` gives big image; both satisfy (H3') (CG, arXiv v1,
Assumption 4.1, p. 10, and Ex. 4.11 with proof, p. 14; published pp. 813 and 818–819). *Needs:* §7.5,
§7.10.

**Checks.**
- `r̄(G_ℚ) = GSp₄(F_p)`, `p ≥ 5`, has big image.
- For `p = 3`, `r̄` onto with similitude `ε̄⁻¹`: `ker(ad⁰ r̄) = r̄⁻¹(scalars)`, and a scalar
  `λ ∈ F_3^× = {±1}` has `ν = λ² = 1`, so `ε̄ = 1` on the kernel and (H1) fails although `r̄` is vast;
  for `p ≥ 5` the scalar `2` has `ν = 4 ≠ 1`. Vastness or the cyclotomic image alone cannot define big
  image.
- `ad r̄ = ad⁰ r̄ ⊕ k` with the trivial action on the scalars.

### 7.12 Taylor–Wiles image conditions

**The conditions.** For `s̄ : G_F → GL_n(F̄_p)` continuous (finite image in some `GL_n(k)`), define
*ResidualImage.TaylorWilesImageConditions*: (TW2) `s̄(G_{F(ζ_p)})` adequate; (TW3) some
`σ ∈ G_F ∖ G_{F(ζ_p)}` has `s̄(σ)` scalar; and *ResidualImage.EnormousTaylorWilesImageConditions* with
enormous in (TW2). Prove that (TW3) holds iff `ζ_p` is not in the field of `ad s̄` (`F` of
characteristic `0`, `k` of characteristic `p`); that restriction to `G_H` preserves the conditions
when `H` is linearly disjoint over `F` from the field of `s̄` times `F(ζ_p)` (equal images alone are
not enough: `F = ℚ`, `H = ℚ(ζ_p)`, `s̄` trivial); that twisting by a character preserves them for `k`
finite; and that the enormous conditions imply the adequate ones. Decomposed genericity is not part of
these conditions (BCGNT, Def. 5.2.1, pp. 50–51; ACC+, Thm 6.1.1(3)–(4), p. 1029).

**Checks.**
- In rank one the conditions hold iff `ζ_p ∉ F`.
- Testing only the image group, without the cyclotomic condition, accepts the trivial `s̄` over
  `F = ℚ(ζ_p)`.
- For `G_ℚ → GL₂(F_7)` onto with cyclotomic determinant, `SL₂(F_7)` is adequate and enormous, and the
  scalar `2 · 1` has `ε̄ = det = 4 ≠ 1`, so (TW3) holds.

**Projective-unitary simplicity.** For a prime power `q` and `m ≥ 2`, construct the centre
and projective quotient of `SU_m(F_{q²})` for a nondegenerate Hermitian form, with involution
`x ↦ x^q`. The centre consists of `λI` with `λ^(q+1) = λ^m = 1`; transport the model across
isometries of Hermitian forms. For `m ≥ 3` and `(m,q) ≠ (3,2)`, construct a proved `MulEquiv`
from this projective quotient to CFSGStatement's exact derived central quotient of the
graph-twisted `A_{m−1}` fixed-point group at fixed-field parameter `q`, with its validity proof.
Transport simplicity from CFSGBasicProperties T2 through that comparison. For `m = 2`, construct
`PSU₂(F_{q²}) ≅ PSL₂(F_q)` and use Mathlib's rank-two theorem when `q ≥ 4`.
Thus `PSU_m(F_{q²})` is simple except at `(m,q) = (2,2), (2,3), (3,2)`
(Taylor, *The Geometry of the Classical Groups*,
Theorems 10.9 and 10.20, pp. 119, 127–130; CFSGStatement L1–L3 and
CFSGBasicProperties T1–T2). Identify `SU_1 = 1` directly, and compute the exceptional
projective groups separately. The comparison with a derived central quotient carries the valid
range: the nonsimple exceptional projective groups need not equal those derived quotients.
*Needs:* finite fields, matrix groups and finite-dimensional Hermitian forms;
CFSGStatement L1–L3's carriers and validity; CFSGBasicProperties T1–T2's fixed-point root
calculus and supplied simplicity; Mathlib `Matrix.ProjectiveSpecialLinearGroup.rank_two_simple'`
for rank two. This target owns the matrix model, centre, quotient and comparison.

**Checks.**
- `PSU₂(F_{5²}) ≅ PSL₂(F_5)` is simple: the fixed-field parameter is `5`, not `25`.
- `PSU₃(F_{2²})` has order `72` and is not simple; the exceptional pair is necessary.
- `SU_1 = 1`, so a positive-rank simplicity criterion cannot include `m = 1`.
- `PSU₂(F_4) ≅ S_3` and `PSU₂(F_9) ≅ A_4` are the two rank-two exceptions.
- At `(m,q) = (3,2)`, the fixed-point group `SU₃(F_4)` has order `216`, its derived
  subgroup has order `54` and centre of order `3`, so its derived central quotient has
  order `18`, distinct from the projective quotient of order `72`.

**Verification lemmas.** Using the projective-unitary target above, prove (BCGNT unless stated): for `s̄` satisfying
*ResidualImage.TaylorWilesImageConditions*, `F/ℚ` Galois and `H/F` finite with Galois
closure over `ℚ` linearly disjoint over `F` from `F(ζ_p)` times the Galois closure of the field of
`s̄`, the images over `H` and `H(ζ_p)` equal those over `F` and `F(ζ_p)`, and the conditions hold for
`s̄|_{G_H}` (Lemma 5.2.2, p. 51); for `n, m ≥ 1`, `F/ℚ` Galois, `r̄_A : G_F → GL₂(F_p)` with
`r̄_A(G_{F(ζ_p)}) = SL₂(F_p)`, `r̄_B : G_F → GU_m(F_{p²})` with `r̄_B(G_{F(ζ_p)}) = SU_m(F_{p²})`,
`s̄ = Sym^{n−1} r̄_A ⊗ r̄_B` and `p > 2mn + 1`, and for `m = 2` the Galois closures over `ℚ` of the
projective fixed fields linearly disjoint over `F(ζ_p)`, `s̄(G_{F(ζ_p)})` is adequate;
`det r̄_A = ε̄^{−m}` and multiplier `ε̄^{1−m}` for `r̄_B` put `s̄` in `GU_{mn}(F_{p²})` with
multiplier `ε̄^{1−mn}`; and `ε̄(G_F) = F_p^×` gives (TW3) (Lemma 5.2.4, pp. 52–53), the proof using
projective-unitary simplicity supplied through the valid carrier comparison above and the
automorphism-group theorem, which this target proves (Steinberg, *Lectures on Chevalley groups*,
§10, Thm 30; BCGNT, Lemma 5.2.3, pp. 51–52); for `E/ℚ` cyclic of degree `m` with `p ∤ m`, linearly
disjoint from `F`, `L = EF`,
`ψ : G_L → F_p^×`, `r̄_B = Ind ψ`, `q` split in `F`, unramified for `r̄_B`, with `Frob_q` generating
`Gal(E/ℚ)`, the eigenvalues of `r̄_B(Frob_v)` (`v | q`) are `λ, ζλ, …, ζ^{m−1}λ` in `F̄_p`, `ζ` a
primitive `m`-th root of unity (Lemma 5.2.5, pp. 53–54); for `n, m ≥ 1`, `r̄_A` as above,
`r̄_B ≅ Ind_{G_L}^{G_F} ψ : G_F → GL_m(F_p)` with `r̄_B|_{G_{F(ζ_p)}}` absolutely irreducible,
`s̄ = Sym^{n−1} r̄_A ⊗ r̄_B` and `p > 2mn + 1`, the image over `F(ζ_p)` is adequate, and (TW3) holds
when `det r̄_A = ε̄^{−m}`, `det r̄_B = ε̄^{−m(m−1)/2}` and `ε̄(G_L) = F_p^×` (Lemma 5.2.6, pp. 54–55);
and under the hypotheses of the enormous symmetric powers of §7.10 with `l` unramified in `F'/ℚ`,
`ζ_l` is not in the field of `ad Sym^m r̄` times `F'`, so `Sym^m r̄|_{G_{F'}}` satisfies the enormous
conditions (ACC+, proof of Lemma 7.1.6(1), p. 1090). *Needs:* §§7.9–7.10; §4.7;
the matrix comparisons above with CFSGBasicProperties T2 for `m ≥ 3`, Mathlib rank-two
simplicity for `m = 2`, and the direct rank-one computation for `m = 1`.

**Checks.**
- For `F = H = ℚ`, `p = 5` and trivial rank-two `s̄`, the disjointness holds but the
  cyclotomic image is trivial and not adequate. Restriction preserves the image conditions
  only when they hold initially.
- For `m = 1`, `SU₁(F_{p²}) = PSU₁(F_{p²}) = 1`, so the verification uses the rank-one case.
- For `m = 2` and `p ≥ 5`, the comparison with `PSL₂(F_p)` gives simplicity from Mathlib;
  `p = 2, 3` instead gives `S_3, A_4`, which are not simple.
- For `m ≥ 3`, the unitary comparison uses the twisted group at `q = p`, with coefficients
  in `F_{p²}`. The bound `p > 2mn + 1` excludes the nonsimple `PSU₃(F_4)` case (`m = 3`, `p = 2`).

### Examples

For the alternating plane and `diag(2, 1)`, the determinant and the similitude multiplier are both `2`
(`GSp₂ = GL₂`). The two adjoints of the full product `PGL₂ × PGL₂` are distinguished by the
multipliers `2` and `1` on `E₁₂`. A cyclic tensor with rank-one return scalar `2` and cycle length two
has polynomial `X − 2`, while the rank-two return matrix `diag(2, 3)` and cycle length two gives
`(X − 2)(X − 3)(X² − 6) = X⁴ − 5X³ + 30X − 36`.

### Dependencies

Layers 1, 2, 4 and 5; Tau Ceti's representation-theoretic powers and tensor induction, trace form,
group schemes of forms, Hopf ideals and identity components; `TauCetiRoadmap.ReductiveGroups` layers
0, 2, 3, 6 and 9; `TauCetiRoadmap.ProfiniteCohomology` layers 2, 10 and 13;
`TauCetiRoadmap.RepresentationTheory/InductionRestriction` layer 7; IntegralHeckeAndGaloisDeterminants
Layer 1; GlobalNumberFields Layers 9–10 (Hecke-character infinity types); Mathlib's
`groupCohomology`, `Matrix.symplecticGroup`, `skewAdjointMatricesSubmodule`,
`LinearMap.IsPerfPair`, `Subgroup.goursat`, `Matrix.SL2.commutator_eq_top` and
`Matrix.ProjectiveSpecialLinearGroup.rank_two_simple'`.
For §7.6's projective lifting: ClassFieldTheory Layers 5 and 10–12;
GlobalNumberFields Layers 6–7 and 9–10; the finite-kernel obstruction and idelic
torsion-character extension of §7.6. For §7.12: CFSGStatement L1–L3 and
CFSGBasicProperties T1–T2 on the valid twisted type-A carrier.

## Downstream consumers

The carrier, integral models, residual representations and local restrictions of Layers 1 and 2 are
the input of the construction of Galois representations attached to automorphic representations and
of the local–global compatibility statements about them. The adjoint and trace-zero adjoint, the
polarised representations and the residual-image conditions of Layer 7, together with Carayol's lemma
(§5.10), are the input of global and local Galois deformation theory and of the Taylor–Wiles–Kisin
patching method. Recognition by Frobenius polynomials (Layer 5) and the image conditions (Layers 4 and
7) are consumed by potential modularity and the theory of compatible systems. The conductors of Layer
3 give the representation-theoretic conductors used in Serre's modularity conjecture and in the
modularity of elliptic curves. The downstream geometric comparisons are
NeronModelsAndSemistableAbelianVarieties §§5.3a–5.3i. The Tate modules of Layer 6
are consumed by complex multiplication and explicit reciprocity, by the finiteness and isogeny theorems
for abelian varieties, by Euler systems of Heegner points and by the arithmetic of moduli of abelian
schemes. The continuous carrier of Layer 1 is the input of the period functors of `p`-adic Hodge theory.

The finite-place action of [§2.1](#finite-place-galois-action) is consumed by
ArithmeticGaloisDuality R02.3.3 for local multiplicative and unit modules.
FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5 consumes
[§6.1](#elliptic-residual-representation) and [§6.3](#inertia-filtration-predicates) for local
residual types; its finite-flat criteria at the coefficient prime are separate from
[the prime-to-residue-characteristic criterion](#multiplicative-residual-unramified-criterion).
LocalGaloisDeformationRings F.1.4 consumes [marked residual lifts](#marked-residual-lift)
and §1.2's coefficient comparisons for the frame-to-module comparison.
ClassicalSerreModularity consumes §6.1's matrix realization over `F̄_p` with invariant trace
and determinant. These are consumer interfaces, not prerequisites of their construction.

AutomorphicLFunctionsAndLocalFactors AL.1 owns
[`rank-one-local-functional-equation`](../AutomorphicLFunctionsAndLocalFactors/README.md#rank-one-local-functional-equation),
the local zeta integral and functional equation, and identifies its constant with §2.7's
[`local-constant-gauss-sum`](#local-constant-gauss-sum). It also consumes
[`standard-test-function-evaluations`](#standard-test-function-evaluations),
[`hecke-zeta-integral-comparison`](#hecke-zeta-integral-comparison),
[`finite-order-hecke-functional-equation`](#finite-order-hecke-functional-equation) and the
finite-sum [`root-number-product-formula`](#root-number-product-formula).
AutomorphicLFunctionsAndLocalFactors AL.1 also owns
[`hecke-l-functional-equation`](../AutomorphicLFunctionsAndLocalFactors/README.md#hecke-l-functional-equation),
the all-unitary scalar continuation and functional equation obtained from AL.2's
[`global-godement-jacquet`](../AutomorphicLFunctionsAndLocalFactors/README.md#global-godement-jacquet)
at `n = 1`. AutomorphicSpectralTheory §1.15c owns
[`unitary-hecke-functional-equation`](../AutomorphicSpectralTheory/README.md#unitary-hecke-functional-equation)
via Eisenstein continuation. For the same primitive conductor and archimedean factors, both
constructions give `Λ_H(ω,s) = A^(s/2) L_∞(ω,s) L_f(ω,s)` on `Re(s) > 1`, so their
meromorphic continuations agree and their functional-equation constant is §2.7's `W_H(ω)`.
These downstream analytic targets consume the arithmetic constants; §2.7 constructs its
constants and finite-image Artin equation from finite Gauss sums and LFunctions' finite-order
Hecke equation.

## References

- P. B. Allen, F. Calegari, A. Caraiani, T. Gee, D. Helm, B. V. Le Hung, J. Newton, P. Scholze, R.
  Taylor, J. A. Thorne, *Potential automorphy over CM fields*, Ann. of Math. 197 (2023), 897–1113.
- E. Artin, J. Tate, *Class Field Theory*, Benjamin, 1967, Ch. X, Theorem 5 (Grunwald–Wang).
- T. Barnet-Lamb, T. Gee, D. Geraghty, *Serre weights for rank two unitary groups*, Math. Ann. 356
  (2013), 1551–1598; arXiv:1106.5586v1.
- T. Barnet-Lamb, T. Gee, D. Geraghty, R. Taylor, *Potential automorphy and change of weight*, Ann. of
  Math. 179 (2014), 501–609; arXiv:1010.2561v4 (locators use arXiv v4 pagination).
- M. A. Bennett, S. Siksek, *A conjecture of Erdős, supersingular primes and short character sums*,
  Ann. of Math. 191 (2020), 355–392.
- T. R. Berger, *Hall–Higman type theorems. V*, Pacific J. Math. 73 (1977), 1–62,
  Proposition 2.14, pp. 12–13. <https://msp.org/pjm/1977/73-1/pjm-v73-n1-p01-s.pdf>
- G. Böckle, M. Harris, C. Khare, J. A. Thorne, *Ĝ-local systems on smooth projective curves are
  potentially automorphic*, Acta Math. 223 (2019), 1–111; arXiv:1609.03491v2.
- A. Borel, *Linear Algebraic Groups*, 2nd ed., Graduate Texts in Math. 126, Springer, 1991.
- G. Boxer, F. Calegari, T. Gee, *Cuspidal cohomology classes for `GL_n(ℤ)`*, J. Amer. Math. Soc. 38
  (2025), 509–520.
- G. Boxer, F. Calegari, T. Gee, J. Newton, J. A. Thorne, *The Ramanujan and Sato–Tate conjectures for
  Bianchi modular forms*, arXiv:2309.15880v3.
- G. Boxer, F. Calegari, T. Gee, V. Pilloni, *Abelian surfaces over totally real fields are potentially
  modular*, Publ. Math. IHÉS 134 (2021), 153–501; arXiv:1812.09269v3 (BCGP21; locators use arXiv v3
  pagination).
- G. Boxer, F. Calegari, T. Gee, V. Pilloni, *Modularity theorems for abelian surfaces*,
  arXiv:2502.20645v1 (2025) (BCGP25; arXiv v1 pagination).
- A. Brumer, K. Kramer, *The conductor of an abelian variety*, Compositio Math. 92 (1994), 227–248.
- C. J. Bushnell, G. Henniart, *The Local Langlands Conjecture for GL(2)*, Grundlehren der
  mathematischen Wissenschaften 335, Springer, 2006, §32.6, pp. 206–207.
- F. Calegari, D. Geraghty, *Modularity lifting beyond the Taylor–Wiles method*, Invent. Math. 211
  (2018), 297–433; arXiv:1207.4224v2.
- F. Calegari, D. Geraghty, *Minimal modularity lifting for nonregular symplectic representations*, Duke
  Math. J. 169 (2020), 801–896; arXiv:1907.08691v1 (*Modularity lifting for non-regular symplectic
  representations*).
- F. Calegari, D. Geraghty, M. Harris, *Bloch–Kato conjectures for automorphic motives*, appendix,
  arXiv:1907.08694v1.
- A. Caraiani, J. Newton, *On the modularity of elliptic curves over imaginary quadratic fields*,
  arXiv:2301.10509v3.
- G. Chenevier, *The p-adic analytic space of pseudocharacters of a profinite group and
  pseudorepresentations over arbitrary rings*, arXiv:0809.0415v2 (arXiv v2 pagination).
- E. Cline, B. Parshall, L. Scott, *Cohomology of finite groups of Lie type, I*, Publ. Math. IHÉS 45
  (1975), 169–191.
- L. Clozel, M. Harris, R. Taylor, *Automorphy for some ℓ-adic lifts of automorphic mod ℓ Galois
  representations*, Publ. Math. IHÉS 108 (2008), 1–181.
- L. Clozel, J. A. Thorne, *Level-raising and symmetric power functoriality, III*, Duke Math. J. 166
  (2017), 325–402.
- H. Darmon, F. Diamond, R. Taylor, *Fermat's Last Theorem*, revised version (2007) of Current
  Developments in Mathematics 1995.
- P. Deligne, *Les constantes des équations fonctionnelles des fonctions L*, in Modular Functions of One
  Variable II, Lecture Notes in Math. 349, Springer, 1973, 501–597.
- P. Deligne, *La conjecture de Weil. I*, Publ. Math. IHÉS 43 (1974), 273–307.
- P. Deligne, *La conjecture de Weil. II*, Publ. Math. IHÉS 52 (1980), 137–252.
- P. Deligne, J.-P. Serre, *Formes modulaires de poids 1*, Ann. Sci. ENS (4) 7 (1974), 507–530.
- L. E. Dickson, *Linear Groups with an Exposition of the Galois Field Theory*, Teubner, Leipzig, 1901.
- L. V. Dieulefait, A. Pacetti, *A simplified proof of Serre's conjecture*, arXiv:2108.07577v2.
- J. Fresán, C. Sabbah, J.-D. Yu, *Hodge theory of Kloosterman connections*, Duke Math. J. 171 (2022),
  1649–1747; arXiv:1810.06454v5.
- W. T. Gan, S. Takeda, *The local Langlands conjecture for `GSp(4)`*, Ann. of Math. 173 (2011),
  1841–1882.
- T. Gee, J. Newton, *Patching and the completed homology of locally symmetric spaces*, J. Inst. Math.
  Jussieu 21 (2022), 395–458; arXiv:1609.06965v5.
- R. Guralnick, F. Herzig, P. H. Tiep, *Adequate subgroups and indecomposable modules*, J. Eur. Math.
  Soc. 19 (2017); arXiv:1405.0043v3.
- R. Guralnick, F. Herzig, R. Taylor, J. Thorne, *Adequate subgroups*, appendix to J. Thorne, *On the
  automorphy of ℓ-adic Galois representations with small residual image*, J. Inst. Math. Jussieu 11
  (2012); its Theorem 9 is Theorem A.9 of the published version.
- I. M. Isaacs, *Character Theory of Finite Groups*, Academic Press, 1976.
- N. Jacobson, *Basic Algebra II*, 2nd ed., W. H. Freeman, 1989.
- J. C. Jantzen, *Representations of Algebraic Groups*, 2nd ed., Mathematical Surveys and
  Monographs 107, Amer. Math. Soc., 2003, II.2.16, pp. 185–186.
- C. Khare, J. A. Thorne, *Potential automorphy and the Leopoldt conjecture*, Amer. J. Math. 139 (2017);
  arXiv:1409.7007v2.
- C. Khare, J.-P. Wintenberger, *Serre's modularity conjecture (I)*, Invent. Math. 178 (2009), 485–504.
- C. Khare, J.-P. Wintenberger, *Serre's modularity conjecture (II)*, Invent. Math. 178 (2009), 505–586.
- M. Kisin, R. Zhou, *Independence of ℓ for Frobenius conjugacy classes attached to abelian varieties*,
  arXiv:2103.09945v2.
- Q. Liu, *Conducteur et discriminant minimal de courbes de genre 2*, Compositio Math. 94 (1994), 51–79.
- J. Marzec, M. Neururer, *L-functions and their applications*, 25 February 2020, Chapter 5,
  pp. 55–67, especially Definition 5.11, p. 62.
  <https://jmarzec.ukw.edu.pl/marzec,neururer-lecture.pdf>
- D. Masser, U. Zannier, *Abelian varieties isogenous to no Jacobian*, Ann. of Math. 191 (2020), 635–674.
- J. S. Milne, *Abelian Varieties*, course notes, version 2.00, 2008 (printed pagination).
- J. S. Milne, *Abelian Varieties*, revised article, 2 January 2022, §19, pp. 40–41.
  <https://www.jmilne.org/math/xnotes/AVs.pdf>
- J. S. Milne, *Elliptic Curves*, 2nd ed., World Scientific, 2021.
- J. S. Milne, *Class Field Theory*, course notes, v4.03, 2020.
  <https://www.jmilne.org/math/CourseNotes/CFT.pdf>
- D. Mumford, *Abelian Varieties*, Tata Institute / Oxford University Press, 1970.
- O. Brinon, B. Conrad, *CMI summer school notes on p-adic Hodge theory*, 2009, §§6.3, 15.1.
- J. Nekovář, *Eichler–Shimura relations and semisimplicity of étale cohomology of quaternionic Shimura
  varieties*, Ann. Sci. ENS 51 (2018), 1179–1252.
- J. Newton, J. A. Thorne, *Adjoint Selmer groups of automorphic Galois representations of unitary
  type*, J. Eur. Math. Soc. 25 (2023), 1919–1967; arXiv:1912.11265v3.
- J. Newton, J. A. Thorne, *Symmetric power functoriality for Hilbert modular forms*, arXiv:2212.03595v2
  (Newton–Thorne 2026; NT26).
- R. Noot, *Abelian varieties — Galois representation and properties of ordinary reduction*, Compositio
  Math. 97 (1995), 161–171.
- S. Patrikis, *Variations on a theorem of Tate*, Mem. Amer. Math. Soc. 258 (2019); arXiv:1207.6724v4.
- L. Qian, *Potential automorphy for `GL_n`*, Invent. Math. 231 (2023); arXiv:2104.09761v1.
- K. A. Ribet, *A modular construction of unramified p-extensions of `ℚ(μ_p)`*, Invent. Math. 34 (1976),
  151–162.
- K. A. Ribet, *Abelian varieties over `ℚ` and modular forms*, in Algebra and Topology 1992 (KAIST).
- R. Richard, A. Yafaev, *Generalised André–Pink–Zannier conjecture for Shimura varieties of abelian
  type*, arXiv:2111.11216v4.
- J. P. Saha, *Conductors in p-adic families*, arXiv:1512.03004, Definition 2.1 and Lemma 2.3.
- T. Saito, *Conductor, discriminant, and the Noether formula of arithmetic surfaces*, Duke Math. J. 57
  (1988), 151–173.
- J.-P. Serre, *Sur les corps locaux à corps résiduel algébriquement clos*, Bull. Soc. Math. France 89
  (1961), 105–154.
- J.-P. Serre, *Zeta and L functions*, in Arithmetical Algebraic Geometry (Purdue, 1963), Harper & Row,
  1965, 82–92.
- J.-P. Serre, *Facteurs locaux des fonctions zêta des variétés algébriques (définitions et
  conjectures)*, Séminaire Delange–Pisot–Poitou 11 (1969/70), exp. 19.
- J.-P. Serre, *Propriétés galoisiennes des points d'ordre fini des courbes elliptiques*, Invent.
  Math. 15 (1972), 259–331.
- J.-P. Serre, *Local Fields*, Graduate Texts in Math. 67, Springer, 1979.
- J.-P. Serre, *Lectures on N_X(p)*, 2011 lecture notes, §4.5, Theorem 4.6, p. 42.
  <https://www.college-de-france.fr/media/jean-pierre-serre/UPL9140953003901187132_14___Lectures_on_N_X.pdf>
- J.-P. Serre, *Quelques applications du théorème de densité de Chebotarev*, Publ. Math. IHÉS 54 (1981),
  123–201.
- J.-P. Serre, *Sur les représentations modulaires de degré 2 de `Gal(ℚ̄/ℚ)`*, Duke Math. J. 54 (1987),
  179–230.
- J.-P. Serre, J. Tate, *Good reduction of abelian varieties*, Ann. of Math. 88 (1968), 492–517.
- J. H. Silverman, *The Arithmetic of Elliptic Curves*, 2nd ed., Graduate Texts in Math. 106, Springer,
  2009.
- J. H. Silverman, *Advanced Topics in the Arithmetic of Elliptic Curves*, Graduate Texts in Math. 151,
  Springer, 1994.
- R. Steinberg, *Lectures on Chevalley Groups*, Yale University, 1967; University Lecture Series 66,
  Amer. Math. Soc., 2016.
- J. Tate, *Number theoretic background*, in Automorphic Forms, Representations and L-functions
  (Corvallis), Proc. Sympos. Pure Math. 33, part 2, Amer. Math. Soc., 1979, 3–26.
- J. Tate, *Local constants*, in A. Fröhlich (ed.), Algebraic Number Fields: L-functions and Galois
  Properties (Durham 1975), Academic Press, 1977, 89–131, prepared with C. J. Bushnell and M. J. Taylor.
- J. Thorne, *On the automorphy of ℓ-adic Galois representations with small residual image*, J. Inst.
  Math. Jussieu 11 (2012), 855–920; arXiv:1107.5989v1.
- J. A. Thorne, *A 2-adic automorphy lifting theorem for unitary groups over CM fields*, Math. Z. 285
  (2017), 1–38.
- D. Ulmer, *Conductors of ℓ-adic representations*, Proc. Amer. Math. Soc. 144 (2016); arXiv:1307.4525v4.
