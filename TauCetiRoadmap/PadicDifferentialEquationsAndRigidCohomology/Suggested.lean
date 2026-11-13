module

public import Mathlib

/-!
# P-adic differential equations, rigid cohomology and p-adic weights: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. This file states the roadmap's headline theorems against the pinned Mathlib
and Tau Ceti, each with `sorry`; discharging all of them finishes neither a layer nor the
roadmap.

The statements here are Arabia's controlled lifting for smooth algebras modulo an
arbitrary ideal (RD.0.39), the commutative algebra behind the rigid-analytic Quillen–Suslin
theorem RD.3.27 (finite free resolutions, RD.0.55, and unimodular vectors over polynomial
rings, RD.0.56), and the cyclic-vector theorem for a nonzero derivation over any
characteristic-zero field (RD.1.7).

The analytic headline results of RD.0 require annular function rings, the Robba and
Amice rings, weak completions and their topologies. These carriers are absent from the
pins. The radii, break decompositions and Dieudonné–Manin theorems of RD.1 and the slope
filtration, Tsuzuki finite monodromy, local monodromy and irregularity–Swan comparison
of RD.2 require differential and Frobenius modules over those rings. Mathlib's
`WittVector.Isocrystal` and its rank-one classification do not supply the ramified
coefficient and general Frobenius categories of those targets.

The frame independence, Dwork–Berthelot convergence, Katz–Crew correspondence and
coefficient equivalences of RD.3 require tubes, strict neighbourhoods and convergent and
overconvergent isocrystal categories. The Monsky–Washnitzer, Gysin, dagger and log
comparisons of RD.4 and the finiteness, descent, full faithfulness, Poincaré duality,
Künneth, Étesse descent and semistable reduction of RD.5 require these categories and rigid cohomology
with its support functors. None of these coefficient or cohomology carriers exists
at the pins.

The Lefschetz trace formula, rationality of coefficient L-functions, index formulas,
Fourier comparison and p-adic Weil II of RD.6 therefore have no signatures here. The
scalar hyper-Kloosterman sum and its numerical Deligne bound belong to
CongruenceSpectralGap §§4.2a–4.2b; the Kloosterman F-isocrystal and its purity (RD.6.95,
RD.6.97), which give a rigid proof of that bound, need the same absent carriers. RD.7's rigid–crystalline comparison with coefficients, equality of
rigid, crystalline and étale Weil factors, abelian-variety comparison, crystalline
lattice bounds and Kloosterman moment comparisons require the corresponding geometric
cohomology and filtered comparison objects, also absent from the pins. The weight-separated
extraction of integral factors that RD.7.5 adapts is `degreeFactorExtraction` of
DeligneWeightsAndPurity §4.4 and is not restated here.
-/

@[expose] public section

namespace TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology

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

namespace RD1

/-- A vector is cyclic when its successive covariant derivatives form a basis. -/
def CyclicFor {K V : Type*} [Field K] [AddCommGroup V] [Module K V]
    (D : V → V) (n : ℕ) (v : V) : Prop :=
  ∃ b : Module.Basis (Fin n) K V, ∀ i, b i = (D^[i.val]) v

/-- The cyclic-vector theorem over any characteristic-zero differential field with
a nonzero derivation (RD.1.7). The connection is additive and satisfies Leibniz. -/
theorem katz_cyclic_vector {K V : Type*} [Field K] [CharZero K]
    [AddCommGroup V] [Module K V] [FiniteDimensional K V]
    (δ : Derivation ℤ K K) (hδ : δ ≠ 0) (D : V →+ V)
    (hD : ∀ (a : K) (v : V), D (a • v) = δ a • v + a • D v) :
    ∃ v : V, CyclicFor (K := K) D (Module.finrank K V) v := by
  sorry

end RD1

end TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology
