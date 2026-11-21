module

public import Mathlib
public import TauCeti.RingTheory.Dagger.WashnitzerAlgebra
public import TauCeti.RingTheory.Dagger.WeakCompletion.Basic

/-!
# P-adic differential equations, rigid cohomology and p-adic weights: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. This file states the roadmap's headline theorems against the pinned Mathlib
and Tau Ceti, each with `sorry`; discharging all of them finishes neither a layer nor the
roadmap.

The statements here are Arabia's controlled lifting for smooth algebras modulo an
arbitrary ideal (RD.0.39), Frobenius lifts on the weak completion of a smooth algebra over
a complete discrete valuation ring (RD.0.42), finite free resolutions (RD.0.55) and
unimodular vectors over polynomial rings (RD.0.56), the rigid-analytic
Quillen–Suslin theorem over the Monsky–Washnitzer algebra (RD.3.27), to which RD.0.55 and
RD.0.56 are the algebraic input, and Kedlaya's corrected denominator bound for hyperelliptic
reduction (RD.7.13(b)). RD.0.42 and RD.3.27 are stated on Tau Ceti's
`TauCeti.Dagger.weakCompletion` and `TauCeti.Dagger.washnitzerAlgebra`; RD.7.13(b) is stated
in its polynomial form over `W(𝔽_q)`.

The other analytic headline results of RD.0 (the Laurent, Robba and Amice carriers,
Frobenius lifts on the Robba ring, Kedlaya's analytic rings, the extended Robba ring, the
Bézout property and closed ideals) require functions on annuli, the Robba and Amice rings
and their topologies. These carriers are absent from the pins. The radii, break
decompositions and Dieudonné–Manin theorems of RD.1 and the slope filtration, Tsuzuki finite
monodromy, local monodromy and irregularity–Swan comparison of RD.2 require differential and
Frobenius modules over those rings. Mathlib's `WittVector.Isocrystal` and its rank-one
classification do not supply the ramified coefficient and general Frobenius categories of
those targets. The cyclic-vector theorem that RD.1.7 applies is FormalConnectionsOpers §6.2
and is not restated here.

The frame independence, Dwork–Berthelot convergence, Katz–Crew correspondence and
coefficient equivalences of RD.3 require tubes, strict neighbourhoods and convergent and
overconvergent isocrystal categories. The Monsky–Washnitzer, Gysin, dagger and log
comparisons of RD.4 and the finiteness, descent, full faithfulness, Poincaré duality,
Künneth, Étesse descent and semistable reduction of RD.5 require these categories and rigid
cohomology with its support functors. None of these coefficient or cohomology carriers
exists at the pins.

The Lefschetz trace formula, rationality of coefficient L-functions, index formulas, Fourier
comparison and p-adic Weil II of RD.6 therefore have no signatures here. The scalar
hyper-Kloosterman sum and its numerical Deligne bound belong to CongruenceSpectralGap
§§4.2a–4.2b; the Kloosterman F-isocrystal and its purity (RD.6.95, RD.6.97), which give a
rigid proof of that bound, need the same absent carriers. RD.7's rigid–crystalline
comparison with coefficients, equality of rigid, crystalline and étale Weil factors,
abelian-variety comparison, crystalline lattice bounds, coefficient-congruence bounds for
Frobenius polynomials of curves and Kloosterman moment comparisons require the corresponding
geometric cohomology and filtered comparison objects, also absent from the pins. The weight-separated extraction of integral factors that RD.7.5 adapts is
`degreeFactorExtraction` of DeligneWeightsAndPurity §4.4 and is not restated here.
-/

@[expose] public section

namespace TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology

/-! ## Layer RD.0: Coefficient rings and analytic foundations -/

namespace RD0

universe u

