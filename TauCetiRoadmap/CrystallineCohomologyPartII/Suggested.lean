module

public import Mathlib
public import TauCeti.AlgebraicGeometry.Cohomology.Basic
public import TauCeti.AlgebraicGeometry.Cohomology.Pullback
public import TauCeti.AlgebraicGeometry.Cohomology.Module.Base
public import TauCeti.AlgebraicGeometry.Chow.Basic
public import TauCeti.AlgebraicGeometry.LineBundle.Ample
public import TauCeti.AlgebraicGeometry.LineBundle.Dual
public import TauCeti.AlgebraicGeometry.EffectiveCartierDivisor.Invertible
public import TauCeti.AlgebraicGeometry.AbelianVariety.Basic
public import TauCeti.AlgebraicGeometry.ProjectiveSpectrum.ProjectiveOver

/-!
# Crystalline cohomology, Part II (Witt vector cohomology of singular varieties): target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, the headline theorems of the roadmap that are statable there, each with `sorry`.
Every target, API list and Check lives in the README.

Statable at the pins, and stated below:

* the point-count consequence of Berthelot–Bloch–Esnault for a morphism of proper schemes over a
  finite field inducing isomorphisms on structure-sheaf cohomology (README §6.4 (ii)), as
  `card_rationalPoints_modEq_of_cohomologyPullback_bijective`; its cohomology is Tau Ceti's
  sheaf cohomology `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology` of the structure sheaf,
  and the map is Tau Ceti's pullback `AlgebraicGeometry.Scheme.Hom.cohomologyPullback` composed
  with the identification `f^* 𝒪_Y ≅ 𝒪_X`. The absolute form (README §6.4 (iv)) is its case
  `Y = Spec K`;
* the Ax–Katz congruence modulo `q` for complete intersections of small degree in projective
  space (README §6.6), as `card_projectiveZeroLocus_modEq_one`, and its affine form,
  `card_dvd_card_solutions_of_sum_lt`, which strengthens Mathlib's Chevalley–Warning theorem
  `char_dvd_card_solutions_of_sum_lt` from `p` to `q`;
