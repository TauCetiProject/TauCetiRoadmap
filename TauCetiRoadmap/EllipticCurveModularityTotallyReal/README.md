# Roadmap: modularity of elliptic curves over totally real fields

**Summary.** Every elliptic curve over every totally real number field is modular, with its
entire compatible system and every local factor. This roadmap builds the totally real branch of
the geometric prime switch. The cyclic covers of a family of quadratic twists, their integral
regular-module lattices, their character systems and the integral congruences between them are
imported from EllipticCurveModularityImaginaryQuadratic, which states them over arbitrary
number fields. Over a totally real base those character systems live only over the CM field
`M = K(μ_{3p})`. Twisting the cover by its reflection descends them to totally odd rank-two
systems over the real subfield `L = K(ζ_{3p} + ζ_{3p}⁻¹)`, with the same lattices and the same
congruences. The modularity lifting theorems over totally real fields, which need no local
matching at the lifting prime, then carry modularity along the chain
`W_η ≡_p W_χ ≡_3 W_ψ ≡_p W_1`. The chain starts from an auxiliary elliptic curve made modular by
the Freitas–Le Hung–Siksek mod-five criterion and ends at a quadratic twist of the original
curve. Descent along the abelian extension `L/K` and removal of the two quadratic twists finish
the argument.