/-- Arabia's controlled lifting theorem (RD.0.39(a)): a compatible smooth-algebra map
lifts after an étale neighbourhood of `IB · ker p`, retaining its reduction modulo `I`.
The map `hbar` factors through `S/IS` because its target is annihilated by `I`;
`hcompat` expresses compatibility modulo `IC` on quotient representatives. -/
theorem arabia_controlled_lifting
    {R S B C : Type u} [CommRing R] [CommRing S] [CommRing B] [CommRing C]
    [Algebra R S] [Algebra R B] [Algebra R C] [Algebra.Smooth R S]
    (I : Ideal R) (p : B →ₐ[R] C) (hp : Function.Surjective p) (φ : S →ₐ[R] C)
    (hbar : S →ₐ[R] (B ⧸ Ideal.map (algebraMap R B) I))
    (hcompat : ∀ (s : S) (b : B),
      Ideal.Quotient.mk (Ideal.map (algebraMap R B) I) b = hbar s →
        p b - φ s ∈ Ideal.map (algebraMap R C) I) :
    ∃ (E : Type u) (_ : CommRing E) (_ : Algebra B E)
      (_ : Algebra R E) (_ : IsScalarTower R B E),
      Algebra.Etale B E ∧
      Nonempty ((B ⧸ (Ideal.map (algebraMap R B) I * RingHom.ker p)) ≃ₐ[B]
        (E ⧸ Ideal.map (algebraMap B E)
          (Ideal.map (algebraMap R B) I * RingHom.ker p))) ∧
      ∃ (pE : E →ₐ[R] C) (hE : S →ₐ[R] E)
        (eI : (B ⧸ Ideal.map (algebraMap R B) I) ≃ₐ[B]
          (E ⧸ Ideal.map (algebraMap B E) (Ideal.map (algebraMap R B) I))),
        Function.Surjective pE ∧
        (∀ b : B, pE (algebraMap B E b) = p b) ∧ pE.comp hE = φ ∧
        ∀ s : S, Ideal.Quotient.mk
          (Ideal.map (algebraMap B E) (Ideal.map (algebraMap R B) I)) (hE s) =
            eI (hbar s) := by
  sorry

section FrobeniusLift

open TauCeti.Dagger IsLocalRing

/-- Frobenius lifts on weak completions (RD.0.42): let `O` be a complete discrete valuation
ring of characteristic zero with uniformiser `π` and residue characteristic `p`, and `σK` a
ring endomorphism of `O` reducing to the `q`-power map of the residue field, `q = p ^ f`.
The weak completion `S†` of a smooth `O`-algebra `S` has a `σK`-semilinear ring
endomorphism `φ` with `φ x - x ^ q ∈ π S†` for every `x ∈ S†`. -/
theorem exists_frobenius_lift_weakCompletion {O : Type*} [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] [IsAdicComplete (maximalIdeal O) O] [CharZero O]
    {π : O} (hπ : Irreducible π) {p f : ℕ} [Fact p.Prime] [CharP (ResidueField O) p]
    (σK : O →+* O) (hσK : ∀ a : O, σK a - a ^ (p ^ f) ∈ maximalIdeal O)
    (S : Type*) [CommRing S] [Algebra O S] [Algebra.Smooth O S] :
    ∃ φ : weakCompletion π S →+* weakCompletion π S,
      (∀ a : O, φ (algebraMap O _ a) = algebraMap O _ (σK a)) ∧
      ∀ x : weakCompletion π S,
        φ x - x ^ (p ^ f) ∈ Ideal.span {algebraMap O (weakCompletion π S) π} := by
  sorry

end FrobeniusLift

/-- `M` has a finite free resolution of length at most `n` (RD.0.55): for `n = 0`, `M` is finite
and free; for `n + 1`, some surjection `Rᵏ → M` has a kernel with a finite free resolution of
length at most `n`. Unwound, an exact sequence `0 → Fₙ → ⋯ → F₀ → M → 0` of finite free
modules. -/
def HasFiniteFreeResolutionLE (R : Type u) [CommRing R] :
    ℕ → (M : Type u) → [AddCommGroup M] → [Module R M] → Prop
  | 0, M, _, _ => Module.Finite R M ∧ Module.Free R M
  | n + 1, M, _, _ => ∃ (k : ℕ) (f : (Fin k → R) →ₗ[R] M),
      Function.Surjective f ∧ HasFiniteFreeResolutionLE R n (LinearMap.ker f)

/-- `M` has a finite free resolution of some length (RD.0.55). -/
def HasFiniteFreeResolution (R : Type u) [CommRing R] (M : Type u) [AddCommGroup M]
    [Module R M] : Prop :=
  ∃ n, HasFiniteFreeResolutionLE R n M

section FiniteFreeResolution

variable {R : Type u} [CommRing R] {M₁ M M₂ : Type u} [AddCommGroup M₁] [Module R M₁]
  [AddCommGroup M] [Module R M] [AddCommGroup M₂] [Module R M₂]
  {f : M₁ →ₗ[R] M} {g : M →ₗ[R] M₂}