* Serre's congruence `|Θ(F_q)| ≡ |Θ'(F_q)| mod q` for theta divisors on an abelian variety
  (README §6.9), as `card_thetaDivisor_modEq`, with the definition `IsThetaDivisor` on Tau Ceti's
  abelian varieties, effective Cartier ideal sheaves, dual line bundles and ample classes;
* Esnault's point count for universally `CH_0`-trivial smooth projective varieties (README
  §6.14 (i)), as `card_rationalPoints_modEq_one_of_universallyCH0Trivial`, with the definitions
  `zeroCycleDegree` and `UniversallyCH0Trivial` on Tau Ceti's zero-cycles modulo rational
  equivalence.

Not statable at the pins (each is a README target):

* Berthelot–Bloch–Esnault's comparison of compactly supported Witt vector cohomology with the
  slope `< 1` part of rigid cohomology with compact supports (§3.6), and the identity
  `ζ^{<1}(X, t) = ζ^W(X, t)` (§6.2): Mathlib and Tau Ceti have neither rigid cohomology nor
  the Witt vector sheaves `W_n 𝒪_X`, `W 𝒪_X` of a scheme and their cohomology.
* Ax's criterion in its point-count form (§6.3): the point counts `|X(F_{q^r})|` and
  `|Y(F_{q^r})|` are congruent modulo `q^r` for all `r` if and only if the slope `< 1` factors of
  the zeta functions of `X` and `Y` agree. The pins have the zeta function of a Weierstrass curve
  only, not that of a separated scheme of finite type over a finite field, and no Newton-polygon
  slope factors. The arithmetic core of the criterion is a statement about rational power series
  with integer coefficients that mentions none of the roadmap's objects; it stays a README target.
* Bhatt–Scholze's h-descent for Frobenius-inverted Witt vector cohomology (§§1.5–1.6):
  no h-topology and no Witt vector sheaves of schemes.
* Ekedahl duality for the Witt canonical system and the action of proper correspondences on
  relative Hodge–Witt cohomology (§§4.1, 4.5): no de Rham–Witt complex or Witt canonical sheaves
  of a scheme, no Witt dualizing complexes and no Hodge–Witt cohomology with supports.
* The theorems on Witt-rational singularities (§§5.4, 5.6, 5.12) and the congruence of point
  counts of quasi-birational schemes with WO-rational singularities (§6.5): no Witt vector
  sheaves, no Witt canonical sheaves, no isogeny category of sheaves on schemes.
* The congruence for the quotient of a proper scheme by a finite group (§6.4 (iii)): the pins
  have the invariant quotient of an affine scheme only, not the quotient `X/G` of a proper
  scheme, and no Witt vector cohomology on which the hypothesis is stated.
* Serre's vanishing of the Bockstein operations of an abelian variety `A` of dimension `g`, in
  the form of the injectivity of `V^i : H^g(A, 𝒪_A) → H^g(A, W_{i+1} 𝒪_A)` (§6.8): no sheaves
  `W_n 𝒪_X` of a scheme and no Verschiebung on their cohomology.
* Esnault's vanishing of Witt vector cohomology of universally `CH_0`-trivial varieties and the
  point count of their WO-rational degenerations (§6.13, §6.14 (ii)): no Witt vector cohomology
  and no Witt-rational singularities.
* Esnault's point count for rationally chain connected, in particular Fano, smooth projective
  varieties (§§6.11, 6.12, 6.14 (i)): no families of rational curves and no notion of rational
  chain connectedness. `card_rationalPoints_modEq_one_of_universallyCH0Trivial` states the
  theorem under universal `CH_0`-triviality, which §6.12 derives from rational chain
  connectedness.
-/

@[expose] public section

universe u

open AlgebraicGeometry CategoryTheory Limits MonoidalCategory MvPolynomial
open TauCeti.AlgebraicGeometry

namespace TauCetiRoadmap.CrystallineCohomologyPartII

/-! ## Layer 6: Point counts modulo q and Esnault's theorem -/

/-- **Point counts along a morphism inducing isomorphisms on structure-sheaf cohomology**
(Berthelot–Bloch–Esnault, Corollary 1.6). Let `K` be a finite field, `X` and `Y` proper over `K`
and `f : X → Y` a `K`-morphism such that for every `i` the pullback `Hⁱ(Y, 𝒪_Y) → Hⁱ(X, f^* 𝒪_Y)`
composed with the canonical identification `f^* 𝒪_Y ≅ 𝒪_X` is bijective. Then the numbers of
`K`-rational points of `X` and `Y`, the sections of their structure morphisms, are congruent
modulo `|K|`. -/
theorem card_rationalPoints_modEq_of_cohomologyPullback_bijective {K : Type u} [Field K]
    [Finite K] {X Y : Scheme.{u}} (πX : X ⟶ Spec (.of K)) (πY : Y ⟶ Spec (.of K))
    [IsProper πX] [IsProper πY] (f : X ⟶ Y) (hf : f ≫ πY = πX)
    (hH : ∀ i, Function.Bijective (fun x =>
      (Scheme.Modules.cohomologyFunctor X i).map (Scheme.Modules.pullbackObjUnitIso f).hom
        (f.cohomologyPullback (𝟙_ Y.Modules) i x))) :
    Nat.card {s : Spec (.of K) ⟶ X // s ≫ πX = 𝟙 _} ≡
      Nat.card {s : Spec (.of K) ⟶ Y // s ≫ πY = 𝟙 _} [MOD Nat.card K] := by
  sorry

/-- **Ax–Katz modulo `q`** (Berthelot–Bloch–Esnault, Corollary 1.5, from Proposition 6.8 and
Corollary 1.3). Let `K` be a finite field and `F₀, …, F_{r-1}` homogeneous polynomials in
`n + 1` variables over `K` of degrees `d_j ≥ 1` with `∑ d_j ≤ n`. Then the number of points of
`ℙⁿ(K)` at which all `F_j` vanish is congruent to `1` modulo `|K|`. A point of the
projectivization is tested on its chosen representative; homogeneity makes the condition
independent of that choice. -/
theorem card_projectiveZeroLocus_modEq_one {K : Type*} [Field K] [Finite K] {n r : ℕ}
    (F : Fin r → MvPolynomial (Fin (n + 1)) K) (d : Fin r → ℕ)
    (hF : ∀ j, (F j).IsHomogeneous (d j)) (hd : ∀ j, 1 ≤ d j) (hsum : ∑ j, d j ≤ n) :
    Nat.card {x : Projectivization K (Fin (n + 1) → K) // ∀ j, eval x.rep (F j) = 0} ≡ 1
      [MOD Nat.card K] := by
  sorry

/-- **Ax's theorem modulo `q`**, the affine form of `card_projectiveZeroLocus_modEq_one`.
For polynomials `f_i` (`i ∈ s`) in finitely many variables over a finite field `K` whose total
degrees add up to less than the number of variables, the number of common zeros in `K^σ` is
divisible by `|K|`. Mathlib's `char_dvd_card_solutions_of_sum_lt` gives divisibility by the
characteristic only. -/
theorem card_dvd_card_solutions_of_sum_lt {K σ ι : Type*} [Field K] [Finite K] [Finite σ]
    {s : Finset ι} {f : ι → MvPolynomial σ K}
    (h : ∑ i ∈ s, (f i).totalDegree < Nat.card σ) :
    Nat.card K ∣ Nat.card {x : σ → K // ∀ i ∈ s, eval x (f i) = 0} := by
  sorry

/-- A **theta divisor** on an abelian variety `A` over `K`, encoded by its ideal sheaf
`I = 𝒪_A(−Θ)`: `I` is an effective Cartier ideal sheaf, the dual `𝒪_A(Θ)` of the line bundle `I`
is ample, and `𝒪_A(Θ)` has a one-dimensional space of global sections. For an ample line bundle
`L` on an abelian variety `h⁰(L) = χ(L)` and `deg φ_L = χ(L)²`, so the last condition says that
`𝒪_A(Θ)` defines a principal polarization (README §6.9). -/
def IsThetaDivisor {K : Type u} [Field K] (A : AbelianVariety K)
    (I : A.toScheme.IdealSheafData) : Prop :=
  ∃ hI : I.IsEffectiveCartier,
    (LineBundleClass.mk hI.toInvertibleSheaf.dual).IsAmple ∧
    letI : A.toScheme.Over (Spec (.of K)) := ⟨A.toOver.hom⟩
    Module.finrank K (Scheme.Modules.Cohomology hI.toInvertibleSheaf.dual.obj 0) = 1

/-- **Serre's congruence for theta divisors** (Berthelot–Bloch–Esnault, Theorem 1.4). Two theta
divisors on an abelian variety over a finite field `K` have congruent numbers of `K`-rational
points modulo `|K|`; the rational points of a divisor are the sections of its closed subscheme
over `Spec K`. -/
theorem card_thetaDivisor_modEq {K : Type u} [Field K] [Finite K] (A : AbelianVariety K)
    (I I' : A.toScheme.IdealSheafData) (hI : IsThetaDivisor A I) (hI' : IsThetaDivisor A I') :
    Nat.card {s : Spec (.of K) ⟶ I.subscheme // s ≫ (I.subschemeι ≫ A.toOver.hom) = 𝟙 _} ≡
      Nat.card {s : Spec (.of K) ⟶ I'.subscheme // s ≫ (I'.subschemeι ≫ A.toOver.hom) = 𝟙 _}
        [MOD Nat.card K] := by
  sorry

/-- The **degree of a zero-cycle** `z` on a scheme `π : X → Spec L` over a field: the sum of its
coefficients weighted by the residue degrees `[κ(x) : L]` (README §6.10; the support of a cycle
is locally finite, so the sum is finite when `X` is quasi-compact). -/
noncomputable def zeroCycleDegree {X : Scheme.{u}} {L : Type u} [Field L]
    (π : X ⟶ Spec (.of L)) (z : AlgebraicCycle X ℤ) : ℤ :=
  ∑ᶠ x, z x * (π.residueDegree x : ℤ)

/-- **Universal rational `CH₀`-triviality** of a proper scheme `π : X → Spec K` (README §6.10):
for every field extension `L` of `K`, the degree `CH₀(X_L) ⊗ ℚ → ℚ` is bijective, that is, some
zero-cycle on `X_L` has nonzero degree and every zero-cycle of degree `0` on `X_L` has a positive
multiple rationally equivalent to zero. -/
def UniversallyCH0Trivial {K : Type u} [Field K] {X : Scheme.{u}} (π : X ⟶ Spec (.of K))
    [IsProper π] : Prop :=
  ∀ (L : Type u) [Field L] [Algebra K L],
    let πL := pullback.snd π (Spec.map (CommRingCat.ofHom (algebraMap K L)))
    haveI : IsLocallyNoetherian (pullback π (Spec.map (CommRingCat.ofHom (algebraMap K L)))) :=
      LocallyOfFiniteType.isLocallyNoetherian πL
    (∃ z : Chow.cyclesOfDimension (pullback π (Spec.map (CommRingCat.ofHom (algebraMap K L)))) 0,
      zeroCycleDegree πL z ≠ 0) ∧
    ∀ z : Chow.cyclesOfDimension (pullback π (Spec.map (CommRingCat.ofHom (algebraMap K L)))) 0,
      zeroCycleDegree πL z = 0 → ∃ N : ℕ, 0 < N ∧ N • z ∈ Chow.RatEquiv _ 0

/-- **Esnault's theorem** (Esnault, Corollary 1.2; README §6.14 (i)): a smooth, projective,
geometrically connected variety over a finite field `K` that is universally `CH₀`-trivial has a
number of `K`-rational points congruent to `1` modulo `|K|`; in particular it has a rational
point. -/
theorem card_rationalPoints_modEq_one_of_universallyCH0Trivial {K : Type u} [Field K]
    [Finite K] {X : Scheme.{u}} [X.Over (Spec (.of K))] [X.IsProjectiveOver K]
    [Smooth (X ↘ Spec (.of K))] [GeometricallyConnected (X ↘ Spec (.of K))]
    (h : UniversallyCH0Trivial (X ↘ Spec (.of K))) :
    Nat.card {s : Spec (.of K) ⟶ X // s ≫ (X ↘ Spec (.of K)) = 𝟙 _} ≡ 1 [MOD Nat.card K] := by
  sorry

end TauCetiRoadmap.CrystallineCohomologyPartII