The endpoint is the **totally real modularity theorem** (§4.4): for every totally real number
field K and every elliptic curve E/K there is a cuspidal automorphic representation `π_E` of
`GL₂(𝔸_K)` of parallel weight two (type `(2,0)`) with trivial central character, unique up to
isomorphism, whose attached representation is `H¹_ét(E_K̄, ℚ̄_ℓ)` for every ℓ and every
coefficient isomorphism. At every finite place `v∤ℓ` the Frobenius-semisimple Weil–Deligne
representation of `H¹(E)` is `rec(π_{E,v} ⊗ |det|_v^{−1/2})`, monodromy included. At `v|ℓ` the
same holds for the potentially semistable Weil–Deligne representation. Consequently
`L(E/K,s) = L(π_E, s−1/2)`, and the Hilbert newform of `π_E` has rational Hecke eigenvalues and
exact level the conductor of E. Geometrically CM curves are included. Their CM field is never
contained in K, and `π_E` is the cuspidal quadratic automorphic induction from KT. This is
[LeHung26](#references), Theorem 1.1, p.2 (LeHung26 line 86), with the geometric inputs proved
by the imported layers rather than assumed.

## Scope and ownership

**Owned here.** Layer 1: the real cyclotomic subfield over an arbitrary base and its quadratic
character, the reflection twist of the covers, the descended character systems with their
determinant, Hodge, compatibility and oddness properties, their integral lattices and
congruence chain, and the two elliptic endpoints. Layer 2: the change of coefficient prime for
rank-two systems over totally real fields, the application of the totally real weight-two
lifting theorem to rank-two summands of abelian varieties
([LeHung26](#references), Proposition 3.1), the 3–5 switch curve over a number field, and the
mod-three and mod-five elliptic seeds over a totally real field ([FLHS15](#references),
Corollary 5.1 and Theorem 3). Layer 3: one specialization satisfying every residual condition
over L, the auxiliary seed over L and the three lifts. Layer 4: descent to the original curve,
the all-place comparison over a totally real base, the CM branch over a totally real base and the
endpoint.

**Imported from EllipticCurveModularityImaginaryQuadratic.** Layers 1–4 (the parameter open
`switchParameterOpen`, the covers `cyclicCover m` with rotations and reflection, both
degenerations, the integral regular-module marking `integral_regular_module_etale`, the
character systems `characterSystem θ` with `character_system_properties`, the quotient
realizations `character_order_quotient`, `trivial_character_twist`, `auxiliaryEllipticCurve`
and `cubic_character_elliptic`, the lattices `characterLattice θ` and
`prime_switch_congruences`); §5.1 `nonCM_elliptic_large_residual_primes`; §7.1
`character_geometric_irreducibility`; §7.4 `simultaneous_specialization`, which is stated
there for an arbitrary number field; §0.2 `fixed_pairing_twist` and
`fixed_pairing_twist_rational`, the fixed-pairing twisted modular curves at three and five over
an arbitrary number field. Its CM lifting theorems (§§0.1, 5.2–5.3), its local prescription
(Layer 6) and its CM descent and endpoint (Layer 8) are not used. The totally real lifting
theorem needs no matching of local types at the lifting prime ([LeHung26](#references), §3.1,
LeHung26 line 234), so no local parameter open is imposed here.

**Kept variants.** Section 2.1 is the change-of-prime argument of
EllipticCurveModularityImaginaryQuadratic §8.1 `character_automorphy_change_prime`, stated here
for systems over a totally real field and the Hilbert attachment rather than for `V_θ` over a CM
field. Section 4.2 replaces that roadmap's CM-field comparison (§0.3
`modular_elliptic_all_coefficients`, §8.5) by the totally real Hilbert local–global
compatibility, which holds at every finite place without a separate monodromy argument.
Section 4.3 is the totally real counterpart of its §8.6 `cm_elliptic_realization`: over a totally
real base the CM field is never contained in the base, so only the cuspidal induced branch occurs.
It also extends ComplexMultiplicationAndExplicitReciprocity §4.2, "CM induction and
compatible-system comparison", from rational CM curves to CM curves over a totally real field,
whose endomorphisms are defined only over the quadratic extension `KT`.

**Supplied elsewhere.** The Hilbert attachment, its determinant, oddness and irreducibility and
its local–global compatibility at every finite place are AutomorphicGaloisRepresentations
§§3.10–3.14, 4.4 and 4.7. Soluble base change and descent over totally real fields, with all-place
local compatibility, are PotentialAutomorphyInfrastructure §2.3. Quadratic automorphic
induction, local Langlands, conductors, newvectors and strong multiplicity one are
GL2AutomorphicRepresentationsAndTransfer R16.2–R16.4 and R17.4.16. Hilbert irreducibility with
local conditions is InverseGaloisAndArithmeticFundamentalGroups IG.2. The compatible-system
carrier is SmallRamificationAndAbelianVarietyBaseCases §5.0d with the predicates of
AutomorphicGaloisRepresentationsPartII AG2.P and PotentialModularityAndCompatibleSystems §1.6.
The general weight-two lifting theorem over totally real fields belongs to GL2ModularityLifting.
Residual modularity of solvable totally odd representations belongs to
GL2AutomorphicRepresentationsAndTransfer R17.5. The algebraic Hecke character of a CM abelian
variety whose endomorphisms are defined over the base, and the splitting of its Tate module into
the realizations of that character, are ComplexMultiplicationAndExplicitReciprocity §4.1. The
Galois-equivariant, Weil-pairing-preserving isomorphisms of finite torsion used in §2.3 are the
notion `SymplecticTorsionEquiv` of EllipticCurveModularityImaginaryQuadratic §0.2. The field of
definition of the geometric endomorphisms of a CM elliptic curve over a field of characteristic
zero, through their action on the invariant differential, belongs to
ComplexMultiplicationAndExplicitReciprocity Layer 1; it is not stated here.
EllipticCurveModularityImaginaryQuadratic §8.6 uses the same statement over imaginary quadratic
fields, and the criterion over a number field K that all endomorphisms are K-rational exactly
when the CM field lies in K is its specialization. The three sections these roadmaps must add are
specified under [Exact supplier contracts](#exact-supplier-contracts).

**Outside this roadmap.** CM base fields (EllipticCurveModularityImaginaryQuadratic and its
Part II), number fields that are neither totally real nor CM, abelian varieties of higher
dimension and computational questions. The rational case K = ℚ is a Check of the general
statement, not a new proof of EllipticCurveModularity's endpoint.

**The Lean file.** [`Suggested.lean`](Suggested.lean) accompanies this document; the roadmap is
this README. The file states, against the pinned Mathlib and Tau Ceti, the headline theorems whose
objects exist there, and its module docstring names the others with the carrier each lacks.
Mathlib has totally real and CM fields, maximal real subfields, cyclotomic extensions, Weierstrass
curves with `WeierstrassCurve.IsElliptic` and the j-invariant `WeierstrassCurve.j`; Tau Ceti has
the elliptic Tate representation, its cyclotomic determinant, quadratic twists, the Galois action
`WeierstrassCurve.torsionGaloisAction` on geometric N-torsion, the Weil pairing
`TauCeti.Isogeny.weilPairing` with its Galois equivariance
`WeierstrassCurve.weilPairing_torsionGaloisAction`, and two-element bases of N-torsion over
`ZMod N` (`WeierstrassCurve.nonempty_basis_torsionBy`). Two headline results are statable on these
carriers and are stated there: the totally real case of the field statement of §1.1,
`realCyclotomic_isCMField`, and the 3–5 switch of §2.3, `three_five_switch`, which quantifies over
elliptic Weierstrass curves over a number field, additive isomorphisms of geometric five-torsion
commuting with the Galois actions and preserving the Weil pairing, and the matrices of the Galois
action on three-torsion in every basis, and concludes that a set of j-invariants is infinite.
Neither library has cuspidal automorphic representations of `GL₂` over a number field or the
Hilbert attachment, so the modularity statements (§§2.1, 2.2, 2.4 and 2.5 and Layers 3–4) are
stated here on the supplier carriers named below; the statements of §§1.2–1.6 also need the
imported covers, their étale cohomology and the raw compatible-system carrier, which the pins
lack.

## Conventions

- Number fields carry fixed algebraic closures and `G_F` is the absolute Galois group. An
  elliptic curve E is a smooth proper genus-one curve with origin O, presented in
  characteristic zero as `y² = h(x)` with h a separable cubic; local reduction types are read on
  local minimal models (EllipticCurves Layer 4, at each finite place through the localizations of
  Layer 4.5a). No global minimal model is assumed.
- `H¹(X)` means `H¹_ét(X_F̄, ℚ̄_ℓ)`. The cyclotomic character `ε_ℓ` has Hodge–Tate weight `−1`,
  so `det H¹(E) = ε_ℓ⁻¹` and `H¹(E)` has labelled weights `{0,1}`. The rational Tate module
  `V_ℓ(E) = H¹(E)^∨` has determinant `ε_ℓ`, which is Tau Ceti's
  `TauCeti.det_tateModuleGaloisRepresentation` transported by duality.
- Frobenius is geometric and local class field theory sends a uniformizer to geometric
  Frobenius. At a good place `H¹(E)` has Frobenius polynomial `X² − a_vX + q_v` and Euler factor
  `(1 − a_v q_v^{−s} + q_v^{1−2s})⁻¹`.
- Automorphic representations follow AutomorphicGaloisRepresentations' Conventions: a cuspidal
  π of `GL₂(𝔸_F)`, F totally real, has infinity type `(k,w)`, and `ρ_{π,ι}` is its attached
  representation (AutomorphicGaloisRepresentations §3.10) for a coefficient isomorphism
  `ι : ℚ̄_ℓ ≅ ℂ`, with good geometric Frobenius polynomial `X² − t_vX + q_vs_v` and determinant
  `χ_{π,ι}ε_ℓ⁻¹`. Type `(2,0)` is parallel weight two with discrete series `D_{2,0}` at every real
  place and finite-order central character. The local parameter is
  `rec(π_v ⊗ |det|_v^{−1/2})` and the cohomological local factor is `L(s−1/2, π_v)`.
- **Modular.** For F totally real, a continuous semisimple `r : G_F → GL₂(ℚ̄_ℓ)` is *modular* if
  `r ≅ ρ_{π,ι}` for a cuspidal π of type `(2,0)`; for semisimple r this is the attachment
  predicate `IsAttached` of AutomorphicGaloisRepresentationsPartII AG2.0, read through the
  Hilbert-member identification of AG2.P. An elliptic curve E/F is modular if `H¹(E)` is
  modular for one ℓ and ι, equivalently for all (§2.1). A residual `r̄ : G_F → GL₂(𝔽̄_ℓ)` is
  *residually modular* if `r̄^ss` is the semisimplified reduction of `ρ_{π₀,ι}` for a cuspidal
  `π₀` of some cohomological type `(k,w)`, all `k_τ ≥ 2`.
- Fix `n ≥ 3` odd. The abstract coefficient field is `M₀ = ℚ(μ_n)` with embeddings
  `j : M₀ → ℂ` and `j_ℓ : M₀ → ℚ̄_ℓ` satisfying `ι ∘ j_ℓ = j`. A character
  `θ : μ_n → M₀^×` acts through pullback: `u^*x = j_ℓ(θ(u))x`. Changing ℓ keeps θ; labels are
  never re-chosen at one prime.
- The conductor of E is `𝔫_E = ∏_v 𝔭_v^{f_v}`, with `f_v` the Artin conductor exponent of
  `WD(H¹(E)|G_{K_v})` for any ℓ prime to v (ArithmeticGaloisRepresentations Layer 3); it does not
  depend on ℓ. Its comparison with the exponent of Tate's algorithm (EllipticCurves Layer 4) is not
  used.
- `≡_ℓ` means isomorphic semisimplified reductions of stable lattices over a common finite
  coefficient extension; only this is lattice-independent.
- For the real cyclotomic data of §1.1 write `δ = (−1)^e` with `e : G_L → ℤ/2`, so that
  `g(ζ) = ζ^{δ(g)}` for `ζ ∈ μ_n`. A twist of a variety X by a cocycle `a` is a variety X′ with
  an isomorphism `φ : X′_{L̄} → X_{L̄}` such that `φ ∘ ᵍφ⁻¹ = a_g`, that is `ᵍφ = a_g⁻¹ ∘ φ`.
  Transported through φ, Galois acts on `X(L̄)` by `g ⋆ x = a_g(gx)`, on Tate modules by
  `a_g ∘ ρ(g)`, and on `H¹(X)` by `(a_g⁻¹)^* ∘ ρ(g)`: naturality of the Galois action gives
  `ρ_{X′}(g) ∘ φ^* = (ᵍφ)^* ∘ ρ_X(g) = φ^* ∘ (a_g⁻¹)^* ∘ ρ_X(g)`. For an involutive cocycle, such
  as the reflection cocycle `a_g = w^{e(g)}` of §1.2 or the quadratic-twist cocycle
  `a_g = [−1]^{e(g)}`, `a_g⁻¹ = a_g` and the rule reads `(w^*)^{e(g)} ∘ ρ(g)`, respectively
  `δ(g)ρ(g)`.
- Matrices act on columns.
- A local Euler factor is a rational function in `T = q_v^{−s}`, expanded at `T = 0`;
  its denominator has constant coefficient 1. Equalities of global L-functions first mean
  equality of Euler products in `Re(s) > 3/2`, and then of their analytic continuations.
  No pointwise inverse is asserted at a zero of a local denominator.

**Convention witnesses.**

- For 11a1 over ℚ, `π` of type `(2,0)` has `t₃ = a₃ = −1` and `s₃ = 1`, so
  `ρ_{π,ι}(Frob₃)` has polynomial `X² + X + 3`, that of `H¹(E)`. The Tate module `V_ℓ(E)` instead
  has determinant `ε_ℓ` and equals `ρ_{π⊗|det|,ι}`, of type `(2,−2)`; fixing type `(2,0)` rejects
  it.
- At 11a1 and q = 3, `α + β = −1` and `αβ = 3`; the unitary Satake roots `α/√3, β/√3` have
  product one, and `L(s−1/2, π₃) = (1 + 3^{−s} + 3^{1−2s})⁻¹`, the Euler factor of E. Reversing
  the half-shift gives `(1 + 3^{−s−1} + 3^{−2s−1})⁻¹` instead.
- The good local denominator of 11a1 at 3 is `1 + T + 3T²`, with value 1 at `T = 0`
  and `5/3` at `T = 1/3`. Its split multiplicative denominator at 11 is `1 − T`, again
  1 at zero but 0 at `T = 1`. The latter factor is a rational function with a pole there;
  total field inversion at zero cannot interpret that pole.
- For k = ℚ and n = 3, δ is the character of `ℚ(√−3)`: `δ(Frob₇) = 1` because 7 ≡ 1 mod 3, and
  `δ(Frob₂) = −1` because Frobenius at 2 inverts `ζ₃`.
- For `E: y² = x³ − x + 1` over `𝔽₅` there are 8 points, so `a₅ = −2`; its quadratic twist by the
  nonsquare 2, `y² = 3(x³ − x + 1)`, has 4 points and `a₅ = 2`. A quadratic twist multiplies the
  trace by the character value, here `(2/5) = −1`.
- The twist rule on `H¹` needs the inverse cocycle, which an involutive cocycle cannot detect.
  Over `ℚ(ζ₃)` let `b³ = 2`, `X: y² = x³ + 1`, `X′: y² = 2x³ + 1` and `φ(x, y) = (bx, y)`. For g
  with `g(b) = ζ₃b`, `ᵍφ(x, y) = (ζ₃bx, y)` and `a_g(x, y) = (ζ₃⁻¹x, y)`, of order three. With
  `ω = dx/(2y)` on X and `ω′ = dx/(2y)` on X′, `φ^*ω = bω′` and `g(bω′) = ζ₃bω′`, so the transported
  action sends ω to `ζ₃ω`. The rule `(a_g⁻¹)^* ∘ ρ(g)` gives `ζ₃ω`; the uninverted `a_g^* ∘ ρ(g)`
  would give `ζ₃⁻¹ω`. The same pullback rules govern the semilinear action on `H⁰(X_{ℚ̄}, Ω¹)` and
  the action on `H¹(X)`, where `a_g^*` has order three and so differs from its inverse.

## Exact supplier contracts

### From Mathlib

At `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`:
`NumberField.IsTotallyReal` and `NumberField.IsTotallyComplex`
(`Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean`: every infinite place
real, respectively complex); `NumberField.maximalRealSubfield`, the subfield of elements fixed by
complex conjugation under every complex embedding, with the instance
`NumberField.isTotallyReal_maximalRealSubfield` and the maximality statement
`NumberField.IsTotallyReal.le_maximalRealSubfield` (same file);
`NumberField.IsCMField`, `NumberField.IsCMField.ofCMExtension` and
`NumberField.CMExtension.eq_maximalRealSubfield`, which identifies a totally real subfield E with
K/E quadratic and K totally complex as the maximal real subfield
(`Mathlib/NumberTheory/NumberField/CMField.lean`); `IsCyclotomicExtension`
(`Mathlib/NumberTheory/Cyclotomic/Basic.lean`) and `IsCyclotomicExtension.Rat.isCMField`
(nontrivial cyclotomic extensions of ℚ are CM); `IsPrimitiveRoot`
(`Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean`) and `IntermediateField.adjoin`
(`Mathlib/FieldTheory/IntermediateField/Adjoin/Defs.lean`). These carry the statement
`realCyclotomic_isCMField` of §1.1 and its Checks; the relative statements of §1.1 over an
arbitrary base are proved here. `WeierstrassCurve`, `WeierstrassCurve.IsElliptic` (invertible
discriminant) and `WeierstrassCurve.j`, defined as `Δ⁻¹c₄³`
(`Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean`), together with `AlgebraicClosure`
(`Mathlib/FieldTheory/IsAlgClosed/AlgebraicClosure.lean`), `Module.Basis` and its coordinate
isomorphism `Module.Basis.equivFun` (`Mathlib/LinearAlgebra/Basis/Defs.lean`) and
`Matrix.SpecialLinearGroup` (`Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean`), carry the
statement `three_five_switch` of §2.3. `WeierstrassCurve.IsMinimal`, `WeierstrassCurve.minimal`
and the predicates `WeierstrassCurve.HasGoodReduction`, `WeierstrassCurve.HasMultiplicativeReduction`,
`WeierstrassCurve.HasSplitMultiplicativeReduction` and `WeierstrassCurve.HasAdditiveReduction` on a
Weierstrass equation over the fraction field of a discrete valuation ring, each of which includes
minimality of the equation (`Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean`), carry the
reduction types of the Conventions and of §4.2.

### From Tau Ceti

At `2fd255d997f47c0b5d834ee416c7015d55444ce5`: `WeierstrassCurve.tateModuleGaloisRepresentation`
(`TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Galois.lean`), the integral Tate
representation of an elliptic curve; `TauCeti.det_tateModuleGaloisRepresentation`
(`.../TateModule/Determinant.lean`), its determinant is the cyclotomic character for a
separably closed extension in which ℓ is invertible; `WeierstrassCurve.quadraticTwistOf`,
`WeierstrassCurve.quadraticTwist`, `WeierstrassCurve.quadraticTwistPointEquiv` and
`WeierstrassCurve.quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map`
(`.../QuadraticTwist/Basic.lean`): the twist by a separable quadratic extension, its point
isomorphism over a splitting field, and Galois equivariance up to the quadratic character. The
last is consumed in §§1.2 and 1.6 through the Tate module and duality. For the statement of §2.3:
`WeierstrassCurve.torsionGaloisAction` (`.../Affine/Point/Galois.lean`), the action of
`K ≃ₐ[F] K` on the N-torsion of the points over K of a curve over F;
`TauCeti.Isogeny.weilPairing` (`.../Isogeny/MulByInt/WeilPairing/Basic.lean`), the Weil pairing on
N-torsion over a separably closed field in which N is invertible, valued in N-th roots of unity;
`WeierstrassCurve.weilPairing_torsionGaloisAction` (`.../Isogeny/MulByInt/WeilPairing/Galois.lean`),
its Galois equivariance; `TauCeti.Isogeny.pointTorsionModule` and
`WeierstrassCurve.nonempty_basis_torsionBy` (`.../Isogeny/MulByInt/Torsion/Structure.lean`), the
`ZMod N`-module structure on N-torsion and a `Fin 2` basis of N-torsion over `ZMod N` under the same
hypotheses. `Suggested.lean` imports the three Tau Ceti modules that declare
`WeierstrassCurve.torsionGaloisAction`, `TauCeti.Isogeny.weilPairing` and
`TauCeti.Isogeny.pointTorsionModule`, the carriers of `three_five_switch`.

### From TauCetiRoadmap.ModularCurves

§0E, effective descent of projective relative curves with a compatibly descended relatively ample
line bundle, and of finite group actions. Used in §1.2 to descend the twisted covers, with the
canonical bundle as the polarization. Layers 3 and 5B, Drinfeld level structures and the
fixed-pairing full-level curves `Y(N,ζ)` for `N ≥ 3`, used in §2.3 at levels 5 and 15.

### From TauCetiRoadmap.EllipticCurves

Layer 4 (the reduction types of a minimal Weierstrass equation over a discrete valuation ring, on
Mathlib's reduction predicates, potential good reduction and the Tate curve with its split
multiplicative reduction) and Layer 4.5a (Layer 4's local minimal data at every height-one prime
of the integers of a number field, independent of the chosen equation): the reduction types of the
Conventions and of §4.2, items 5, 7 and 8. Layer 5 (quadratic twists and their Galois action):
§§1.2 and 1.6. Layer 0.5 (Galois actions on points and isogenies, and descent of morphisms): the
action of `G_K` on `End(E_K̄)` in §4.3 and in the contract required of
ComplexMultiplicationAndExplicitReciprocity below, whose route also names Layer 1 (the invariant
differential and its pullback along isogenies).

### From TauCetiRoadmap.JacobianChallenge

Layers D–F: the Jacobian `Pic⁰` of a smooth proper geometrically connected curve over a field
with a rational point, as an abelian variety, with its Abel–Jacobi map. The rational point is one
of that roadmap's standing hypotheses; the curves `C^δ_m` have one, `φ⁻¹(O, 1)` of §1.2(6). Used
for `J^δ_m = Pic⁰(C^δ_m)` in §§1.2–1.4.

### From TauCetiRoadmap.EllipticCurveModularityImaginaryQuadratic

The targets named under Scope and ownership, with their hypotheses: Layers 1–4 over an arbitrary
number field k and `t ∈ U(k)`; §5.1 over an arbitrary number field with geometric non-CM and its
finite exceptional set; §7.1 for the pairs `(m,ℓ) = (3,p), (3,5), (p,3)`; §7.4 for an arbitrary
number field k, a prime `p > max{100, 2[k:ℚ]+1}` outside the exceptional set of §5.1 over the
normal closure, a finite set of places containing those above 3p and nonempty local opens there,
with conclusions over `F = k(μ_{3p})`; §0.2 for every number field and `p ∈ {3,5}`, together with
the notion `SymplecticTorsionEquiv` of §0.2, which the statement of §2.3 writes out.

### From TauCetiRoadmap.AutomorphicGaloisRepresentations

§3.10 `ρ_{π,ι}` with its good polynomials, twist formula
`ρ_{π⊗(χ∘det),ι} ≅ ρ_{π,ι} ⊗ χ_ι` for algebraic Hecke characters, coefficient conjugation and
uniqueness; §3.13 geometric characters and algebraic Hecke characters; §3.14 determinant, total
oddness and absolute irreducibility; §4.4 full Frobenius-semisimple Weil–Deligne comparison with
monodromy at every finite `v∤ℓ`, for every π of type `(k,w)`; §4.7 potential semistability and
the full Weil–Deligne comparison at every `v|ℓ`, without residual hypotheses.

### From TauCetiRoadmap.AutomorphicGaloisRepresentationsPartII

AG2.0: `IsAttached` and its uniqueness, twist and dual rules; the ℓ-adic character `r_{l,ι}(χ)`
of an algebraic Hecke character. AG2.P: the weak and strict predicates on the shared carrier, and
“Independent classical and Hilbert members”, identifying the Hilbert member normalized by
`X² − t_vX + q_vs_v` with the AG2 member.

### From TauCetiRoadmap.PotentialAutomorphyInfrastructure

§2.3 `soluble_base_change_and_descent`, part (2): for F totally real, `E/F` finite Galois soluble
with E totally real, a continuous `ρ : G_F → GL_n(ℚ̄_p)` with `ρ|G_E` irreducible and
`ρ|G_E ≅ r_ι(Π)` for a cuspidal regular algebraic Π of weight λ descends to a cuspidal regular
algebraic `π_F` of weight `λ_F` with `ρ ≅ r_ι(π_F)`, with all-place local compatibility. Used in
§4.1 with n = 2 and λ = 0.

### From TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer

R16.2–R16.3 local Langlands for `GL₂`, newvectors, conductors (R16.3.5), Steinberg monodromy
(R16.3.2) and archimedean factors (R16.3.6); R16.4.4 strong multiplicity one; R16.6.3–R16.6.4
the conversion between Hilbert cohomological weights and the weight λ of AG2.0; R17.4.16
quadratic automorphic induction with its local parameters, central character, cuspidality
criterion and twisting; R17.5.14 solvable residual modularity over totally real fields in
parallel weight one.

R17.5.14 produces a parallel-weight-one witness and states that weight-two lifts are separate
inputs. R17.5 must add, after R17.5.14, the following statement, used in §2.4.

What GL2AutomorphicRepresentationsAndTransfer must provide (gap:totally-real-solvable-residual-cohomological-weight):
let F be totally real, p an odd prime and `r̄ : G_F → GL₂(𝔽̄_p)` continuous, absolutely
irreducible and totally odd with solvable image.
Then `r̄` is residually modular in the sense of the Conventions: it is the semisimplified reduction
of `ρ_{π₀,ι}` for a cuspidal `π₀` of a cohomological type, all `k_τ ≥ 2`.

A route starts from the Langlands–Tunnell weight-one witness of R17.5.14 over F. Choose a finite
soluble extension `F′/F` of totally real fields, linearly disjoint over F from the field cut out by
`r̄`, such that `r̄|G_{F′_w}` is unramified at every place w of `F′` above p. The extension `F′/F` is
in general ramified above p: an extension unramified at v leaves the image of the residual inertia
group at v unchanged, so a residual inertia image generated by `diag(−1,1)` at a place above an
odd p survives every unramified extension, while a ramified quadratic local extension kills it.
Over `F′` the base-changed weight-one form is ordinary at the places above p, and Hida theory
gives an ordinary parallel-weight-two form congruent to it, as in the proof of
[BLGG13II](#references), Theorem 3.1.1, p.3 (BLGG13II lines 129–145). That proof treats p = 3
under the hypotheses of its theorem (`r̄` already modular, reducible at the places above 3, and the
projective image of `r̄(G_{F(ζ₃)})` isomorphic to `PSL₂(𝔽₃)`); it does not establish the statement
for every odd p, and the return from `F′` to a cohomological weight over F is part of what the
supplier must prove. The elliptic case is [FLHS15](#references), Theorem 6, p.9 (FLHS15 line 404).

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

Layers 1–3 (continuous representations, stable lattices, Weil–Deligne representations, Artin
conductors); §4.1 complex conjugations and `GaloisRep.IsOdd`; §5.3 recognition by Frobenius
polynomials on a density-one set, `GaloisRep.iso_of_frobenius_charpoly_eq`; §§6.1–6.2 Tate
modules, Weil pairing and determinant, including `TateModule.residualRep`.

### From TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups

IG.2.4 Hilbert subsets and Hilbert irreducibility over number fields; IG.2.6 full-group
specialization; IG.2.7 Hilbert points with weak approximation. Used in §2.3.

### From TauCetiRoadmap.ModularCurvesPartII

§4.10 `fixedPairingGeometricConnectedness`: for `N ≥ 3` the fixed-pairing curve `Y(N,ζ)` is
geometrically connected. Used in §2.3 with N = 15.

### From TauCetiRoadmap.SmallRamificationAndAbelianVarietyBaseCases

§5.0d, the shared raw compatible-system carrier over an arbitrary number field and rank. The
descended systems are assembled on it at the end of §1.4, from the eigenspaces of §1.3 and the
properties proved in §1.4. Its finite base-field restriction is used in §1.4 as supplied: it raises
Frobenius roots to residue degrees, restricts the Hodge labels and replaces the bad set by the
places above it together with the places ramified in the extension, so it stores no polynomial at
a ramified place.

### From TauCetiRoadmap.PotentialModularityAndCompatibleSystems

§1.1 the comparison of the weak-family predicate with its specializations; §1.6 the automorphy
predicate of a system by good Frobenius polynomials. Used in §2.1.

### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuli

A4.1 the integral Tate module and its specialization at good reduction; A6 endomorphism actions on
realizations, in particular A6.11, the characteristic polynomial of an endomorphism on the Tate
module has integer coefficients independent of ℓ. Used in §§1.4, 2.2 and 4.3.

### From TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties

§3.10 semistable reduction after a finite extension; §5.1 Néron–Ogg–Shafarevich; §5.3 the
`p`-adic comparison at the residue prime; §5.6 the local Euler polynomial at bad places; §6.10 the
compatible system of an abelian variety. Used in §§1.4, 2.2 and 4.2.

### From TauCetiRoadmap.FaltingsFinitenessAndIsogenyTheorems

R28.4 semisimplicity of the rational Tate representation of an abelian variety over a number
field. Used in §1.4.

### From TauCetiRoadmap.ShimuraVarieties

§5.3 CM abelian varieties with their algebra action. Used in §4.3 for the action of the CM field.
This section works over ℂ; the field of definition of the CM endomorphisms over a number field is
the contract required of ComplexMultiplicationAndExplicitReciprocity below.

### From TauCetiRoadmap.EtaleCohomologyFoundations

§0.11 the trace and duality of a smooth proper curve, giving the cup-product pairing into
`H² ≅ ℚ̄_ℓ(−1)`. Used in §1.4.

### From TauCetiRoadmap.GL2ModularityLifting

GL2ModularityLifting §5.7 needs strong residual modularity, matching ordinary components and
residue field `𝔽_p` at its nonordinary places; §5.10 needs every place above p nonordinary with
residue field `𝔽_p`. Both need potentially Barsotti–Tate representations, so neither covers
potentially multiplicative places above p or mixed local types. Layer 5 of GL2ModularityLifting
must add, after §5.10, the following theorem, used in §2.2.

What GL2ModularityLifting must provide (gap:totally-real-weight-two-lifting): let F be totally
real, ℓ an odd prime and `r : G_F → GL₂(ℚ̄_ℓ)` continuous and unramified outside finitely many
places, with `det r = ε_ℓ⁻¹ν` for a finite-order character ν and with r potentially semistable
of labelled Hodge–Tate weights `{0,1}` at every `v|ℓ`. Suppose `r̄` is residually modular and
`r̄|G_{F(ζ_ℓ)}` is absolutely irreducible. When ℓ = 5, suppose also one of the following: (a) the image of
`r̄(G_{F(ζ₅)})` in `PGL₂(𝔽̄₅)` is not isomorphic to `PSL₂(𝔽₅)`; (b) `r̄` is the extension of scalars
of a representation `r̄₀ : G_F → GL₂(𝔽₅)` with `det r̄₀ = ε̄₅⁻¹`. Then r is modular. No condition
relates the local types of r at places above ℓ to those of the residual witness.

For ℓ ≠ 5, and for ℓ = 5 under (a), this is the universal modularity conclusion of
[BD14](#references), Théorème 3.2.2, pp.36–37 (BD14 lines 2144–2146 for its hypotheses, line 2171
for the conclusion), proved from Gee's prescribed-type lifts and the ordinary lifts of
[BLGG12](#references), Theorems 6.1.5 and 6.1.8 (BLGG12 line 2024 and line 2198), and
[BLGG13II](#references), Theorems 2.1.2 and 3.1.2 (BLGG13II line 82 and line 149), with
[Kisin09](#references), Theorem (3.5.5) (Kisin09 line 3976). Alternative (b) is
[FLHS15](#references), §2, pp.5–6 (FLHS15 lines 241–265). The five-adic hypothesis of BD14 serves
to exclude, in the construction of Taylor–Wiles systems, that the projective kernel field `K₀` of
`r̄` has `Gal(K₀/F) ≅ PSL₂(𝔽₅)` with `ζ₅ ∈ K₀`. For an `𝔽₅`-model the composite of its projective
image with `PGL₂(𝔽₅) → 𝔽₅^×/(𝔽₅^×)²` is `det r̄₀` modulo squares, the character of `F(√5)/F`; so a
projective image `PSL₂(𝔽₅)` forces `√5 ∈ F`, and then `Gal(F(ζ₅)/F)`, of order two because
`√5 ∈ F` and `ζ₅ ∉ F`, would be a quotient of the simple group `A₅`. Without an `𝔽₅`-model the
square class of the determinant does not determine that of the projective image (§2.2, Checks), so
(b) is not asserted for representations that have none. Skinner–Wiles' residually reducible
theorems ([SW99](#references), Theorem A, and Theorem B under Hypothesis H) do not supply this
statement.

### From TauCetiRoadmap.ComplexMultiplicationAndExplicitReciprocity

§4.1, "The algebraic Hecke character of a CM abelian variety" and "One-dimensional CM components
of the Tate module": for an abelian variety A of dimension g over a number field k with a CM field
of degree 2g in `End⁰_k(A)` and every endomorphism defined over k, the algebraic Hecke character
of k attached to A and the decomposition of `V_ℓ(A) ⊗ ℚ̄_ℓ` into the rank-one realizations of its
coefficient components. Used in §4.3 for `E ⊗_K KT`, with g = 1.

§1.1 uses, for a curve over ℚ, that the action of the CM order on the Lie algebra, by the same
scalar as on the invariant differential, is Galois equivariant; no section states the general field
of definition. Layer 1 of ComplexMultiplicationAndExplicitReciprocity must add, before §1.1, the
following statement, used in §4.3.

What ComplexMultiplicationAndExplicitReciprocity must provide (gap:cm-elliptic-endomorphism-field):
let K be a field of characteristic zero with algebraic closure K̄ and `G_K = Gal(K̄/K)`, and let E/K
be an elliptic curve whose geometric endomorphism ring `End(E_K̄)` is an order in an imaginary
quadratic field. For a nonzero invariant differential ω of E over K define
`[·] : End(E_K̄) → K̄` by `α^*ω = [α]ω`. Then `[·]` is an injective ring homomorphism, independent
of ω, with `[ᵍα] = g([α])` for every `g ∈ G_K`, where `ᵍα = g ∘ α ∘ g⁻¹`. With `T ⊂ K̄` the
quadratic field generated by its image, an endomorphism α is defined over an intermediate field
`K ⊆ K′ ⊆ K̄` exactly when `[α] ∈ K′`; in particular the kernel of the action of `G_K` on
`End(E_K̄)` is `G_{KT}`.

A route: pullback of invariant differentials is additive and reverses composition (EllipticCurves
Layer 1; Tau Ceti `TauCeti.Isogeny.Hom.pullbackDifferential`,
`TauCeti.Isogeny.Hom.pullbackDifferential_comp` and
`TauCeti.Isogeny.Hom.pullbackDifferential_add_invariantDifferential`, in
`TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom/Differential.lean`); a nonzero isogeny in
characteristic zero is separable and so pulls ω back to a nonzero differential; ω is K-rational,
so conjugating α by g applies g to the scalar `[α]`; and descent of morphisms (EllipticCurves
Layer 0.5) identifies the endomorphisms defined over `K′` with those fixed by `G_{K′}`
([OpenAI26](#references), §9.4, p.27, OpenAI26 lines 1200–1202). Since `T/ℚ` is quadratic,
`Gal(KT/K)` has order at most two, so `g([α]) = g⁻¹([α])` and the formula does not depend on
whether Galois acts on points through g or through g⁻¹. Characteristic zero is a hypothesis: over
a finite field the Frobenius endomorphism is nonzero and pulls ω back to zero (§4.3, Checks).

## How to read the build

Layer 1 works over an arbitrary number field k and a parameter `t ∈ U(k)`. It constructs the real
cyclotomic subfield L, the reflection twist of the imported covers over L, the descended
character systems `W_θ`, their integral lattices and congruences, and their two elliptic
endpoints. Layer 2 proves the totally real tools: change of coefficient prime, the weight-two
lifting theorem for rank-two summands of abelian varieties, and the elliptic seeds at three and
five. Layer 3 fixes a non-CM curve over a totally real K, chooses one auxiliary prime p and one
parameter t satisfying every residual condition over L, makes the cubic piece modular through
the seed, and lifts three times. Layer 4 descends to K, removes the twists, compares all local
factors, adds the CM branch and states the endpoint. Each target lists in its *Needs:* line what
its statement and its route use.

## Layer 1: Reflection descent over the real cyclotomic subfield

### 1.1 The real cyclotomic subfield over a base

For a number field k and an integer `n ≥ 3`, choose a primitive n-th root of unity ζ in `k̄` and
define the **real cyclotomic data** `(M, L, δ)` of `(k, n)`: `M = k(μ_n)`, `L = k(ζ + ζ⁻¹)`, and
`δ : G_L → {±1}` the character with `g(ζ) = ζ^{δ(g)}`. Prove the following.

- L does not depend on the choice of ζ: for a unit a modulo n, `ζ^a + ζ^{−a}` is a polynomial with
  integer coefficients in `ζ + ζ⁻¹`.
- `M = L(ζ)` and `[M:L] ≤ 2`, since ζ is a root of `X² − (ζ+ζ⁻¹)X + 1`. Every `g ∈ G_L` acts on
  all of `μ_n(k̄)` by `x ↦ x^{δ(g)}`; δ is the character of `M/L` and is trivial exactly when
  `M = L`.
- `M/k` and `L/k` are abelian.
- If k is totally real, then L is totally real, `[M:L] = 2`, M is a CM field with
  `L = maximalRealSubfield M`, and `δ(c) = −1` for every complex conjugation `c ∈ G_L`.
- If k is totally real and ℓ is an odd prime dividing n, then `L(μ_ℓ) = M`.

The fourth item, the headline of this section, is `realCyclotomic_isCMField` in `Suggested.lean`:
for a totally real number field k, a number field M with `IsCyclotomicExtension {n} k M` and
`n > 2`, and a primitive n-th root of unity ζ in M, the field M satisfies `NumberField.IsCMField`
and the intermediate field `IntermediateField.adjoin k {ζ + ζ⁻¹}`, viewed as a subfield of M, is
`NumberField.maximalRealSubfield M`. The remaining assertions of the item follow: a CM field is
totally complex and quadratic over its maximal real subfield, which is totally real, so L is
totally real, `[M:L] = 2`, and every complex conjugation restricts to the nontrivial element of
`Gal(M/L)`, where `δ(c) = −1`. Over k = ℚ the first half is Mathlib's
`IsCyclotomicExtension.Rat.isCMField`; the relative statement over an arbitrary totally real base
is proved here. The route: every complex embedding sends ζ to a nonreal root of unity, so M is
totally complex; it sends `ζ + ζ⁻¹` and k into ℝ, so L is totally real; ζ is a root of
`X² − (ζ + ζ⁻¹)X + 1` over L and lies outside L, so `[M:L] = 2`; and
`NumberField.CMExtension.eq_maximalRealSubfield` with `NumberField.IsCMField.ofCMExtension`
conclude.

([LeHung26](#references), §3.2, p.6, LeHung26 line 237, for `n = 3p` over a totally real base; the
statements for general n and k are the elementary extension proved here.)

*Needs:* Mathlib `NumberField.IsTotallyReal`, `NumberField.IsTotallyComplex`,
`NumberField.maximalRealSubfield`, `NumberField.IsCMField.ofCMExtension`,
`NumberField.CMExtension.eq_maximalRealSubfield`, `IsCyclotomicExtension`, `IsPrimitiveRoot`,
`IntermediateField.adjoin`.

**API.**

- The data are unchanged when ζ is replaced by another primitive root.
- δ is trivial on `G_M` and factors through `Gal(M/L)`.
- For a finite extension `k′/k` the data of `(k′, n)` are the composita `k′L` and `k′M`, and δ
  restricts.
- For `d ≥ 3` dividing n, the data `(M_d, L_d, δ_d)` of `(k, d)` satisfy `M_d ⊆ M` and `L_d ⊆ L`,
  and `δ_d` restricted to `G_L` is δ: with `ζ_d = ζ^{n/d}`, `g(ζ_d) = ζ_d^{δ(g)}`. The bound `d ≥ 3`
  is the domain of the data; for `d ∈ {1, 2}` one has `M_d = L_d = k` with trivial character, which
  differs from δ whenever δ is nontrivial.
- For k totally real, L agrees with Mathlib's maximal real subfield of M and M is CM in Mathlib's
  sense.

**Checks.**

- For k = ℚ and n = 3: `ζ₃ + ζ₃⁻¹ = −1`, so L = ℚ and `M = ℚ(√−3)`, with δ the character of
  `ℚ(√−3)`. Defining L as `k(ζ)` would give L = M and trivial δ.
- For k = ℚ and n = 9, `2cos(2π/9)` is a root of `x³ − 3x + 1` and L is cubic; for n = 15,
  `[L:ℚ] = φ(15)/2 = 4` and L contains `√5`.
- Degenerate case: for `k = ℚ(√−3)` and n = 3, `M = L = k` and δ is trivial; the fourth item
  needs k totally real.
- Non-example: for `k = ℚ(i)` and n = 3, L = `ℚ(i)` while the maximal real subfield of
  `M = ℚ(ζ₁₂)` is `ℚ(√3)`, which does not contain k. Outside the totally real case L is not the
  maximal real subfield.
- The Lean statement allows even n. For k = ℚ and n = 4, `ζ = i` and `ζ + ζ⁻¹ = 0`, so L = ℚ, the
  maximal real subfield of `ℚ(i)`; for n = 6, `ζ₆ + ζ₆⁻¹ = 1` and again L = ℚ inside `ℚ(√−3)`.
- Over a base other than ℚ: for `k = ℚ(√2)` and n = 8, `ζ₈ + ζ₈⁻¹ = √2 ∈ k`, so L = k and
  `M = ℚ(ζ₈)` has degree 2 over it; for `k = ℚ(√5)` and n = 5, `ζ₅ + ζ₅⁻¹ = (−1 + √5)/2 ∈ k`, so
  again L = k, while for k = ℚ and n = 5 the field L is `ℚ(√5) ≠ k`. The model "L = k" therefore
  fails in general.
- For n = 1 or 2, `ζ + ζ⁻¹ = ±2` and `L = M = k`; the hypothesis `n ≥ 3` is needed for
  `[M:L] = 2`. For k = ℚ, n = 3 and d = 1, the trivial character has value 1 at complex
  conjugation while δ has value −1, so the divisor statement of the API excludes d = 1 and 2.

### 1.2 The reflection twist

Fix a number field k, an elliptic `E: y² = h(x)` over k, an odd `n ≥ 3`, a parameter
`t ∈ U(k)` for EllipticCurveModularityImaginaryQuadratic §1.1 `switchParameterOpen`, and the real
cyclotomic data of §1.1. For `m|n` with `m > 1`, let `C_m = C_m(t)` be §1.3 `cyclicCover m` of that
roadmap, with reflection w defined over k and rotations `u_ζ` defined over `k(μ_m) ⊆ M`,
satisfying `w² = 1` and `w u_ζ w = u_{ζ⁻¹}`. Construct the **reflection twist** `C^δ_m`: the twist
of `C_m ⊗_k L` by the cocycle `g ↦ w^{e(g)}`. It is a smooth proper geometrically connected curve
of genus m over L with an isomorphism `φ : C^δ_m ⊗_L M → C_m ⊗_k M` satisfying `φ ∘ ᵍφ⁻¹ = w^{e(g)}`.
For m = 1 put `C^δ_1 = B^δ_t`, the quadratic twist of `B_t ⊗_k L` by δ. Prove:

1. `g ↦ w^{e(g)}` is a cocycle, because w is k-rational and `w² = 1`; the twist exists and is
   unique up to unique isomorphism compatible with φ. The descent datum on `C_m ⊗ M` relative to
   `M/L` is effective because the canonical bundle is ample (genus `m ≥ 3`) and every
   automorphism carries a canonical isomorphism of it.
2. The transported rotations `u′_ζ = φ⁻¹u_ζφ` and reflection `w′ = φ⁻¹wφ` are defined over L and
   satisfy the same relations. Indeed `ᵍu′_ζ = φ⁻¹ w^{e(g)} u_{g(ζ)} w^{e(g)} φ = u′_ζ`.
3. The quotient maps `C_n → C_m` twist to L-morphisms `C^δ_n → C^δ_m` compatible with rotations
   and reflection.
4. `C^δ_m/⟨u′⟩ ≅ B^δ_t` over L, because w induces `[−1]` on `B_t`. If `3 | n`, so that `C_3` is a
   member of the tower, then `C^δ_3/⟨w′⟩ ≅ D_t ⊗_k L` for `D_t = C_3(t)/⟨w⟩`, because w acts
   trivially on that quotient.
5. For every prime ℓ, `φ^*` is an isomorphism `H¹(C_{m,L̄}, ℤ_ℓ) → H¹(C^δ_{m,L̄}, ℤ_ℓ)` carrying
   `u_ζ^*` to `u′_ζ^*` and `w^*` to `w′^*`, under which `g ∈ G_L` acts on the source by
   `(w^*)^{e(g)}ρ(g)`. This is the rule `(a_g⁻¹)^* ∘ ρ(g)` of the Conventions, since
   `a_g = w^{e(g)}` is its own inverse.
6. `C^δ_m` has an L-rational point. The principal function `f_t` of
   EllipticCurveModularityImaginaryQuadratic §1.2 has value 1 at O, and O lies outside the support
   `{±S, ±R}` of its divisor (§1.1 there), so `C_m → B_t` is étale over O with fiber
   `{(O, ζ) : ζ ∈ μ_m}`, and `(O, 1)` is a k-rational point of `C_m`. Since
   `w(O, 1) = (−O, 1⁻¹) = (O, 1)`, the twisted action fixes it,
   `g ⋆ (O, 1) = w^{e(g)}(O, 1) = (O, 1)` for every `g ∈ G_L`, so `φ⁻¹(O, 1) ∈ C^δ_m(L)`. The
   quotient maps of item 3 send these points to one another, and to the origin of `B^δ_t`.

([LeHung26](#references), §3.2, (9) and Lemma 3.2 with proof, p.6, LeHung26 lines 237–240 and
line 245.)

*Needs:* §1.1; EllipticCurveModularityImaginaryQuadratic §§1.1–1.3; ModularCurves §0E;
EllipticCurves Layer 5; Tau Ceti `WeierstrassCurve.quadraticTwist`; JacobianChallenge Layers D–F.

**API.**

- If δ is trivial, the twist is `C_m ⊗_k L` with `φ` the identity.
- Formation commutes with finite extensions `L′/L`, transporting φ.
- The twisted quotient maps compose as in EllipticCurveModularityImaginaryQuadratic §1.3, with
  `d | m | n`.
- The Jacobian `J^δ_m = Pic⁰(C^δ_m)` is an abelian variety over L of dimension m on which
  `u′` and `w′` act by L-endomorphisms.
- Base change of `C^δ_m` to M is identified with `C_m ⊗ M` through φ, compatibly with rotations,
  reflection and quotients.

**Checks.**

- Matrix witness of the descent identity, for δ nontrivial and `g ∈ G_L` with `δ(g) = −1`:
  `R = [[0,−1],[1,−1]]` has order three and `W = [[0,1],[1,0]]` has `WRW = [[−1,1],[−1,0]] = R⁻¹`.
  Hence `WR⁻¹W = R`: conjugating the Galois image `R⁻¹` of a rotation under g by the reflection
  returns R. Without the twist the Galois image `R⁻¹ ≠ R` shows the rotations are not L-rational.
- For `k = ℚ(√−3)` and n = 3, δ is trivial, the rotations are already L-rational, and the twist is
  `C_3 ⊗ L` itself.
- For δ nontrivial, a cocycle with values in the rotations cannot replace w: rotations commute, so
  conjugating `u_{ζ⁻¹}` by a rotation leaves `u_{ζ⁻¹}`, and the rotations stay non-rational over L.
  When δ is trivial there is nothing to repair: `L = M` contains `k(μ_m)`.
- On `H¹(B_t)` the reflection acts by `[−1]^* = −1`, so the m = 1 case is the quadratic twist.
  The convention witness for `y² = x³ − x + 1` at 5, traces `−2` and `2`, fixes the sign rule.
- Negative control for the cubic clause: for n = 5 the tower has indices 1 and 5 only. Forcing
  `Y³ = f_t` anyway, the valuations of `f_t` at `S, −S, R, −R` are `1, −1, −5, 5`, none divisible by
  3, so the cubic cover of `B_t` has four branch points, `2g − 2 = 4·(3 − 1) = 8` and genus 5, not
  the genus-three curve the endpoint uses. For n = 15 the valuations `∓15` at `±R` are divisible by
  3, there are two branch points, `2g − 2 = 4` and genus 3.
- The L-rational points of `C^δ_m` are the points fixed by `g ⋆ x = w^{e(g)}(gx)`, not those of
  `C_m` fixed by Galois. Take δ nontrivial and `g ∈ G_L` with `δ(g) = −1`. The branch points
  `(S, 0)` and `(−S, ∞)` of `C_m` are k-rational, but `w(S, 0) = (−S, ∞)`, so g exchanges them
  under ⋆: on `C^δ_m` they form one orbit of size two, defined over M and not over L. Conversely,
  for `ζ ∈ μ_m` with `ζ ≠ 1`, the point `(O, ζ)` is not L-rational on `C_m ⊗ L`, since
  `g(O, ζ) = (O, ζ⁻¹) ≠ (O, ζ)`, while `g ⋆ (O, ζ) = w(O, ζ⁻¹) = (O, ζ)`, so `φ⁻¹(O, ζ)` is an
  L-rational point of the twist. The point `(O, 1)` of §1.2(6) is rational on both.

### 1.3 The descended character systems

For a character `θ : μ_n → M₀^×` and a prime ℓ, define the **descended character system**
`W_{θ,ℓ} ⊆ H¹(C^δ_{n,L̄}, ℚ̄_ℓ)` as the θ-eigenspace of the L-rational rotations:
`u′^*_ζ x = j_ℓ(θ(ζ))x` for all ζ. It is `G_L`-stable, because the rotations are L-rational
(§1.2(2)). These eigenspaces, with their Galois actions and the idempotents below, are all that
this section constructs; the compatible system they form is assembled at the end of §1.4, after
its polynomials, semisimplicity and Hodge labels are proved.

([LeHung26](#references), Lemma 3.2, p.6, LeHung26 line 241.)

*Needs:* §1.2; EllipticCurveModularityImaginaryQuadratic §4.1 `characterSystem θ`.

**API.**

- `φ^*` restricts to a `G_M`-equivariant isomorphism from `V_{θ,ℓ}` of
  EllipticCurveModularityImaginaryQuadratic §4.1, at t over `F = M`, onto `W_{θ,ℓ}|G_M`.
- `w′^*` maps `W_θ` onto `W_{θ⁻¹}` and is `G_L`-equivariant, so `W_θ ≅ W_{θ⁻¹}` over L.
- `W_θ` is the image of the idempotent `e_θ = n⁻¹ Σ θ(ζ)⁻¹ u′^*_ζ` of `M₀[U′] ⊆ End_L(J^δ_n) ⊗ M₀`,
  hence a summand of `H¹` of an abelian variety over L.
- For `d | n` and θ of order dividing d, pullback along `C^δ_n → C^δ_d` identifies the θ-part of
  `H¹(C^δ_d)` with `W_θ`, rationally.
- Coefficient extension and change of the embedding `j_ℓ` transport the eigenspace with the fixed
  label θ.

**Checks.**

- For n = 3, `H¹(C^δ_3)` has dimension six, split into three two-dimensional pieces `W_1`,
  `W_η`, `W_{η⁻¹}`.
- θ = 1 gives `W_1 = H¹(B^δ_t)`, of rank two, not a trivial or one-dimensional representation.
- Non-example: inducing `V_θ` from `G_M` to `G_L` gives `W_θ ⊗ Ind_{G_M}^{G_L} 1`, of rank
  `2[M:L]`. When δ is nontrivial (for instance for every totally real k), `[M:L] = 2`,
  `Ind_{G_M}^{G_L} 1 = 1 ⊕ δ` and the induction is `W_θ ⊕ (W_θ ⊗ δ)`, of rank four; the twist is
  what produces a rank-two `G_L`-representation. Positive control: for `k = ℚ(√−3)` and n = 3,
  `M = L`, δ is trivial, `Ind_{G_M}^{G_L} 1 = 1`, and the induction is `V_θ = W_θ` itself, of rank
  two, not `W_θ ⊕ W_θ`.
- For ℓ dividing n the eigenspace is still taken with characteristic-zero coefficients; the
  integral statement is §1.5 and uses no integral projector.

### 1.4 Determinant, weights, compatibility and total oddness

Let S be the finite set of places of L where `J^δ_n` has bad reduction, together with the places
above n. Prove: for every θ and ℓ, `W_{θ,ℓ}` is a semisimple two-dimensional representation of
`G_L` with `det W_{θ,ℓ} = ε_ℓ⁻¹`, potentially semistable at every `v|ℓ` with labelled Hodge–Tate
weights `{0,1}`, and crystalline at every `v|ℓ` outside S. Outside S and away from ℓ it is
unramified, and the characteristic polynomial of geometric Frobenius is `j_ℓ(P_{θ,v})` for a monic
polynomial `P_{θ,v} ∈ M₀[X]` of degree two, independent of ℓ, with constant term `q_v ≠ 0`. If k
is totally real, `W_θ` is totally odd: `det W_θ(c) = −1` for every complex conjugation c.

Then assemble the **descended system** `W_θ`: the shared raw carrier of
SmallRamificationAndAbelianVarietyBaseCases §5.0d over L in rank two, with coefficient field `M₀`,
bad set S, good polynomials `P_{θ,v}`, member at the place λ of `M₀` induced by `j_ℓ` the
eigenspace `W_{θ,ℓ}`, realized over the completion `M_{0,λ}` (the rotations have eigenvalues in
`M₀`), and Hodge multiset `{0,1}` at every embedding of L. Prove that it satisfies the weak predicate
of AutomorphicGaloisRepresentationsPartII AG2.P. The direction is eigenspaces (§1.3), then their
properties, then the packaged system.

For the determinant use `[x,y]_θ = ⟨x, w′^*y⟩`, with `⟨,⟩` the cup product into
`H²(C^δ_{n,L̄}) ≅ ℚ̄_ℓ(−1)`. Rotations preserve the cup product, so it pairs `W_θ` perfectly with
`W_{θ⁻¹}`; w′ and the cup product are L-rational, so `[,]_θ` is a perfect `G_L`-equivariant
pairing, alternating since `⟨y, w′^*x⟩ = ⟨w′^*y, x⟩ = −⟨x, w′^*y⟩`. Weights and potential
semistability are unchanged by restriction to the open subgroup `G_M` and hold there by
EllipticCurveModularityImaginaryQuadratic §4.1 `character_system_properties`. Semisimplicity
holds for `H¹(J^δ_n)` by Faltings and passes to the summand. For the polynomials, at `v ∉ S` the
traces of `Frob_v ∘ u′^*_ζ` on `H¹` are those of an endomorphism of the reduction of `J^δ_n`, hence
integers independent of ℓ. Oddness is `ε_ℓ⁻¹(c) = −1`.

([LeHung26](#references), Lemma 3.2 and proof, p.6, LeHung26 lines 241–242 and 247–248;
[OpenAI26](#references), Proposition 5.1 and proof, pp.12–13, OpenAI26 line 480.)

*Needs:* §1.3; EtaleCohomologyFoundations §0.11; EllipticCurveModularityImaginaryQuadratic §4.1
`characterSystem θ` and `character_system_properties`; FaltingsFinitenessAndIsogenyTheorems R28.4;
AbelianSchemesAndArithmeticModuli A4.1 and A6.11; NeronModelsAndSemistableAbelianVarieties §§5.1
and 5.3; SmallRamificationAndAbelianVarietyBaseCases §5.0d (the carrier with its restriction, dual
and Tate twist, for the assembly and its API); AutomorphicGaloisRepresentationsPartII AG2.P;
ArithmeticGaloisRepresentations §4.1.

**API.**

- Members: the member of `W_θ` at a place λ of `M₀` above ℓ is the θ-eigenspace of
  `H¹(C^δ_{n,L̄}, ℚ_ℓ) ⊗_{ℚ_ℓ} M_{0,λ}`, on which `u′^*_ζ` acts by the image of `θ(ζ)` in `M_{0,λ}`.
  It depends only on λ, and its extension of scalars along any embedding `j_ℓ` inducing λ is the
  eigenspace `W_{θ,ℓ}` formed with that `j_ℓ`. Two embeddings inducing λ differ by some
  `σ ∈ Gal(ℚ̄_ℓ/ℚ_ℓ)`, `j′_ℓ = σ ∘ j_ℓ`, and `1 ⊗ σ` carries the first eigenspace σ-semilinearly
  and `G_L`-equivariantly onto the second.
- Restriction to M: through `φ^*`, the restriction of `W_θ` to `G_M` on the carrier has as members
  those of EllipticCurveModularityImaginaryQuadratic §4.1 `characterSystem θ` at t over `F = M`,
  with the same Hodge multisets `{0,1}`. The finite places of L ramified in `M = L(ζ)` lie above n,
  hence in S, so the restricted bad set is the set of places of M above S and every place w of M
  above `v ∉ S` lies outside it. At such w the stored polynomial, whose
  roots are the `f(w|v)`-th powers of the roots of `P_{θ,v}`, is the characteristic polynomial of
  geometric Frobenius at w on the members of `characterSystem θ`. The two bad sets are not
  compared: that of `characterSystem θ` is only asserted to be finite.
- Reflection: `w′^*` carries each member of `W_θ` onto the member of `W_{θ⁻¹}` at the same place,
  linearly over `M_{0,λ}` and `G_L`-equivariantly. The two systems have the same bad set S and the
  same Hodge multisets, and `P_{θ,v} = P_{θ⁻¹,v}` for `v ∉ S`.
- Base change: for a finite extension `L′/L`, the restriction of `W_θ` to `G_{L′}` on the carrier
  has as members the θ-eigenspaces of `H¹` of `C^δ_n ⊗_L L′` under the transported rotations. Its
  bad set `S_res` is the one the restriction of §5.0d assigns: the places of `L′` above S together
  with the places of `L′` ramified over L. Write `f = f(v′|v)` and α, β for the roots of `P_{θ,v}`.
  At `v′ ∉ S_res` above v, the stored polynomial has roots `α^f` and `β^f`. More generally, for
  every `v ∉ S` and every `v′|v`, ramified or not, the member at a place λ of `M₀` not above the
  residue characteristic of v is unramified at v′, and the characteristic polynomial of geometric
  Frobenius at v′ on it has roots `α^f`, `β^f` and constant term `q_v^f = q_{v′}`: the inertia
  group at v′ lies in that at v, and modulo the latter a geometric Frobenius at v′ is the f-th power
  of one at v. At a ramified v′ this second statement concerns the members only: v′ lies in
  `S_res`, and the restricted carrier stores no polynomial there.
- Duality: the pairing `[,]_θ` identifies the dual of each member of `W_θ` with the corresponding
  member of the Tate twist `W_θ ⊗ ε_ℓ`, `G_L`-equivariantly. On polynomials this is the equality
  of root multisets `{α⁻¹, β⁻¹} = {α/q_v, β/q_v}` for the roots α, β of `P_{θ,v}`, since `αβ = q_v`;
  on Hodge multisets it is `−{0,1} = {0,1} − 1`.

**Checks.**

- The cup product alone pairs `W_θ` with itself to zero when `θ² ≠ 1`, as for θ of order 3 or p;
  inserting `w′` is what makes the pairing on `W_θ` perfect.
- `W_1 ≅ H¹(B_t)|G_L ⊗ δ` (§1.6) has determinant `ε_ℓ⁻¹δ² = ε_ℓ⁻¹`, value `−1` at c: the
  quadratic twist does not spoil oddness.
- For `k = ℚ(√−3)` there are no real places and oddness is vacuous; the statement asserts it
  only for totally real k.
- A member with determinant `ε_ℓ` (Tate-module convention) or weights `{0,2}` is excluded; the
  cup-product target has weight one, matching `0 + 1`.
- Restriction witness: for k = ℚ and n = 3, L = ℚ and `M = ℚ(√−3)`; suppose `5 ∉ S` and `B_t`
  reduces modulo 5 to `y² = x³ − x + 1`, with 8 points and `a₅ = −2`. Since 5 is inert in M,
  `δ(Frob₅) = −1` and `P_{1,5} = X² − 2X + 5`, with roots `1 ± 2i`. At the place w above 5,
  `f(w|5) = 2`, and the restricted polynomial has roots `(1 ± 2i)² = −3 ± 4i`, that is
  `X² + 6X + 25`: the polynomial of the same curve over `𝔽₂₅`, which has 32 points
  (`a = 26 − 32 = −6`). Keeping the roots unsquared would give `X² − 2X + 5` and retain the sign δ,
  which is trivial on `G_M`.
- Ramified base-change witness: in the same setting take `L′ = ℚ(√5)`, in which 5 is ramified, so
  the place v′ above 5 has `e = 2`, `f = 1` and `q_{v′} = 5`. Then v′ lies in `S_res` and the
  restricted carrier stores no polynomial there, while the restricted members at every λ not above
  5 are unramified at v′ with geometric Frobenius polynomial `X² − 2X + 5`, that is `P_{1,5}` itself
  since `f = 1`; the sign δ stays `−1` at v′, because 2 ≡ −3 is not a square in the residue field
  `𝔽₅` of v′. Using e in place of f would square the roots and give `X² + 6X + 25`, which is the
  correct answer only at the unramified place of `M = ℚ(√−3)` above 5 (outside `S_res`, where the
  stored and the member polynomial agree); requiring a stored polynomial at every place above the
  complement of S would ask for data at v′ that the restriction does not record.

### 1.5 Integral lattices and the congruence chain

Fix ℓ and a finite extension `E_λ` of `ℚ_ℓ` inside `ℚ̄_ℓ` containing the field `j_ℓ(M₀)`, with
ring of integers O, maximal ideal 𝔪 and residue field `κ`. The field `j_ℓ(M₀)` is not contained in
O, since it contains `1/ℓ`; what lies in O are the values of the characters: every `j_ℓ(θ(ζ))` is a
root of unity, hence a unit of O. Define the **descended character lattice**
`T^δ_θ = H¹(C^δ_{n,L̄}, ℤ_ℓ) ⊗_{ℤ_ℓ[U′], j_ℓ∘θ} O`, where `u′_ζ` acts on O by `j_ℓ(θ(ζ))`. Prove
that `T^δ_θ` is a free O-module of rank two, stable under `G_L`, with `T^δ_θ ⊗_O ℚ̄_ℓ ≅ W_{θ,ℓ}`
(rationalize to `E_λ`, then extend scalars along `E_λ ⊆ ℚ̄_ℓ`); and that if `j_ℓ∘θ` and `j_ℓ∘θ′`
have equal reductions as characters `μ_n → κ^×`, then `T^δ_θ/𝔪 ≅ T^δ_{θ′}/𝔪` as
`κ[G_L]`-modules. This includes ℓ dividing n. Consequently, for n = 3p with `p > 3` prime, η of
order 3, ψ of order p and `χ = ηψ`,

```text
W_η ≡_p W_χ ≡_3 W_ψ ≡_p W_1     over L,
```

and also `W_η ≡_3 W_1`. Freeness is §1.2(5) applied to
EllipticCurveModularityImaginaryQuadratic §3.1 `integral_regular_module_etale`; `G_L` acts
`ℤ_ℓ[U′]`-linearly because the rotations are L-rational, so it acts on the evaluation quotient.

([LeHung26](#references), Lemma 3.2, (10) and proof, p.6, LeHung26 line 243 and lines 246–247;
[OpenAI26](#references), Lemma 5.3, p.13, OpenAI26 line 547, and Corollary 5.4, p.14, OpenAI26
line 571.)

*Needs:* §§1.2–1.4; EllipticCurveModularityImaginaryQuadratic §3.1
`integral_regular_module_etale`, §4.3 `characterLattice θ`, §4.4 `prime_switch_congruences`;
ArithmeticGaloisRepresentations Layer 1.

**API.**

- Evaluation: `T^δ_θ` is the quotient of `H¹(C^δ_{n,L̄}, ℤ_ℓ) ⊗_{ℤ_ℓ} O` by the O-submodule generated
  by the elements `(u′^*_ζ − j_ℓ(θ(ζ)))x`; the quotient map is O-linear, `G_L`-equivariant and
  intertwines `u′^*_ζ` with multiplication by `j_ℓ(θ(ζ))`.
- Rank: for every prime ℓ, including ℓ dividing n, `T^δ_θ` is free of rank two over O, because §1.2(5)
  transports the regular-module marking `H¹ ≅ ℤ_ℓ[μ_n]²` of EllipticCurveModularityImaginaryQuadratic
  §3.1 to `C^δ_n`, compatibly with the rotations.
- Galois action: `G_L` acts continuously and O-linearly on `T^δ_θ`, commuting with `U′`, since the
  rotations `u′_ζ` are L-rational (§1.2(2)).
- Rationalization: `T^δ_θ ⊗_O E_λ` is the θ-eigenspace of `H¹(C^δ_{n,L̄}, E_λ)`, and its extension of
  scalars to `ℚ̄_ℓ` is `W_{θ,ℓ}` as a `G_L`-representation.
- Coefficient extension: for a finite extension `E′/E_λ` with integers `O′`, the lattice formed with
  `O′` is `T^δ_θ ⊗_O O′`, `G_L`-equivariantly.
- Restriction to `G_M`: `φ^*` identifies `T^δ_θ|G_M` with
  EllipticCurveModularityImaginaryQuadratic §4.3 `characterLattice θ` at t over `F = M`.
- Reduction: `T^δ_θ/𝔪 = H¹(C^δ_{n,L̄}, 𝔽_ℓ) ⊗_{𝔽_ℓ[U′], θ̄} κ` with `θ̄ = j_ℓ∘θ mod 𝔪`, so it
  depends on θ only through θ̄; its semisimplification is the semisimplified reduction of
  `W_{θ,ℓ}`, independent of the stable lattice.

**Checks.**

- The coefficient ring cannot contain `j_ℓ(M₀)`: `1/ℓ ∈ M₀` has `v_ℓ(1/ℓ) = −1 < 0`. For ℓ = 3 and
  n = 3p, `E_λ = ℚ₃(μ_n)` contains `j_3(M₀)`, every value of θ is a root of unity of valuation zero,
  and `T^δ_θ` is free of rank two over its integers, while `1/3` is still not in O.
- At ℓ = 3 dividing n = 3p the group ring `ℤ₃[μ_{3p}]` is not semisimple modulo 3; freeness comes
  from the regular module and no division by 3 occurs. The projector `e_θ` of §1.3 has the
  coefficient `1/n`, which is not 3-integral, so it cannot define the lattice.
- Modulo 3 the cubic character reduces to 1, so `W_η ≡_3 W_1`, that is
  `H¹(A_t) ≡ H¹(B_t) ⊗ δ` modulo 3 over L. This agrees with the source's remark that `H¹(A_t)` is
  always congruent modulo 3 to a quadratic twist of E (LeHung26 lines 136–138), and is why three
  cannot be the seed prime.
- The evaluation argument proves congruences, not noncongruences. Modulo 3, `χ̄ = ψ̄` gives
  `W_χ ≡_3 W_ψ`; since `χ̄` has order p while `η̄ = 1`, the argument does not identify the
  evaluation at χ with that at η and gives no congruence `W_χ ≡_3 W_η`, but unequal residual labels
  do not exclude one. Positive control for an accidental congruence: take n = 15, t ∈ U(k),
  `J = Pic⁰(C_15(t))` and the finite extension `k′ = k(μ₁₅, J[3])`. Over k′, `M = L = k′`, δ is
  trivial, and `H¹(C_{15,k̄}, 𝔽₃) ≅ J[3] ⊗ μ₃^{⊗−1}` is a trivial `G_{k′}`-module; every reduction
  `T^δ_θ/𝔪`, a rank-two quotient of its extension of scalars to κ, is `κ²` with trivial action, so
  `W_χ ≡_3 W_η ≡_3 W_1` over k′ although `χ̄` has order five and `η̄ = 1`.
- Non-example, for δ nontrivial and θ ≠ 1 (so `θ ≠ θ⁻¹`, n being odd): an element `g ∈ G_L` with
  `δ(g) = −1` conjugates `u_ζ` to `u_{ζ⁻¹}`, so it carries the kernel of the θ-evaluation of the
  untwisted `H¹(C_{n,L̄}, ℤ_ℓ) ⊗ O` onto the kernel of the `θ⁻¹`-evaluation, and `G_L` does not act
  on the untwisted quotient; the twist is what makes the lattice `G_L`-stable. Positive control:
  for θ = 1 both labels are 1, and the untwisted coinvariant quotient is `G_L`-stable; when δ is
  trivial every untwisted evaluation is `G_L`-stable.

### 1.6 The two elliptic endpoints

Prove: if `3 | n`, so that order-three characters of `μ_n` exist and `C^δ_3` is a member of the
tower, then for every order-three η and every ℓ, `W_η ≅ H¹(A_t)|G_L`, where `A_t` is
EllipticCurveModularityImaginaryQuadratic §4.2 `auxiliaryEllipticCurve`, the elliptic curve
`Pic⁰(D_t)` over k; and, for every odd `n ≥ 3`, `W_1 ≅ H¹(B_t)|G_L ⊗ δ`. Since
`B_t: h(t)y² = h(x)` is the quadratic twist of E by `h(t)`, `H¹(E)|G_L ≅ W_1 ⊗ δ ⊗ χ_{h(t)}` with
`χ_{h(t)}` the character of `k(√h(t))/k`.
These isomorphisms are rational and compatible with the coefficient embeddings.

For the first, pull back along `C^δ_n → C^δ_3`, take `w′`-invariants of `H¹(C^δ_3)`, identify them
with `H¹(D_t ⊗ L)` by §1.2(4), and project `x + w′^*x ↦ x` onto the η-part, which is
`G_L`-equivariant. For the second, `W_1 = H¹(C^δ_n/U′) = H¹(B^δ_t)`, and the quadratic twist by δ
multiplies the Galois action by δ.

([LeHung26](#references), Lemma 3.2, (11) and proof, p.6, LeHung26 line 244 and lines 248–249;
[OpenAI26](#references), Proposition 5.2, p.13, OpenAI26 line 521.)

*Needs:* §§1.2–1.4; EllipticCurveModularityImaginaryQuadratic §4.2 `character_order_quotient`,
`trivial_character_twist`, `auxiliaryEllipticCurve`, `cubic_character_elliptic`; EllipticCurves
Layer 5; Tau Ceti `WeierstrassCurve.quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map`;
ArithmeticGaloisRepresentations §6.1.

**Checks.**

- `H¹(C^δ_3)^{w′}` has dimension two: `W_1` contributes nothing because `w′ = −1` there, and the
  four-dimensional `W_η ⊕ W_{η⁻¹}` contributes two.
- At a place v of L inert in `M/L`, `δ(Frob_v) = −1` and the traces of `W_1` and `H¹(B_t)` at
  `Frob_v` differ by sign. Omitting δ would make Layer 4 produce the twist of E by δ rather than E.
- Pullback along `C^δ_n → C^δ_d` followed by the norm is multiplication by the degree `n/d`, and
  along `C^δ_n → B^δ_t` by n: for n = 45 and d = 3 it is 15; for n = 3p it is p for d = 3 and 3 for
  d = p. These degrees are not ℓ-adic units for ℓ dividing them, so the comparisons are rational,
  and the congruences of §1.5 are applied only after semisimplification.
- `W_η ≅ W_{η⁻¹}` through `w′^*`, consistent with both being `H¹(A_t)|G_L`.

### Examples

For K = ℚ and p = 101, n = 303 and `L = ℚ(ζ₃₀₃)⁺` has degree `φ(303)/2 = 100`; M is the full
cyclotomic field. The four systems `W_η, W_χ, W_ψ, W_1` are totally odd over this totally real
field, while `V_η, V_χ, V_ψ, V_1` live only over M. The quotient exponents of the tower are as in
EllipticCurveModularityImaginaryQuadratic §1.3: `C_303 → C_3` by `Y ↦ Y^{101}` and `C_303 → C_101`
by `Y ↦ Y³`; they are twisted by the same cocycle.

### Dependencies

EllipticCurveModularityImaginaryQuadratic Layers 1–4 supply the covers, the integral marking and
the untwisted systems. ModularCurves §0E supplies descent of the twisted curves; JacobianChallenge
Layers D–F the Jacobians; EllipticCurves Layer 5 and Tau Ceti the quadratic twists;
EtaleCohomologyFoundations §0.11 the cup product; FaltingsFinitenessAndIsogenyTheorems R28.4,
AbelianSchemesAndArithmeticModuli A4.1 and A6.11 and NeronModelsAndSemistableAbelianVarieties §5.1
semisimplicity and compatibility; SmallRamificationAndAbelianVarietyBaseCases §5.0d and
AutomorphicGaloisRepresentationsPartII AG2.P the carrier and its predicate; Mathlib the field
statements.

## Layer 2: Totally real lifting and the elliptic seed

### 2.1 Change of coefficient prime

Let F be totally real and R a weakly compatible rank-two system over F on the shared carrier, with
coefficient field `M₀`, embeddings `j, j_ℓ` and semisimple members `R_ℓ`. Prove: if
`R_{ℓ₀} ≅ ρ_{π,ι₀}` for one prime `ℓ₀`, a coefficient isomorphism `ι₀` with `ι₀ ∘ j_{ℓ₀} = j` and a
cuspidal π of type `(2,0)`, then `R_ℓ ≅ ρ_{π,ι}` for every ℓ and every ι with `ι ∘ j_ℓ = j`.
In particular modularity of an elliptic curve over F does not depend on ℓ, and the systems `W_θ`
of §1.3 are modular at one prime exactly when they are modular at every prime, with fixed labels.

At almost every v, `j(P_v) = X² − t_vX + q_vs_v` by the hypothesis at `ℓ₀`; both `R_ℓ` and
`ρ_{π,ι}` then have this polynomial after ι, and recognition on a density-one set with
semisimplicity gives the isomorphism. Equivalently R is automorphic in the sense of
PotentialModularityAndCompatibleSystems §1.6.

([LeHung26](#references), §2.4, p.5, LeHung26 lines 221–224.)

*Needs:* §1.4 (for the application to `W_θ`); AutomorphicGaloisRepresentations §§3.10 and 3.14;
ArithmeticGaloisRepresentations §5.3 `GaloisRep.iso_of_frobenius_charpoly_eq`;
PotentialModularityAndCompatibleSystems §§1.1 and 1.6; SmallRamificationAndAbelianVarietyBaseCases
§5.0d.

**Checks.**

- Semisimplicity is needed: a nonsplit extension of `ε_ℓ⁻¹` by 1 and the sum `1 ⊕ ε_ℓ⁻¹` have the
  same Frobenius polynomials and are not isomorphic.
- For 11a1 the polynomial `X² + X + 3` at 3 is the same for every `ℓ ≠ 3`, matching
  `t₃ = −1, s₃ = 1`.
- Labels: for p ≥ 5, replacing ψ by `ψ²` at one prime changes the prescribed label to a Galois
  conjugate, so fixed-label compatibility no longer identifies the members; this does not rule
  out an accidental isomorphism. For p = 5 the character sums `ζ₅ + ζ₅⁻¹ = (√5 − 1)/2` and
  `ζ₅² + ζ₅⁻² = −(√5 + 1)/2` differ. Replacing ψ by `ψ⁻¹` is harmless because
  `W_ψ ≅ W_{ψ⁻¹}` over L (§1.3).

### 2.2 Weight-two lifting for summands of abelian varieties

Let L be totally real, ℓ an odd prime, A/L an abelian variety, and e an idempotent of
`End_L(A) ⊗_ℤ ℚ̄`, acting on `H¹(A_L̄, ℚ̄_ℓ)` through a fixed embedding `ℚ̄ → ℚ̄_ℓ`. Suppose
`r = e·H¹(A_L̄, ℚ̄_ℓ)` has dimension two, determinant `ε_ℓ⁻¹` and labelled Hodge–Tate weights
`{0,1}` at every embedding. Prove: if `r̄` is residually modular and `r̄|G_{L(ζ_ℓ)}` is absolutely
irreducible, and, when ℓ = 5, either the image of `r̄(G_{L(ζ₅)})` in `PGL₂(𝔽̄₅)` is not isomorphic
to `PSL₂(𝔽₅)` or `r̄` is the extension of scalars of a representation `G_L → GL₂(𝔽₅)` (whose
determinant is then `ε̄₅⁻¹`, as `det r = ε_ℓ⁻¹`), then r is modular. No condition at places above
ℓ is imposed. The case A = E elliptic and e = 1 is [FLHS15](#references), Theorem 2; there the
residual representation is the dual of `E[ℓ]`, an `𝔽_ℓ`-model, so at ℓ = 5 the second alternative
always holds. Le Hung's Proposition 3.1 excludes ℓ = 5 (LeHung26 line 231); the five-adic case here
is that of the supplier contract (gap:totally-real-weight-two-lifting), with FLHS15's
`𝔽₅`-model argument.

The representation r is continuous and `G_L`-stable because e commutes with `G_L`; it is
unramified outside the places of bad reduction and those above ℓ by Néron–Ogg–Shafarevich; it is
potentially semistable at every `v|ℓ` as a subrepresentation of `H¹` of an abelian variety, which
acquires semistable reduction after a finite extension. Apply the Breuil–Diamond theorem required
of GL2ModularityLifting.

([LeHung26](#references), Proposition 3.1, p.6, LeHung26 line 231; [FLHS15](#references),
Theorem 2, p.3, FLHS15 line 116, and §2, pp.5–6, FLHS15 lines 221–265; [BD14](#references),
Théorème 3.2.2, pp.36–37, BD14 line 2144.)

*Needs:* GL2ModularityLifting, Layer 5, the Breuil–Diamond weight-two lifting theorem required
above (gap:totally-real-weight-two-lifting); NeronModelsAndSemistableAbelianVarieties §§3.10,
5.1, 5.3 and 6.10; AbelianSchemesAndArithmeticModuli A6; AutomorphicGaloisRepresentations §3.10.

**Checks.**

- ℓ = 2 is excluded: the residual determinant is 1 at complex conjugations and cannot detect
  oddness, and the supplied theorem needs `p > 2`.
- A potentially multiplicative place above ℓ is allowed, together with ordinary and supersingular
  places; GL2ModularityLifting §5.7 would instead need a potentially Barsotti–Tate r, a matching
  ordinary witness and residue field `𝔽_ℓ` at nonordinary places.
- The five-adic `𝔽₅`-model alternative: for `r̄ = r̄₀ ⊗ 𝔽̄₅` with `det r̄₀ = ε̄₅⁻¹`, the square class
  of the projective image in `PGL₂(𝔽₅)` is that of `det r̄₀`, the character of `L(√5)/L`. If the
  projective kernel field `K₀` had `Gal(K₀/L) ≅ PSL₂(𝔽₅) ≅ A₅` with `ζ₅ ∈ K₀`, then `√5 ∈ L` and
  `Gal(L(ζ₅)/L)` of order two would be a quotient of `A₅`, simple of order 60.
- Negative control for the determinant without an `𝔽₅`-model: in `𝔽₂₅` let `a² = 3`,
  `B = [[0,2],[1,0]]` and `C = aB`. Then `B² = 2I`, `C² = 3·2I = I` and `det C = 3·(−2) = 4`, a
  square in `𝔽₅`, so C is an involution with eigenvalues `1, −1` and square determinant; yet its
  projective class is that of B, with `det B = −2 = 3` a nonsquare, so `[C] ∉ PSL₂(𝔽₅)`. The square
  class of `det r̄` alone does not control the projective image over a larger residue field, which
  is why the second alternative asks for an `𝔽₅`-model.
- At ℓ = 5 for an elliptic curve E, `r̄` is the dual of `E[5]`, defined over `𝔽₅` with determinant
  `ε̄₅⁻¹`: the second alternative holds and no projective-image hypothesis is needed.
- Non-example: a summand with determinant `ε_ℓ⁻¹ν` for a nontrivial finite-order ν is outside this
  statement, though inside the supplier's theorem; a weight-one Artin representation, with weights
  `{0,0}`, is outside both.

### 2.3 The 3–5 switch curve over a number field

Prove: for every number field K and every elliptic E/K there is an elliptic E′/K with a
`G_K`-equivariant isomorphism `E[5] ≅ E′[5]` compatible with the Weil pairings, such that the
image of `G_K` on `E′[3]` contains `SL₂(𝔽₃)` in any basis. The j-invariants of such E′ form an
infinite set.

This is `three_five_switch` in `Suggested.lean`. There E is a Weierstrass curve W over a number
field K with `WeierstrassCurve.IsElliptic`, `K̄` is `AlgebraicClosure K`, and the conclusion is
that the set of `j ∈ K` for which some elliptic Weierstrass curve W′ over K has `W′.j = j` and
satisfies the two conditions is infinite. The first condition is an additive isomorphism α from
the 5-torsion of the points of W over `K̄` to that of W′ which commutes, for every
`σ ∈ Gal(K̄/K)`, with the actions `WeierstrassCurve.torsionGaloisAction` of σ, and satisfies
`e₅(αP, αQ) = e₅(P, Q)` for the Weil pairings `TauCeti.Isogeny.weilPairing` of W′ and W; this is
the notion `SymplecticTorsionEquiv` of EllipticCurveModularityImaginaryQuadratic §0.2, written out
in the statement because a roadmap's Lean file imports only the pinned libraries. The second
condition says that for every basis b of the 3-torsion of W′ over `K̄` as a `ZMod 3`-module and
every `g ∈ SL₂(𝔽₃)` some σ acts on b-coordinates as the matrix g. Bases exist by
`WeierstrassCurve.nonempty_basis_torsionBy`, so this condition is not vacuous; since `SL₂(𝔽₃)` is
normal in `GL₂(𝔽₃)`, it holds for every basis once it holds for one.

Let Y be the fixed-pairing twisted curve of `E[5]` from EllipticCurveModularityImaginaryQuadratic
§0.2 `fixed_pairing_twist`: its K-points classify pairs `(C, α)` with α a symplectic isomorphism
`E[5] ≅ C[5]`. The pair `(E, id)` is a K-point, and the completion is `ℙ¹_K` by
`fixed_pairing_twist_rational`. Since 5 ≥ 3 the moduli problem is fine, so Y carries a universal
elliptic curve, and the frames of its 3-torsion form a finite étale `GL₂(𝔽₃)`-torsor P → Y. Over
`K̄`, the frames of a fixed pairing value form the fixed-pairing curve of level 15, which is
connected; so geometric monodromy acts transitively on them and equals `SL₂(𝔽₃)`. A connected
component `P₀` of P (all of P when `ζ₃ ∉ K`) is integral and finite étale over Y with group
`H ⊇ SL₂(𝔽₃)`. Hilbert irreducibility over K gives infinitely many `t ∈ Y(K)` whose fibre in `P₀`
is connected; for them `G_K` acts on `E_t[3]` through all of H. Take `E′ = E_t`, presented by a
Weierstrass equation over K. The j-map `Y → 𝔸¹_K` is finite, so each j-value has finitely many
preimages in `Y(K)` and infinitely many parameters t give infinitely many j-invariants.

([FLHS15](#references), Lemma 6.1 and its proof, p.10, FLHS15 line 421 and lines 430–452.)

*Needs:* EllipticCurveModularityImaginaryQuadratic §0.2 `fixed_pairing_twist` and
`fixed_pairing_twist_rational`; ModularCurves Layers 3 and 5B (level structures and the
Chinese-remainder splitting of full level 15); ModularCurvesPartII §4.10
`fixedPairingGeometricConnectedness`; InverseGaloisAndArithmeticFundamentalGroups IG.2.4, IG.2.6
and IG.2.7; ArithmeticGaloisRepresentations §6.2; for the statement, Mathlib
`WeierstrassCurve.IsElliptic`, `WeierstrassCurve.j`, `AlgebraicClosure`, `Module.Basis` and
`Matrix.SpecialLinearGroup`, and Tau Ceti `WeierstrassCurve.torsionGaloisAction`,
`TauCeti.Isogeny.weilPairing`, `TauCeti.Isogeny.pointTorsionModule` (the `ZMod N`-module structure
on N-torsion), `WeierstrassCurve.weilPairing_torsionGaloisAction` and
`WeierstrassCurve.nonempty_basis_torsionBy`.

**Checks.**

- `|SL₂(𝔽₃)| = 24` divides neither the order 12 of a Borel subgroup of `GL₂(𝔽₃)` nor the orders 8
  and 16 of the normalizers of split and nonsplit Cartan subgroups: E′ has irreducible mod-3
  representation and is not CM.
- Over a field containing `ζ₃`, such as `ℚ(√−3)`, the determinant is trivial and the image is at
  most `SL₂(𝔽₃)`; asking for `GL₂(𝔽₃)` would be false.
- The cover P of all frames of the 3-torsion has `φ(3) = 2` geometric components, one for each
  value of the Weil pairing, so it is not geometrically integral; whether it is integral over K
  depends on K. If `ζ₃ ∉ K`, as for K = ℚ, the arithmetic monodromy `GL₂(𝔽₃)`, of order 48, exchanges
  the two components, each of degree 24 over Y, and P is integral, so `P₀ = P`. If `ζ₃ ∈ K`, as for
  `K = ℚ(√−3)`, the determinant is trivial and P has two K-components of degree 24. The proof uses an
  integral component `P₀` in both cases; Hilbert irreducibility asks for integrality over K, not
  geometric integrality.
- Genus zero alone does not give a rational point; here `(E, id)` is one, so the completion is a
  projective line rather than an anisotropic conic.
- The Weil-pairing condition is not implied by Galois equivariance: multiplication by 2 on `E[5]`
  commutes with every σ, but `e₅(2P, 2Q) = e₅(P, Q)⁴`, which differs from `e₅(P, Q)` whenever the
  latter is a nontrivial fifth root of unity. The identity of `E[5]` satisfies both conditions,
  so the curve W itself is a witness for the first one; its own 3-torsion image decides the
  second.

### 2.4 The mod-three seed over a totally real field

Prove: let K be totally real and E/K elliptic. If `E[3]` is absolutely irreducible as a
representation of `G_{K(ζ₃)}`, then E is modular.

The residual representation `r̄` of `H¹(E)` modulo 3 is the dual of `E[3]`. It is absolutely
irreducible, totally odd because its determinant `ε̄₃⁻¹` is `−1 ≠ 1` at complex conjugations,
and has image in the solvable group `GL₂(𝔽₃)`. The solvable residual modularity required of
GL2AutomorphicRepresentationsAndTransfer makes it residually modular, and §2.2 with A = E, e = 1
and ℓ = 3 proves E modular.

([FLHS15](#references), Theorem 6 and Corollary 5.1, p.9, FLHS15 line 404 and line 411.)

*Needs:* §2.2; GL2AutomorphicRepresentationsAndTransfer R17.5.14 and the solvable residual
modularity in cohomological weight required above
(gap:totally-real-solvable-residual-cohomological-weight); ArithmeticGaloisRepresentations §§4.1 and
6.1–6.2.

**Checks.**

- Since the determinant is cyclotomic, the image of `G_{K(ζ₃)}` is the image of `G_K` intersected
  with `SL₂(𝔽₃)` ([FLHS15](#references), Proposition 4.1, p.8, FLHS15 line 343).
- If `E[3]` is irreducible over K but reducible over `K(ζ₃)`, the image lies in a Cartan
  normalizer (FLHS15 Lemma 4.2, FLHS15 line 355) and this statement does not apply.
- `GL₂(𝔽₃)` is solvable: `GL₂(𝔽₃) ⊃ SL₂(𝔽₃) ⊃ Q₈ ⊃ {±1} ⊃ 1`, of orders 48, 24, 8, 2, 1, with
  abelian quotients.

### 2.5 The mod-five seed over a totally real field

Prove: let K be totally real and E/K elliptic. If `E[5]` is absolutely irreducible as a
representation of `G_{K(ζ₅)}`, then E is modular.

Take E′ from §2.3. Its mod-three image on `G_{K(ζ₃)}` is the image on `G_K` intersected with
`SL₂(𝔽₃)`, which is `SL₂(𝔽₃)`; this group acts absolutely irreducibly, since the stabilizer in it
of a line over `𝔽̄₃` has order 6 for an `𝔽₃`-rational line and order dividing 4 otherwise, both
less than 24. By §2.4 E′ is modular, at every prime by §2.1, in particular at
five; the residual representation of `H¹(E)` modulo 5 is that of `H¹(E′)`, hence residually
modular. Apply §2.2 with A = E, e = 1 and ℓ = 5, through its `𝔽₅`-model alternative: the residual
representation is the dual of `E[5]`, defined over `𝔽₅` with determinant `ε̄₅⁻¹`.

([FLHS15](#references), Theorem 3, p.3, FLHS15 line 127, and its proof for p = 5, p.10, FLHS15
lines 426–429.)

*Needs:* §§2.1–2.4.

**Checks.**

- 11a1 has a rational point of order five, so its mod-five representation is reducible and this
  statement says nothing about it; the theorem has no hypothesis at three.
- The seed is applied at five exactly once in this roadmap, in §3.2; the lifts of Layer 3 are at 3
  and `p > 100`.
- Over a totally real K, `ζ₅ ∉ K`, and the residual representation is the dual of `E[5]`, an
  `𝔽₅`-model with determinant `ε̄₅⁻¹`; the `𝔽₅`-model alternative of §2.2 therefore replaces any
  projective-image hypothesis at five. The generic case shows it is needed: if `E[5]` has image
  `GL₂(𝔽₅)`, the image of `G_{K(ζ₅)}` is `SL₂(𝔽₅)`, whose projective image is `PSL₂(𝔽₅)`, so the
  first alternative fails.

### Examples

Over a real quadratic field the three statements of §§2.3–2.5 are [FLHS15](#references), Lemma 6.1,
Corollary 5.1 and Theorem 3. Over ℚ, §2.5 with §2.3 is Wiles' 3–5 switch. The lifting statement
§2.2 is applied below to `A = J^δ_n` with `e = e_θ`, a summand that is not an elliptic curve.

### Dependencies

Layer 1 for the application of §2.1 to `W_θ`. GL2ModularityLifting supplies the lifting theorem
required of it (gap:totally-real-weight-two-lifting); GL2AutomorphicRepresentationsAndTransfer
R17.5.14 and the section required of it (gap:totally-real-solvable-residual-cohomological-weight)
supply solvable residual modularity. EllipticCurveModularityImaginaryQuadratic §0.2, ModularCurves
Layers 3 and 5B, ModularCurvesPartII §4.10 and InverseGaloisAndArithmeticFundamentalGroups IG.2
supply the switch curve. AutomorphicGaloisRepresentations §§3.10 and 3.14, ArithmeticGaloisRepresentations
§5.3 and PotentialModularityAndCompatibleSystems §§1.1 and 1.6 supply the change of prime.

## Layer 3: One specialization and three lifts over L

### 3.1 One parameter with every residual condition

Let K be totally real of degree d and E/K geometrically non-CM. Let `p > max{100, 2d+1}` be a
prime outside the finite exceptional set of EllipticCurveModularityImaginaryQuadratic §5.1 for E
over the normal closure of K, put n = 3p, and let `(M, L, δ)` be the data of §1.1 for `(K, n)`.
Prove that there is `t ∈ U(K)` such that, for the systems of §1.3 at t:

1. for every order-three η, `W̄_{η,p}` is absolutely irreducible on `G_{L(ζ_p)}`;
2. for every order-p ψ, `W̄_{ψ,3}` is absolutely irreducible on `G_{L(ζ₃)}`;
3. `W̄_{1,p}` is absolutely irreducible on `G_{L(ζ_p)}`;
4. the mod-five representation of `A_t` is absolutely irreducible on `G_{L(ζ₅)}`;
5. `A_t` is geometrically non-CM.

Apply EllipticCurveModularityImaginaryQuadratic §7.4 `simultaneous_specialization` with k = K,
S the places above 3p and `Ω_v = U(K_v)`, nonempty because U is a nonempty Zariski open of the
affine line. It gives these statements for `V_θ` on `G_{M(ζ_ℓ)}`, with M = `K(μ_{3p})`. Restriction
to `G_M` identifies `W_θ` with `V_θ` (§1.3); `L(ζ_ℓ) = M` for ℓ ∈ {3, p} (§1.1); and
`G_{M(ζ₅)} ⊆ G_{L(ζ₅)}`, while absolute irreducibility on a subgroup implies it on the group.

([LeHung26](#references), §3.3, p.6, LeHung26 lines 250–260; [OpenAI26](#references),
Proposition 8.4, p.23, OpenAI26 line 990.)

*Needs:* §§1.1, 1.3 and 1.6; EllipticCurveModularityImaginaryQuadratic §5.1
`nonCM_elliptic_large_residual_primes`, §7.1 `character_geometric_irreducibility` and §7.4
`simultaneous_specialization`.

**Checks.**

- The coefficient `c(λ) = 2 − λ − λ⁻¹ = −(λ − 1)²/λ` of EllipticCurveModularityImaginaryQuadratic
  §7.1 is 3 at a primitive cube root λ, nonzero modulo 5 for the pair `(3,5)` and modulo `p ≠ 3`
  for `(3,p)`. For `(p,3)` it vanishes modulo 3 only if the reduction of λ is 1, impossible for λ
  of order `p ≠ 3`: for p = 101 the reduction has order 101 in `𝔽_{3^{100}}^×`, and for p = 7,
  below the bound, it has order 7 in `𝔽_{3^6}^×`, so c is nonzero in both. The bound `p > 100`, a
  hypothesis of §7.4 there, serves its regular word (`c² ≠ ±4`, which would put λ in `𝔽_{3^a}`
  with `a ≤ 4`, whose unit groups have order at most 80) and through it decomposed genericity,
  which the totally real lifting of §2.2 does not use; the nonvanishing of c needs only `p ≠ 3`.
- `p > 100` excludes 3 and 5, so the three primes 3, 5 and p are distinct.
- Item 3 needs no condition on t: `E[p]` has image containing `SL₂(𝔽_p)` on the normal closure,
  `SL₂(𝔽_p)` is perfect for `p > 3`, and the abelian extension `K(μ_{15p})/K` preserves it; the
  quadratic twists by `h(t)` and δ change both eigenvalues by the same sign.
- Without the normal-closure choice of p, an image hypothesis over K alone does not give the joint
  conditions used by §7.4 for the d conjugate factors.

### 3.2 The auxiliary seed over L

Prove: at the parameter of §3.1, `A_t ⊗_K L` is modular, and `W_{η,ℓ}` is modular for every
order-three η and every ℓ.

By §3.1(4) and §2.5 over L, `A_t ⊗ L` is modular; §2.1 makes `H¹(A_t)|G_L` modular at every prime,
and §1.6 identifies it with `W_η`.

([LeHung26](#references), §3.4, p.7, LeHung26 line 264; [FLHS15](#references), Theorem 3, p.3,
FLHS15 line 127.)

*Needs:* §§1.6, 2.1, 2.5 and 3.1.

**Checks.**

- The seed is applied directly over L, which avoids a separate automorphic base change from K to
  L. The residual condition also holds over K: `G_{L(ζ₅)} ⊆ G_{K(ζ₅)}`, and a line invariant under
  the larger group would be invariant under the smaller one, so absolute irreducibility of
  `A_t[5]` on `G_{L(ζ₅)}` implies it on `G_{K(ζ₅)}`.
- Five plays no role in the chain: the congruences of §1.5 are at 3 and p.
- `W_η` and `W_{η⁻¹}` are both `H¹(A_t)|G_L`, so the two cubic characters give the same seed.

### 3.3 The three lifts

Prove: at the parameter of §3.1, `W_χ`, `W_ψ` and `W_1` are modular over L for every order-three η
and order-p ψ, with `χ = ηψ`. Apply §2.2 to `A = J^δ_n` and `e = e_θ` (§1.3), with the
determinant and weights of §1.4, changing the coefficient prime by §2.1 after each row:

| Source, modular | Prime | Target | Residual modularity | Cyclotomic irreducibility |
|---|---|---|---|---|
| `W_η` (§3.2) | p | `W_χ` | `W̄_χ ≅ W̄_η` by §1.5 | §3.1(1) |
| `W_χ` | 3 | `W_ψ` | `W̄_ψ ≅ W̄_χ` by §1.5 | §3.1(2) |
| `W_ψ` | p | `W_1` | `W̄_1 ≅ W̄_ψ` by §1.5 | §3.1(3) |

Each target's residual representation is absolutely irreducible, so its semisimplification is
itself and is the residual representation of the source's automorphic realization at a prime above
the row's prime.

([LeHung26](#references), §3.4 and its table, p.7, LeHung26 lines 264–269.)

*Needs:* §§1.3–1.5, 2.1, 2.2, 3.1 and 3.2.

**Checks.**

- The middle lift is at 3, not at the seed prime 5; omitting the change of prime after the first row
  would leave no modular realization at 3.
- No local condition at places above 3 or p is checked: supersingular, ordinary and multiplicative
  places above the lifting prime may occur in any combination.
- The prime 5 does not occur among the lifting primes, so the five-adic alternatives of §2.2 are
  not used here.

### Examples

For K a totally real quartic field containing `√5`, such as `ℚ(ζ₁₅)⁺`, nothing changes: the lifts
are at 3 and p, and the five-adic seed is over L through the `𝔽₅`-model alternative of §2.2,
applied to the dual of `A_t[5]`.

### Dependencies

Layers 1 and 2; EllipticCurveModularityImaginaryQuadratic §§5.1, 7.1 and 7.4 for the parameter.

## Layer 4: Descent, all places, CM curves and the endpoint

### 4.1 Descent to the original curve

Prove: for K totally real and E/K geometrically non-CM, E is modular.

Choose p and t by §3.1. By §3.3 `W_1` is modular over L; twisting by the finite-order character δ
(AutomorphicGaloisRepresentations §3.10 twist formula) makes `H¹(B_t)|G_L` modular. Its residual
representation is absolutely irreducible on `G_M ⊆ G_L` by §3.1(3), so `H¹(B_t)|G_L` is
irreducible. `L/K` is abelian, hence Galois with soluble group, and both fields are totally real;
PotentialAutomorphyInfrastructure §2.3(2) descends to a cuspidal regular algebraic `π_K` over K of
weight zero with `H¹(B_t) ≅ r_ι(π_K)`, which is `ρ_{π_K,ι}` for type `(2,0)` by the AG2.P member
identification and the weight conversion R16.6.3–R16.6.4. Finally `H¹(E) ≅ H¹(B_t) ⊗ χ_{h(t)}`
(§1.6), so `π_K ⊗ (χ_{h(t)} ∘ det)` realizes `H¹(E)`.

([LeHung26](#references), §3.4, p.7, LeHung26 lines 270–271, and Lemma 5.1, p.9, LeHung26
lines 357–360.)

*Needs:* §§1.6, 3.1 and 3.3; PotentialAutomorphyInfrastructure §2.3
`soluble_base_change_and_descent`; AutomorphicGaloisRepresentationsPartII AG2.0 `IsAttached` and
AG2.P; AutomorphicGaloisRepresentations §3.10; GL2AutomorphicRepresentationsAndTransfer
R16.6.3–R16.6.4.

**Checks.**

- Descent needs irreducibility of the restriction, and it is irreducibility that controls the
  descents. If `ρ|G_L` is irreducible and `ρ′|G_L ≅ ρ|G_L`, then `Hom_{G_L}(ρ, ρ′)` is a line on
  which `G_K` acts through a character ψ of `Gal(L/K)`, and `ρ′ ≅ ρ ⊗ ψ`; the `[L:K]` twists are
  pairwise non-isomorphic, because `G_K` fixes the scalars `End_{G_L}(ρ)`. A reducible
  restriction lies outside the supplied theorem, and its descents are not counted by reducibility.
  Let F be the splitting field of `x³ − 4x + 1` over ℚ (no rational root, discriminant 229, so
  `Gal(F/ℚ) ≅ S₃` and F is totally real) and `L₀ = ℚ(√229)`, with sign character `sgn` of
  `Gal(L₀/ℚ)`. The induction to `G_ℚ` of a nontrivial character χ of `Gal(F/L₀) ≅ C₃` restricts
  to `χ ⊕ χ⁻¹` and is its only descent: a descent is trivial on `G_F`, the two characters of S₃
  restrict trivially to C₃, and the standard representation is isomorphic to its twist by `sgn`.
  In contrast `1 ⊕ 1` over `L₀` has the three descents `1 ⊕ 1`, `1 ⊕ sgn` and `sgn ⊕ sgn`, and
  `1 ⊕ sgn` is not a twist of `1 ⊕ 1`.
- At a quadratic step the two descents differ by the quadratic character; PotentialAutomorphyInfrastructure
  §2.3 selects the one matching `H¹(B_t)` itself, not merely its restriction.
- Twisting twice by `χ_{h(t)}` is the identity since `h(t) ≠ 0`; when `h(t)` is a square in K the
  character is trivial and `B_t ≅ E`.

### 4.2 All coefficient primes and all finite places

Let K be totally real, E/K elliptic and π a cuspidal representation of `GL₂(𝔸_K)` of type `(2,0)`
with `ρ_{π,ι₀} ≅ H¹(E)` for one `(ℓ₀, ι₀)`. Prove:

1. π has trivial central character and is unique up to isomorphism.
2. For every ℓ and every ι, `ρ_{π,ι} ≅ H¹(E_K̄, ℚ̄_ℓ)`.
3. For every finite `v∤ℓ`, `ι WD(H¹(E)|G_{K_v})^{F-ss} ≅ rec(π_v ⊗ |det|_v^{−1/2})`, monodromy
   included.
4. For every `v|ℓ`, `H¹(E)|G_{K_v}` is potentially semistable and its potentially semistable
   Weil–Deligne representation satisfies the same identity.
5. Every finite Euler factor agrees: `L_v(E,s) = L(s−1/2, π_v)` at good, multiplicative and
   additive places, and `L(E/K,s) = L(π, s−1/2)`; at each real place `π_τ` is the discrete series
   `D_{2,0}` and the archimedean factors agree, `Γ_ℂ(s)` on both sides.
6. The conductor exponent of `π_v` is the Artin conductor exponent of `WD(H¹(E)|G_{K_v})`, so the
   newvector of π has exact level the conductor `𝔫_E`.
7. At good v, `t_v = a_v(E) = q_v + 1 − #Ẽ(k_v) ∈ ℤ` and `s_v = 1`; the Hilbert newform has
   rational Hecke eigenvalues and π has field of rationality ℚ.
8. At a place of multiplicative reduction, monodromy is nonzero and `π_v` is the Steinberg
   representation twisted by an unramified character of order at most two, trivial exactly in the
   split case; at a place of additive potentially multiplicative reduction `π_v` is a ramified
   quadratic twist of Steinberg; at every additive place the local factor is 1.

The determinant `χ_{π,ι}ε_ℓ⁻¹ = ε_ℓ⁻¹` forces `χ_{π,ι} = 1`. Item 2 is §2.1 for the system of E,
with integer polynomials `X² − a_vX + q_v`. Items 3 and 4 are AutomorphicGaloisRepresentations
§§4.4 and 4.7 transported along item 2. Items 5–8 read off local Langlands, conductors and
newvectors.

([LeHung26](#references), §5, p.9, LeHung26 lines 361–363; [FLHS15](#references), §1, p.2,
FLHS15 lines 66–77.)

*Needs:* §2.1; AutomorphicGaloisRepresentations §§3.10, 3.14, 4.4 and 4.7;
AutomorphicGaloisRepresentationsPartII AG2.0; GL2AutomorphicRepresentationsAndTransfer R16.2,
R16.3.2, R16.3.5, R16.3.6 and R16.4.4; ArithmeticGaloisRepresentations Layers 2–3 and §6.2;
NeronModelsAndSemistableAbelianVarieties §§5.6 and 6.10; EllipticCurves Layers 4 and 4.5a and
Mathlib `WeierstrassCurve.HasGoodReduction`, `WeierstrassCurve.HasMultiplicativeReduction`,
`WeierstrassCurve.HasSplitMultiplicativeReduction` and `WeierstrassCurve.HasAdditiveReduction`
(reduction types and the Tate curve, for items 5, 7 and 8).

**Checks.**

- 11a1 at 11: `a₁₁ = 1`, split multiplicative, `π₁₁` is the Steinberg representation with
  conductor exponent 1 and Euler factor `(1 − 11^{−s})⁻¹`; comparing only semisimplified Weil
  representations would lose N.
- `y² = x³ − x + 1` has discriminant `−368 = −2⁴·23` and `c₄ = 48`, a unit at 23, so it is
  multiplicative at 23 with nonzero N. Over `ℚ(√5)` the prime 23 is inert, since 5 is not a
  square modulo 23, and the reduction at the place of norm 529 is split.
- `y² = x³ − x` has conductor 32 and additive potentially good reduction at 2: local factor 1,
  conductor exponent 5. A good place has a degree-two factor, a multiplicative place degree one.
- The archimedean witness: `D_2` in unitary normalization has factor `Γ_ℂ(s + 1/2)`, and the shift
  `s ↦ s − 1/2` gives `Γ_ℂ(s)`, the Hodge factor of `H¹` with `h^{1,0} = h^{0,1} = 1`.

### 4.3 CM curves over a totally real field

Let K be totally real and E/K geometrically CM, with CM field `T ⊂ K̄` embedded through the action
of the endomorphisms on invariant differentials. Prove that `T ⊄ K` and that
`H¹(E)|G_{KT} = ξ_ι ⊕ ξ^c_ι` for an algebraic Hecke character ξ of KT with `ξ_ι = r_{ℓ,ι}(ξ)` and
`ξ_ι ≠ ξ^c_ι`. Then `H¹(E) ≅ Ind_{G_{KT}}^{G_K} ξ_ι`. Write `ξ(w) = ξ_w(ϖ_w)` at a good place w
of KT, the eigenvalue of geometric Frobenius on `ξ_ι`, and let `ξ^u = ξ·‖·‖_{KT}^{1/2}` be the
unitary Hecke character attached to ξ: since `‖ϖ_w‖ = q_w⁻¹`, `ξ^u(ϖ_w) = ξ(w)q_w^{−1/2}`. Prove
that the quadratic automorphic induction `π_E = AI_{KT/K}(ξ^u) = AI_{KT/K}(ξ) ⊗ ‖det‖_K^{1/2}` is
cuspidal of type `(2,0)` with trivial central character and `ρ_{π_E,ι} ≅ H¹(E)`. In particular
§4.2 applies.

T is imaginary quadratic and K has only real embeddings, so `T ⊄ K` and `[KT:K] = 2`. By the field
of definition required of ComplexMultiplicationAndExplicitReciprocity
(gap:cm-elliptic-endomorphism-field), every geometric endomorphism of E is defined over KT, and an
element of `G_K` outside `G_{KT}` acts on `End(E_K̄)` through the nontrivial automorphism of T.
So `T ⊗ ℚ̄_ℓ` acts `G_{KT}`-equivariantly on `H¹`, its two eigenspaces are `G_{KT}`-stable, and
an element of `G_K` outside `G_{KT}` exchanges them. Over KT every endomorphism of E is defined, so
ComplexMultiplicationAndExplicitReciprocity §4.1, "The algebraic Hecke character of a CM abelian
variety" and "One-dimensional CM components of the Tate module", applied to `E ⊗_K KT` with
`g = 1` and CM field T, supplies the algebraic Hecke character ξ of KT and splits
`V_ℓ(E) ⊗ ℚ̄_ℓ` over `G_{KT}` into the two rank-one realizations of ξ, which in the
geometric-Frobenius normalization of AutomorphicGaloisRepresentationsPartII AG2.0 are
`r_{ℓ,ι}(ξ⁻¹)` and its conjugate; their duals are the two eigenspaces of `H¹(E) = V_ℓ(E)^∨`,
written `ξ_ι = r_{ℓ,ι}(ξ)` and `ξ^c_ι`. Geometric Frobenius at a good place w of KT acts on them by
the two conjugates of `ξ(w) ∈ T`, the arithmetic Frobenius values of that section. An implementer
may instead observe that the eigenspaces are finitely ramified de Rham characters and apply
AutomorphicGaloisRepresentations §3.13. At each embedding of KT the two characters have different
Hodge–Tate weights, 0 and 1, so `ξ_ι ≠ ξ^c_ι`, hence `ξ^u ≠ (ξ^u)^c`, and the induction is
cuspidal (GL2AutomorphicRepresentationsAndTransfer R17.4.16). The same weights make ξ of weight
one in the sense of AG2.0, `|ξ| = ‖·‖_{KT}^{−1/2}`, so `ξ^u` is unitary. By R17.4.16 the local
parameter of `π_{E,v}` is `Ind ξ^u_w`, the sum over the two places above a split v. Since
`|·|_v ∘ N_{KT_w/K_v} = |·|_w`, `rec(π_{E,v} ⊗ |det|_v^{−1/2}) = Ind(ξ^u_w·|·|_w^{−1/2}) = Ind ξ_w`,
which through the reciprocity map of AG2.0 (uniformizers to geometric Frobenius) is the
restriction of `Ind ξ_ι` to the decomposition group at v. So the good polynomials of `π_E` and of
`Ind ξ_ι` agree, and recognition identifies the representations. At a real place of K the
archimedean component of `ξ^u` is `z ↦ (z/|z|)^{±1}`, whose induction to `W_ℝ` is the parameter of
`D_{2,0}` (R16.2.13); that of ξ, `z ↦ z^{−1}` or `z̄^{−1}`, would give `D_{2,0} ⊗ |det|^{−1/2}`.
By R17.4.16 the central character is `η_{KT/K}·ξ^u|_{𝔸_K^×}`, with `η_{KT/K}` the quadratic
character of K attached to KT. The determinant of an induced character is `η_{KT/K}` times its
composite with the transfer, which corresponds to restriction to `𝔸_K^×`; so
`det Ind ξ_ι = ε_ℓ⁻¹ = r_{ℓ,ι}(‖·‖_K⁻¹)` gives `ξ|_{𝔸_K^×} = η_{KT/K}‖·‖_K⁻¹`, and
`‖·‖_{KT}^{1/2}` restricts to `‖·‖_K` on `𝔸_K^×`. The central character is therefore
`η_{KT/K}² = 1`.

([LeHung26](#references), §5, p.9, LeHung26 lines 364–366; [OpenAI26](#references), §9.4,
pp.27–28, OpenAI26 lines 1200–1215.)

*Needs:* ComplexMultiplicationAndExplicitReciprocity Layer 1, the field of definition of CM
endomorphisms required above (gap:cm-elliptic-endomorphism-field);
ComplexMultiplicationAndExplicitReciprocity §4.1 (the Hecke character over KT and the Tate-module
components); ShimuraVarieties §5.3; EllipticCurves Layer 0.5 (the action of `G_K` on
`End(E_K̄)`); AbelianSchemesAndArithmeticModuli A6; AutomorphicGaloisRepresentations §§3.10 and 3.13;
AutomorphicGaloisRepresentationsPartII AG2.0;
GL2AutomorphicRepresentationsAndTransfer R16.2.13 and R17.4.16; ArithmeticGaloisRepresentations
§5.3; §4.2.

**Checks.**

- `y² = x³ − x` over ℚ has CM by `ℚ(i)`. At 3, inert, there are 4 points over `𝔽₃` and `a₃ = 0`,
  the trace of an induced representation at an inert Frobenius. At 5, split, there are 8 points,
  `a₅ = −2 = ξ(𝔭) + ξ(𝔭̄)` with `ξ(𝔭) = −1 ± 2i` of norm 5.
- The half twist in `π_E`, on the same curve with `KT = ℚ(i)` and η the character of `ℚ(i)`. At
  the split prime 5, `AI(ξ)` would have Satake parameters `−1 ± 2i`, of product 5, so central
  character `‖·‖⁻¹` there, and `rec(π₅ ⊗ |det|^{−1/2})` would have Frobenius trace
  `√5·(−2) = −2√5 ≠ a₅`; `AI(ξ^u)` has parameters `(−1 ± 2i)/√5`, of product 1, and shifted trace
  `−2 = a₅`. At the inert prime 3 the residue field is `𝔽₉` and `Frob₃` has eigenvalues `±√−3` on
  `H¹(E)`, so `Frob₃²` acts on each line by −3 and `ξ(3𝒪) = −3`; this equals
  `η(3)·‖3‖₃⁻¹ = (−1)·3`, as `ξ|_{𝔸_ℚ^×} = η‖·‖⁻¹` requires. At the place w above 3 of KT,
  `KT_w/ℚ₃` is unramified quadratic, so `‖3‖_{KT_w}^{1/2} = 9^{−1/2} = 1/3`; the
  central character of `AI(ξ^u)` at 3 is `η(3)·ξ(3𝒪)/3 = (−1)(−3)/3 = 1`.
- `y² = x³ + 1` has CM by `ℚ(√−3)`; at 5, inert, there are 6 points and `a₅ = 0`.
- Over `K = ℚ(√2)` the curve `y² = x³ − x` uses induction from `ℚ(√2, i) = ℚ(ζ₈)`; over a totally
  real base the isobaric-sum branch never occurs. Over `ℚ(i)`, outside this roadmap, the same curve
  gives an isobaric sum.
- Field of definition, as supplied: on `y² = x³ − x` the endomorphism `[i](x,y) = (−x, iy)` pulls
  `ω = dx/(2y)` back to `d(−x)/(2iy) = i·ω`, so `[[i]] = i`. Complex conjugation c sends `[i]` to
  `(x,y) ↦ (−x, −iy)`, which is `[−i]`, matching `c(i) = −i`; so `[i]` is defined over `ℚ(i)` and not
  over ℚ, and the kernel of the action of `G_ℚ` on the endomorphisms is `G_{ℚ(i)}`; over `ℚ(√2)` it
  is `G_{ℚ(ζ₈)}`. This excludes the model in which every CM endomorphism is already K-rational,
  which fails over every totally real K since `T ⊄ K`.
- Degenerate case of the field statement: when `T ⊆ K′` every geometric endomorphism is
  `K′`-rational; over `ℚ(i)` all of `ℤ[i]` acts by `ℚ(i)`-rational endomorphisms of `y² = x³ − x`,
  the kernel is all of `G_{ℚ(i)}`, and that base gives the isobaric sum.
- The characteristic-zero hypothesis of the supplied statement is needed. The invariant
  differential of a Weierstrass model is `dx/(2y + a₁x + a₃)`. Over `𝔽₂` the curve `y² + y = x³`
  has `a₃ = 1` and discriminant `−27 ≡ 1`, so it is smooth with `ω = dx`; its Frobenius
  endomorphism `(x,y) ↦ (x², y²)`, of degree two, pulls ω back to `d(x²) = 2x dx = 0`. Over `𝔽₃`
  the curve `y² = x³ − x` has discriminant `64 ≡ 1` and `ω = dx/(2y)`, with `2y ≠ 0` in its function
  field; Frobenius pulls ω back to `d(x³)/(2y³) = 0`. So `[·]` is not injective in characteristic p.
  The short-model formula `dx/(2y)` has no meaning in characteristic two, where `2y = 0`.

### 4.4 The endpoint

Prove: for every totally real number field K and every elliptic curve E/K there is a cuspidal
automorphic representation `π_E` of `GL₂(𝔸_K)` of type `(2,0)`, with trivial central character
and unique up to isomorphism, such that `ρ_{π_E,ι} ≅ H¹_ét(E_K̄, ℚ̄_ℓ)` for every ℓ and every ι,
and all the local statements of §4.2 hold. In particular `L(E/K,s) = L(π_E, s−1/2)`, and the
Hilbert newform of `π_E` has rational Hecke eigenvalues and exact level `𝔫_E`. If E is
geometrically CM, `π_E` is the cuspidal induction of §4.3.

For non-CM E use §4.1, for CM E use §4.3, and then §4.2.

([LeHung26](#references), Theorem 1.1, p.2, LeHung26 line 86, with the geometric inputs proved by
EllipticCurveModularityImaginaryQuadratic Layers 1–4 and §7.4.)

*Needs:* §§4.1–4.3.

**Checks.**

- K = ℚ recovers [BCDT01](#references), Theorem A (BCDT01 line 15), and the endpoint of
  EllipticCurveModularity; the route here uses neither.
- Every real quadratic field ([FLHS15](#references), Theorem 1, FLHS15 line 87), every totally real
  cubic and quartic field, including quartic fields containing `√5`, and fields of every degree are
  covered without exclusions.
- A curve over `ℚ(√29)` with good reduction everywhere has `𝔫_E = (1)` and a level-one parallel
  weight-two Hilbert newform; this is the shape required by HilbertModularForms §11.3.

### Examples

For `E: y² = x³ − x + 1` over `K = ℚ(√5)`: j = `−6912/23` is not integral, so E is not CM, and the
route of §4.1 applies with any admissible p and t; the place above 23 is split multiplicative with
Steinberg `π_v`. For `y² = x³ − x` over the same K the route is §4.3.

### Dependencies

Layers 1–3; PotentialAutomorphyInfrastructure §2.3; AutomorphicGaloisRepresentations §§3.10–3.14,
4.4 and 4.7; AutomorphicGaloisRepresentationsPartII AG2.0 and AG2.P;
GL2AutomorphicRepresentationsAndTransfer R16.2–R16.6 and R17.4.16; ShimuraVarieties §5.3;
ComplexMultiplicationAndExplicitReciprocity Layer 1 for the field of definition of CM endomorphisms
(gap:cm-elliptic-endomorphism-field) and §4.1 for the Hecke character of a CM elliptic curve over
KT; AbelianSchemesAndArithmeticModuli A6;
NeronModelsAndSemistableAbelianVarieties §§5.6 and 6.10; EllipticCurves Layer 0.5 for the Galois
action on endomorphisms and Layers 4 and 4.5a for the reduction types.

## Downstream consumers

- HilbertModularForms §11.3, the elliptic-curve interface, asks for a parallel-weight-two newform
  of exact level `𝔫_E`, trivial central character, rational coefficients and equality of every
  local factor, and names the real quadratic case as its existence input. Section 4.4 supplies this
  for every totally real field.
- ModularityAndLanglandsExtensions and its Part II consume elliptic modularity in their
  compatible-system, L-function and symmetric-power applications; §4.4 removes degree
  restrictions on the base field there.
- EllipticCurveModularityImaginaryQuadraticPartII treats CM bases with the same parent; the two
  roadmaps together cover every totally real and every CM field.
- The descended systems of Layer 1 and the summand lifting statement §2.2 apply to other families of
  covers with a reflection over a totally real field.

## Worked examples

- K = ℚ, p = 101: L = `ℚ(ζ₃₀₃)⁺` of degree 100; the chain runs over this field and descends along
  an abelian extension of degree 100.
- Over `ℚ(√5)` and over `ℚ(ζ₁₅)⁺` no √5-exclusion arises: five occurs only as the seed prime over
  L, where the `𝔽₅`-model alternative of §2.2 applies to the dual of `A_t[5]`.
- Additive, multiplicative and good places: `y² = x³ − x` at 2 (factor 1), 11a1 at 11
  (`(1 − 11^{−s})⁻¹`), and 11a1 at 3 (`(1 + 3^{−s} + 3^{1−2s})⁻¹`).

## References

All statements above are in our own words. Locators refer to the exact versions linked below;
line references use the line-numbered extractions of those versions.

- **LeHung26.** Bao V. Le Hung, [*A geometric prime switch for elliptic curves over totally real
  and CM fields*](https://hexagonmath.org/pdf/2610.00156v1), discussion draft, 7 October 2026,
  hexagon:2610.00156v1. Theorem 1.1, p.2;
  conventions, p.4; §§2.1–2.4, p.5; §3.1 Proposition 3.1, §3.2 Lemma 3.2 with (9)–(11) and
  §3.3, p.6; §3.4, p.7; §5 Lemma 5.1 and the compatibility and CM paragraphs, p.9. Its Theorem 1.1
  assumes the geometric inputs of OpenAI26; here they are the imported proved layers.
- **OpenAI26.** OpenAI, [*Modularity of elliptic curves over imaginary quadratic fields*](https://raw.githubusercontent.com/openai/math/adc7f1241b42e322a6451854ab7e4b4c146bf78a/preprints/Modularity-of-elliptic-curves-over-imaginary-quadratic-fields-October-4-2026/paper.pdf), 4 October
  2026, revision `adc7f1241b42e322a6451854ab7e4b4c146bf78a`. Proposition 5.1, p.12;
  Proposition 5.2 and Lemma 5.3, p.13; Corollary 5.4, p.14; Proposition 8.4, p.23; §9.4,
  pp.27–28 (the field of definition of CM endomorphisms, and the induced and isobaric CM branches).
  Used through EllipticCurveModularityImaginaryQuadratic, directly in §4.3, and in the contract
  required of ComplexMultiplicationAndExplicitReciprocity.
- **FLHS15.** Nuno Freitas, Bao V. Le Hung and Samir Siksek, [*Elliptic curves over real quadratic
  fields are modular*](https://arxiv.org/pdf/1310.7088v4), arXiv:1310.7088v4 (Invent. Math. 201 (2015), 159–206). Theorem 1, p.2;
  Theorems 2–3, p.3; §2, pp.5–6; Proposition 4.1 and Lemma 4.2, p.8; Theorem 6 and Corollary 5.1,
  p.9; Lemma 6.1 and the proof of Theorem 3 for p = 5, p.10. Page numbers are those of v4.
- **BD14.** Christophe Breuil and Fred Diamond, [*Formes modulaires de Hilbert modulo p et valeurs
  d'extensions galoisiennes*](https://arxiv.org/pdf/1208.5367v3), arXiv:1208.5367v3 (Ann. Sci. ÉNS 47 (2014), 905–974). Théorème 3.2.2,
  pp.36–37, of v3.
- **Kisin09.** Mark Kisin, [*Moduli of finite flat group schemes, and modularity*](https://annals.math.princeton.edu/wp-content/uploads/annals-v170-n3-p03-p.pdf), Ann. of Math. 170
  (2009), 1085–1180. Theorem (3.5.5), p.1170; Theorem (3.5.7), p.1172.
- **BLGG12.** Thomas Barnet-Lamb, Toby Gee and David Geraghty, [*Congruences between Hilbert modular
  forms: constructing ordinary lifts*](https://arxiv.org/pdf/1006.0466v1), arXiv:1006.0466v1 (Duke Math. J. 161 (2012)). Theorem 6.1.5,
  pp.41–42; Theorem 6.1.8, p.45, of v1.
- **BLGG13II.** The same authors, [*Congruences between Hilbert modular forms: constructing ordinary
  lifts, II*](https://arxiv.org/pdf/1205.4491v1), arXiv:1205.4491v1 (Math. Res. Lett. 20 (2013)). Theorem 2.1.2, p.2; Theorems 3.1.1–3.1.2,
  pp.3–4, of v1.
- **BCDT01.** Christophe Breuil, Brian Conrad, Fred Diamond and Richard Taylor, [*On the modularity of
  elliptic curves over Q: wild 3-adic exercises*](https://virtualmath1.stanford.edu/~conrad/papers/tswfinal.pdf), author version. Theorem A, p.1. A Check of the
  endpoint over ℚ.
- **SW99.** Christopher Skinner and Andrew Wiles, [*Residually reducible representations and modular
  forms*](https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), Publ. Math. IHÉS 89 (1999). Theorem A, §4.5, p.74; Theorem B, p.75, under Hypothesis H.
  Named in the supplier contracts as not supplying the totally real weight-two lifting theorem.