/-- Two out of three, extensions (RD.0.55(a); Lang XXI.2.7). -/
theorem HasFiniteFreeResolution.extension (hf : Function.Injective f)
    (hg : Function.Surjective g) (hfg : Function.Exact f g)
    (h₁ : HasFiniteFreeResolution R M₁) (h₂ : HasFiniteFreeResolution R M₂) :
    HasFiniteFreeResolution R M := by
  sorry

/-- Two out of three, kernels (RD.0.55(a); Lang XXI.2.7). -/
theorem HasFiniteFreeResolution.kernel (hf : Function.Injective f)
    (hg : Function.Surjective g) (hfg : Function.Exact f g)
    (h : HasFiniteFreeResolution R M) (h₂ : HasFiniteFreeResolution R M₂) :
    HasFiniteFreeResolution R M₁ := by
  sorry

/-- Two out of three, cokernels (RD.0.55(a); Lang XXI.2.7). -/
theorem HasFiniteFreeResolution.cokernel (hf : Function.Injective f)
    (hg : Function.Surjective g) (hfg : Function.Exact f g)
    (h₁ : HasFiniteFreeResolution R M₁) (h : HasFiniteFreeResolution R M) :
    HasFiniteFreeResolution R M₂ := by
  sorry

/-- A projective module with a finite free resolution is stably free (RD.0.55(b);
Lang XXI.2.1). -/
theorem HasFiniteFreeResolution.isStablyFree [Module.Projective R M]
    (h : HasFiniteFreeResolution R M) : Module.IsStablyFree R M := by
  sorry

/-- A finite projective module has a finite free resolution iff it is stably free
(RD.0.55(b)). -/
theorem hasFiniteFreeResolution_iff_isStablyFree [Module.Finite R M] [Module.Projective R M] :
    HasFiniteFreeResolution R M ↔ Module.IsStablyFree R M := by
  sorry

/-- Flat base change of a finite free resolution (RD.0.55(c)). -/
theorem HasFiniteFreeResolutionLE.baseChange_of_flat (A : Type u) [CommRing A] [Algebra R A]
    [Module.Flat R A] {n : ℕ} (h : HasFiniteFreeResolutionLE R n M) :
    HasFiniteFreeResolutionLE A n (TensorProduct R A M) := by
  sorry

/-- Base change along `S → A` for a module killed by `g`, when `g` is a nonzerodivisor on `S`
and on `A` and `S/gS → A/gA` is bijective (RD.0.55(c)); no flatness is assumed. -/
theorem HasFiniteFreeResolutionLE.baseChange_of_isSMulRegular {S A : Type u} [CommRing S]
    [CommRing A] [Algebra S A] (g : S) (hgS : IsSMulRegular S g)
    (hgA : IsSMulRegular A (algebraMap S A g))
    (hsurj : ∀ a : A, ∃ s : S, a - algebraMap S A s ∈ Ideal.span {algebraMap S A g})
    (hinj : ∀ s : S, algebraMap S A s ∈ Ideal.span {algebraMap S A g} → s ∈ Ideal.span {g})
    {N : Type u} [AddCommGroup N] [Module S N] (hN : ∀ x : N, g • x = 0) {n : ℕ}
    (h : HasFiniteFreeResolutionLE S n N) :
    Function.Bijective (TensorProduct.mk S A N 1) ∧
      HasFiniteFreeResolutionLE A n (TensorProduct S A N) := by
  sorry

/-- Serre: over a noetherian ring all of whose finite modules have finite free resolutions,
so do all finite modules over the polynomial ring (RD.0.55(d); Lang XXI.2.8). -/
theorem hasFiniteFreeResolution_polynomial [IsNoetherianRing R]
    (h : ∀ (N : Type u) [AddCommGroup N] [Module R N], Module.Finite R N →
      HasFiniteFreeResolution R N)
    (N : Type u) [AddCommGroup N] [Module (Polynomial R) N] [Module.Finite (Polynomial R) N] :
    HasFiniteFreeResolution (Polynomial R) N := by
  sorry

end FiniteFreeResolution

/-- Two vectors of `Rⁿ` are equivalent when an invertible matrix carries one to the other
(RD.0.56). -/
def UnimodularEquiv {R : Type u} [CommRing R] {n : ℕ} (v w : Fin n → R) : Prop :=
  ∃ P : Matrix.GeneralLinearGroup (Fin n) R, (P : Matrix (Fin n) (Fin n) R).mulVec v = w

/-- The unimodular extension property (RD.0.56): every unimodular vector is equivalent to the
first standard basis vector. -/
def HasUnimodularExtension (R : Type u) [CommRing R] : Prop :=
  ∀ (n : ℕ) (v : Fin (n + 1) → R), Module.IsUnimodular R v → UnimodularEquiv v (Pi.single 0 1)

