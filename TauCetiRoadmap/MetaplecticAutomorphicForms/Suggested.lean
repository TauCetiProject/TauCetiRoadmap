import Mathlib
import TauCeti.Algebra.GroupAction.Trivial
import TauCeti.Topology.Algebra.GroupExtension.FactorSet

/-!
# Metaplectic groups, Weil representations and automorphic theta kernels

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`.

Layer 1, §1.1 is stated as smooth Stone–von Neumann over every nonarchimedean local field of
characteristic different from two, including the scalar endomorphism assertion. Its model is
the compactly supported submodule of Mathlib's `LocallyConstant`, and smoothness is the open
stabilizer condition on Mathlib's `Representation`.

Layer 1, §1.2 is stated as the unitary Stone–von Neumann classification: an irreducible
strongly continuous unitary representation with a fixed nontrivial central character is the
Schrödinger model on Mathlib's `MeasureTheory.Lp`, and every such unitary representation is a
Hilbert `lp` sum of that model. The statements allow arbitrary finite-dimensional real
polarizations and nontrivial continuous circle-valued characters. Irreducibility is expressed
using closed invariant submodules; orbit continuity is explicit because `ContRepresentation`
only bundles continuity of each individual operator. The group is Tau Ceti's native factor-set
extension with its product topology and the half-alternating Heisenberg law.

Layer 8, §8.24 is stated as the genus-two theta inversion formula, including its finite Fourier
phase, normalization and principal square root. The series and Siegel domain have short
matrix-based definitions on Mathlib's carriers.

The other headline signatures are not stated at the pins:

* Layer 0's smooth-vector identification needs the Hilbert oscillator action and its smooth
  orbit maps. Layer 1's oscillator normalizer needs its strong-operator topology and its action
  on the Schrödinger model.
* Layer 2's Weil-index comparison, Leray/Rao cocycles and genuine Weil representation need the
  distributional Weil index and normalized topological metaplectic double cover and action.
* Layer 3's Howe duality, conservation, first-occurrence, see-saw and parameter comparisons need
  smooth contragredients, big and small theta modules, enhanced Witt towers and the specified
  local parameter categories. Generic algebraic coinvariants do not provide these objects.
* Layer 4's product formula, rational splitting and global Weil representation need the local
  Weil indices, restricted-product cover and adelic Schwartz–Bruhat oscillator model. Its
  conditional function-field programme also needs factorization gerbes and global excursions.
* Layer 5's convergence and automorphic theta lifting need that global oscillator model and
  genuine automorphic spaces. Layer 6's Siegel–Weil, Rallis, nonvanishing and global see-saw
  identities also need genuine induced sections, regularized Laurent coefficients and standard
  doubling factors.
* Layer 7's Duke–Imamoḡlu–Tóth trace identities, Biró lift and Shimura eigenline bijection need
  the half-weight Maass and Kohnen-plus cusp spaces, their Hecke actions and geometric traces.
* Layer 8's BFH coefficient and local-test exports need the newform datum, Jacobi Eisenstein
  families, compact-type Whittaker/Novodvorsky transforms and their genuine adelic comparison.
-/

namespace TauCetiRoadmap.MetaplecticAutomorphicForms

namespace Heisenberg

open Multiplicative
attribute [local instance] TauCeti.trivialMulDistribMulAction

variable {R C W : Type*} [CommRing R] [AddCommGroup C] [Module R C]
  [AddCommGroup W] [Module R W]

/-- The factor set `(w, v) ↦ B(w, v)` of a bilinear map `B : W × W → C`, for the trivial action
of `W` on `C` (0.1). Its Tau Ceti extension is the group with law
`(t, w)(s, v) = (t + s + B(w, v), w + v)`. The cocycle identity is biadditivity of `B`. -/
def bilinearFactorSet (B : LinearMap.BilinMap R W C) :
    TauCeti.FactorSet (Multiplicative W) (Multiplicative C) where
  toFun p := ofAdd (B p.1.toAdd p.2.toAdd)
  isMulCocycle₂' g h j := by
    apply toAdd.injective
    simp only [TauCeti.trivialMulDistribMulAction_smul, toAdd_mul, toAdd_ofAdd, map_add,
      LinearMap.add_apply]
    abel
  map_one_one' := by simp

end Heisenberg

namespace StoneVonNeumann

universe u

/-- The half symplectic form in a complete polarization (0.15):
`((x,y),(a,b)) ↦ (B(x,b) − B(a,y))/2`. -/
noncomputable def halfPairing {F X Y : Type*} [Field F] [AddCommGroup X] [Module F X]
    [AddCommGroup Y] [Module F Y] (B : X →ₗ[F] Y →ₗ[F] F) :
    LinearMap.BilinForm F (X × Y) where
  toFun p :=
    { toFun q := (B p.1 q.2 - B q.1 p.2) / 2
      map_add' q r := by simp; ring
      map_smul' c q := by simp; ring }
  map_add' p q := LinearMap.ext fun r => by dsimp; simp; ring
  map_smul' c p := LinearMap.ext fun q => by dsimp; simp; ring

/-- The nonarchimedean Schrödinger carrier (0.15–1.1): the compactly supported submodule of
Mathlib's locally constant complex-valued functions. -/
def schwartzBruhat (X : Type*) [TopologicalSpace X] : Submodule ℂ (LocallyConstant X ℂ) where
  carrier := {f | HasCompactSupport f}
  zero_mem' := HasCompactSupport.zero
  add_mem' hf hg := hf.add hg
  smul_mem' c _ hf := hf.smul_left (f := fun _ => c)

open Multiplicative
attribute [local instance] TauCeti.trivialMulDistribMulAction

/-- **Smooth Stone–von Neumann** (1.1): every irreducible smooth Heisenberg representation
with nontrivial continuous unitary central character is the Schrödinger model, with scalar
intertwining endomorphisms. The field has characteristic different from two; dyadic residue
characteristic and positive field characteristic are both allowed. -/
theorem smooth_stoneVonNeumann
    {F X Y E : Type*} [Field F] [ValuativeRel F] [TopologicalSpace F]
    [IsNonarchimedeanLocalField F]
    [AddCommGroup X] [Module F X] [FiniteDimensional F X]
    [TopologicalSpace X] [IsTopologicalAddGroup X] [ContinuousSMul F X] [T2Space X]
    [AddCommGroup Y] [Module F Y] [FiniteDimensional F Y]
    [TopologicalSpace Y] [IsTopologicalAddGroup Y] [ContinuousSMul F Y] [T2Space Y]
    [AddCommGroup E] [Module ℂ E]
    (h2 : (2 : F) ≠ 0) (B : X →ₗ[F] Y →ₗ[F] F) (hB : Function.Bijective B.flip)
    (ψ : Multiplicative F →* Circle) (hψ : Continuous ψ) (hnψ : ψ ≠ 1)
    (ρ : Representation ℂ (Heisenberg.bilinearFactorSet (halfPairing B)).Extension E)
    [ρ.IsIrreducible]
    (hsmooth : ∀ ξ : E, IsOpen {g | ρ g ξ = ξ})
    (hcentral : ∀ (t : F) (ξ : E),
      ρ ((Heisenberg.bilinearFactorSet (halfPairing B)).inl (ofAdd t)) ξ =
        (ψ (ofAdd t) : ℂ) • ξ) :
    (∃ U : E ≃ₗ[ℂ] schwartzBruhat X,
      ∀ (g : (Heisenberg.bilinearFactorSet (halfPairing B)).Extension) (ξ : E) (u : X),
        (U (ρ g ξ)).1 u =
          (ψ (ofAdd (g.left.toAdd + B u g.right.toAdd.2 +
            B g.right.toAdd.1 g.right.toAdd.2 / 2)) : ℂ) *
              (U ξ).1 (u + g.right.toAdd.1)) ∧
      ∀ T : Representation.IntertwiningMap ρ ρ,
        ∃ c : ℂ, T.toLinearMap = c • LinearMap.id := by
  sorry

open MeasureTheory

variable {X Y : Type*} {H : Type u}
  [NormedAddCommGroup X] [NormedSpace ℝ X] [FiniteDimensional ℝ X]
  [NormedAddCommGroup Y] [NormedSpace ℝ Y] [FiniteDimensional ℝ Y]
  [MeasurableSpace X] [BorelSpace X]
  [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

/-- **Unitary Stone–von Neumann** (1.2): every nonzero irreducible strongly continuous unitary
representation with central character `ψ` is unitarily equivalent to the Schrödinger model.
The equivalence intertwines the actual almost-everywhere translation and phase formula. -/
theorem unitary_stoneVonNeumann [Nontrivial H]
    (B : X →ₗ[ℝ] Y →ₗ[ℝ] ℝ) (hB : Function.Bijective B.flip)
    (ψ : Multiplicative ℝ →* Circle) (hψ : Continuous ψ) (hnψ : ψ ≠ 1)
    (μ : Measure X) [μ.IsAddHaarMeasure]
    (ρ : ContRepresentation ℂ (Heisenberg.bilinearFactorSet (halfPairing B)).Extension H)
    (hcont : ∀ ξ : H, Continuous (fun g => ρ g ξ))
    (hunitary : ∀ g (ξ : H), ‖ρ g ξ‖ = ‖ξ‖)
    (hirr : ∀ S : Submodule ℂ H, IsClosed (S : Set H) →
      (∀ g (ξ : H), ξ ∈ S → ρ g ξ ∈ S) → S = ⊥ ∨ S = ⊤)
    (hcentral : ∀ (t : ℝ) (ξ : H),
      ρ ((Heisenberg.bilinearFactorSet (halfPairing B)).inl (ofAdd t)) ξ =
        (ψ (ofAdd t) : ℂ) • ξ) :
    ∃ U : H ≃ₗᵢ[ℂ] Lp ℂ 2 μ,
      ∀ (g : (Heisenberg.bilinearFactorSet (halfPairing B)).Extension) (ξ : H),
        ∀ᵐ u ∂μ, U (ρ g ξ) u =
          (ψ (ofAdd (g.left.toAdd + B u g.right.toAdd.2 +
            B g.right.toAdd.1 g.right.toAdd.2 / 2)) : ℂ) *
              U ξ (u + g.right.toAdd.1) := by
  sorry

/-- **Hilbert multiplicities in Stone–von Neumann** (1.2): every strongly continuous unitary
representation with central character `ψ` is a Hilbert direct sum of Schrödinger models. -/
theorem unitary_stoneVonNeumann_multiplicity
    (B : X →ₗ[ℝ] Y →ₗ[ℝ] ℝ) (hB : Function.Bijective B.flip)
    (ψ : Multiplicative ℝ →* Circle) (hψ : Continuous ψ) (hnψ : ψ ≠ 1)
    (μ : Measure X) [μ.IsAddHaarMeasure]
    (ρ : ContRepresentation ℂ (Heisenberg.bilinearFactorSet (halfPairing B)).Extension H)
    (hcont : ∀ ξ : H, Continuous (fun g => ρ g ξ))
    (hunitary : ∀ g (ξ : H), ‖ρ g ξ‖ = ‖ξ‖)
    (hcentral : ∀ (t : ℝ) (ξ : H),
      ρ ((Heisenberg.bilinearFactorSet (halfPairing B)).inl (ofAdd t)) ξ =
        (ψ (ofAdd t) : ℂ) • ξ) :
    ∃ (I : Type u) (U : H ≃ₗᵢ[ℂ] lp (fun _ : I => Lp ℂ 2 μ) 2),
      ∀ (g : (Heisenberg.bilinearFactorSet (halfPairing B)).Extension) (ξ : H) (i : I),
        ∀ᵐ u ∂μ, U (ρ g ξ) i u =
          (ψ (ofAdd (g.left.toAdd + B u g.right.toAdd.2 +
            B g.right.toAdd.1 g.right.toAdd.2 / 2)) : ℂ) *
              U ξ i (u + g.right.toAdd.1) := by
  sorry

end StoneVonNeumann

namespace GenusTwo

open Matrix

/-- `e(z) = exp(2πiz)`. -/
noncomputable def expTwoPi (z : ℂ) : ℂ := Complex.exp (2 * Real.pi * Complex.I * z)

/-- `Z[w] = wᵀ Z w`. -/
def quad (Z : Matrix (Fin 2) (Fin 2) ℂ) (w : Fin 2 → ℂ) : ℂ := w ⬝ᵥ (Z *ᵥ w)

/-- The Siegel upper half-space of degree two (8.10): symmetric complex `Z` with positive-definite
imaginary part. -/
abbrev SiegelSpace : Type :=
  {Z : Matrix (Fin 2) (Fin 2) ℂ // Zᵀ = Z ∧ (Z.map Complex.im).PosDef}

/-- The genus-two theta series `θᵃ_ν(Z, W) = Σ_{R ≡ ν mod 2a} e(Z[R]/(4a) + RᵀW)` (8.18). -/
noncomputable def genusTwoTheta (a : ℕ) (ν : Fin 2 → ℤ) (Z : Matrix (Fin 2) (Fin 2) ℂ)
    (W : Fin 2 → ℂ) : ℂ :=
  ∑' R : Fin 2 → ℤ, if ∀ i, Int.ModEq (2 * (a : ℤ)) (R i) (ν i) then
    expTwoPi (quad Z (fun i => (R i : ℂ)) / (4 * a) + (fun i => (R i : ℂ)) ⬝ᵥ W) else 0

/-- **Theta inversion** (8.24): for `a > 0` and `Z` in the Siegel space,
`θᵃ_ν(−Z⁻¹, Z⁻¹W) = e(a Z⁻¹[W]) √(−det Z)/(2a) Σ_{μ mod 2a} e(−νᵀμ/(2a)) θᵃ_μ(Z, W)`, with the
principal root, positive at `Z = iY`. -/
theorem theta_fourier_transform (a : ℕ) (ha : 0 < a) (Z : SiegelSpace) (W : Fin 2 → ℂ)
    (ν : Fin 2 → ℤ) :
    genusTwoTheta a ν (-Z.1⁻¹) (Z.1⁻¹ *ᵥ W) =
      expTwoPi (a * quad Z.1⁻¹ W) * (-Z.1.det) ^ (1 / 2 : ℂ) / (2 * a) *
        ∑ μ : Fin 2 → Fin (2 * a),
          expTwoPi (-(∑ i, (ν i : ℂ) * ((μ i : ℕ) : ℂ)) / (2 * a)) *
            genusTwoTheta a (fun i => ((μ i : ℕ) : ℤ)) Z.1 W := by
  sorry

end GenusTwo

end TauCetiRoadmap.MetaplecticAutomorphicForms