/-- A unimodular vector over `B[t]`, `B` an integral domain, with a monic entry is equivalent
to the vector of its constant terms (RD.0.56(a); Lang XXI.3.4). -/
theorem unimodularEquiv_C_eval_zero_of_monic {B : Type u} [CommRing B] [IsDomain B] {n : ℕ}
    (f : Fin n → Polynomial B) (hf : Module.IsUnimodular (Polynomial B) f) (i : Fin n)
    (hi : (f i).Monic) :
    UnimodularEquiv f (fun j ↦ Polynomial.C ((f j).eval 0)) := by
  sorry

/-- The unimodular extension property holds exactly when every finite stably free module is
free (RD.0.56(b); the forward direction is Lang XXI.3.6). -/
theorem hasUnimodularExtension_iff {R : Type u} [CommRing R] :
    HasUnimodularExtension R ↔ ∀ (M : Type u) [AddCommGroup M] [Module R M],
      Module.Finite R M → Module.IsStablyFree R M → Module.Free R M := by
  sorry

end RD0

/-! ## Layer RD.3: Frames, convergent and overconvergent coefficients -/

namespace RD3

open TauCeti.Dagger

/-- The rigid-analytic Quillen–Suslin theorem (RD.3.27; Kedlaya, *Full faithfulness for
overconvergent F-isocrystals*, Proposition 6.6 and Theorem 6.7): over a complete field `K`
with a nontrivial nonarchimedean absolute value, every finite projective module over the
Monsky–Washnitzer algebra `K⟨t₁, …, tₙ⟩†` is free. -/
theorem rigid_quillen_suslin {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K]
    [CompleteSpace K] (n : ℕ) (M : Type*) [AddCommGroup M]
    [Module (washnitzerAlgebra (Fin n) K) M] [Module.Finite (washnitzerAlgebra (Fin n) K) M]
    [Module.Projective (washnitzerAlgebra (Fin n) K) M] :
    Module.Free (washnitzerAlgebra (Fin n) K) M := by
  sorry

end RD3

/-! ## Layer RD.7: Coefficient comparisons and Weil factors -/

namespace RD7

open Polynomial

/-- Kedlaya's corrected positive-power denominator bound (RD.7.13(b); Edixhoven, *Point
counting after Kedlaya*, Lemma 4.3.5, with corrected degree and exponent). Let `p` be odd,
`Q ∈ W(𝔽_q)[x]` monic of degree `2g + 1` with squarefree reduction and `B ∈ W(𝔽_q)[x]` of
degree at most `2g`. On `y² = Q(x)` the identity `B·y^{2m+1} dx = b dx/y + d(F y)` reads
`B·Q^{m+1} = b + F'·Q + F·Q'/2`; for the reduced `b` (degree `< 2g`) and its polynomial
primitive `F` over the fraction field, the multiplier `p^⌊log_p((2g+1)(2m+3))⌋` makes every
coefficient of `b` and of `F` integral. -/
theorem hyperelliptic_reduction_denominator_bound {p : ℕ} [Fact p.Prime] (hp : p ≠ 2)
    {n : ℕ} (g m : ℕ) (Q B : (WittVector p (GaloisField p n))[X]) (hQ : Q.Monic)
    (hQdeg : Q.natDegree = 2 * g + 1)
    (hQsq : Squarefree (Q.map (WittVector.constantCoeff (p := p))))
    (hB : B.natDegree ≤ 2 * g)
    (b F : (FractionRing (WittVector p (GaloisField p n)))[X]) (hb : b.degree < (2 * g : ℕ))
    (h : (B * Q ^ (m + 1)).map (algebraMap _ _) =
      b + derivative F * Q.map (algebraMap _ _) +
        C (1 / 2) * F * derivative (Q.map (algebraMap _ _))) (i : ℕ) :
    ((p : FractionRing (WittVector p (GaloisField p n))) ^
        Nat.log p ((2 * g + 1) * (2 * m + 3)) * b.coeff i ∈
        (algebraMap (WittVector p (GaloisField p n)) _).range) ∧
      ((p : FractionRing (WittVector p (GaloisField p n))) ^
        Nat.log p ((2 * g + 1) * (2 * m + 3)) * F.coeff i ∈
        (algebraMap (WittVector p (GaloisField p n)) _).range) := by
  sorry

end RD7

end TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology
