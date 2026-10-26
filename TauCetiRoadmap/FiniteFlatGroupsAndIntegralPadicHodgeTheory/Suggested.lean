import Mathlib
import TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.FiniteLocallyFree
import TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.BaseChange
import TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.Constant

/-!
# Finite flat group schemes and integral p-adic Hodge theory: headline targets

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These statements suggest Lean forms for headline milestones; proving them
finishes neither a layer nor the roadmap. Every theorem below is a goal marked with `sorry`.

The statements are Raynaud's uniqueness and full faithfulness for finite flat models
(§R07.1.30), the global prime-order classification (§R07.1.35 and R07.G4), finite
Dieudonné classification (§R07.2.8), the odd-prime Fontaine–Laffaille finite-flat
classification (§R07.3.18), the all-prime finite-flat Kisin classification
(§§R07.4.22–R07.4.23), and Fontaine's different bound (§R07.6.5).
The module categories below are explicit Witt-vector and power-series modules with
semilinear operators; the group schemes are Tau Ceti's native affine carrier.

The Barsotti–Tate and truncated Barsotti–Tate carriers, formal Lie groups in arbitrary
dimension, Dieudonné crystals, crystalline and semistable period rings and their Galois
realizations are absent from the pins. Consequently Tate's Hodge–Tate and generic-fibre
theorems (§§R07.1.19, R07.1.22), the Barsotti–Tate and relative Dieudonné classifications
(§§R07.2.10, R07.2.27–R07.2.29), Fontaine–Laffaille realization and admissibility,
the crystalline-lattice comparisons (R07.3–R07.4), and Raynaud's
Tate-module determinant theorem (§R07.6.9) have no signatures here. The Robba ring and
its slope filtration, Raynaud's vector schemes and the Oort–Tate parameter group schemes,
marked admissible global models and their fppf extension categories, labelled Sen and
Weil–Deligne realizations, and finite-flat Galois self-extension spaces also require
substantial constructions. This excludes the global purity and dyadic amalgam theorems
(R07.G), residual-type and Serre-weight Hecke theorems (R07.5), Illusie's group-scheme
obstruction theorem and the flat tangent-space and cyclotomic-image theorems (R07.6).
General perfect-residue upper numbering is absent; the ramification statement here uses
Mathlib's different ideal on a finite splitting extension instead.
-/

noncomputable section

open CategoryTheory Opposite

universe u

namespace TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory

namespace FiniteFlat

open TauCeti

/-- Finite locally free commutative group schemes over `Spec R`. -/
abbrev FLF (R : Type u) [CommRing R] :=
  FiniteLocallyFreeCommAffineGroupSchemeCat (CommRingCat.of R)

/-- The coordinate Hopf algebra. -/
abbrev coord {R : Type u} [CommRing R] (G : FLF R) :=
  FiniteLocallyFreeCommAffineGroupSchemeCat.coordinateHopfAlgebra R G

/-- The order over a local base, or over `ℤ`, where the coordinate algebra is free. -/
def rank {R : Type u} [CommRing R] (G : FLF R) : ℕ := Module.finrank R (coord G)

/-- Étaleness of the coordinate algebra. -/
def IsEtale {R : Type u} [CommRing R] (G : FLF R) : Prop := Algebra.Etale R (coord G)

/-- Finite commutative groups of `p`-power order; used over connected bases. -/
abbrev PGroup (p : ℕ) (R : Type u) [CommRing R] :=
  ObjectProperty.FullSubcategory (fun G : FLF R => ∃ n : ℕ, rank G = p ^ n)

/-- Generic fibre along the specified scalar extension. -/
def genericFibre {R : Type u} [CommRing R] (K : Type u) [Field K] [Algebra R K]
    (G : FLF R) : FLF K :=
  (FiniteLocallyFreeCommAffineGroupSchemeCat.baseChangeFunctor R K).obj G

/-- A model with its specified generic-fibre identification. -/
structure Prolongation {R : Type u} [CommRing R] (K : Type u) [Field K] [Algebra R K]
    (G : FLF K) where
  model : FLF R
  iso : genericFibre K model ≅ G

/-- The absolute ramification index in mixed characteristic `(0,p)`. -/
def absRamificationIndex (R : Type u) [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    (p : ℕ) : ℕ :=
  (IsDiscreteValuationRing.addVal R (p : R)).toNat

section Raynaud

variable {R : Type u} [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
  (K : Type u) [Field K] [Algebra R K] [IsFractionRing R K] [CharZero K]
  (p : ℕ) [Fact p.Prime] [CharP (IsLocalRing.ResidueField R) p]

/-- Raynaud, Théorème 3.3.3 (§R07.1.30): the generic identity extends to a unique
isomorphism of models when `e < p − 1`, without a completeness or residue-finiteness hypothesis. -/
theorem prolongation_unique_of_lt (he : absRamificationIndex R p < p - 1) (G : FLF K)
    (hG : ∃ n : ℕ, rank G = p ^ n) (𝓖 𝓖' : Prolongation (R := R) K G) :
    ∃! e : 𝓖.model ≅ 𝓖'.model,
      (FiniteLocallyFreeCommAffineGroupSchemeCat.baseChangeFunctor R K).map e.hom ≫
        𝓖'.iso.hom = 𝓖.iso.hom := by
  sorry

/-- Raynaud, Corollaire 3.3.6 (§R07.1.30): every generic homomorphism of finite flat
`p`-groups extends uniquely when `e < p − 1`. -/
theorem genericFibre_map_bijective (he : absRamificationIndex R p < p - 1) (𝓖 𝓗 : FLF R)
    (h𝓖 : ∃ n : ℕ, rank 𝓖 = p ^ n) (h𝓗 : ∃ n : ℕ, rank 𝓗 = p ^ n) :
    Function.Bijective
      ((FiniteLocallyFreeCommAffineGroupSchemeCat.baseChangeFunctor R K).map (X := 𝓖) (Y := 𝓗)) := by
  sorry

end Raynaud

/-- Oort–Tate, corollary to Theorem 3 (§R07.1.35, R07.G4): every prime-order
finite flat commutative group over `ℤ` is constant or a group of roots of unity. -/
theorem globalPrimeOrderClassification (p : ℕ) [Fact p.Prime] (G : FLF ℤ)
    (hG : rank G = p) :
    Nonempty (G ≅ ConstantGroup.finiteLocallyFreeGroupScheme ℤ (Multiplicative (ZMod p))) ∨
      Nonempty (G ≅ DiagonalizableGroup.finiteLocallyFreeGroupScheme ℤ
        (FGCommGrpCat.of (Multiplicative (ZMod p)))) := by
  sorry

end FiniteFlat

namespace Dieudonne

open FiniteFlat

variable (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p] [PerfectRing k p]

/-- A Dieudonné module over `k`: a `W(k)`-module with a `σ`-linear `F`, a `σ⁻¹`-linear `V` and
`F V = V F = p`; equivalently a left module over the Dieudonné ring `W(k)[F, V]`. -/
structure DieudonneModule where
  /-- The underlying `W(k)`-module. -/
  M : Type u
  [addCommGroup : AddCommGroup M]
  [module : Module (WittVector p k) M]
  /-- The Frobenius, `σ`-linear. -/
  F : M →+ M
  /-- The Verschiebung, `σ⁻¹`-linear. -/
  V : M →+ M
  F_smul : ∀ (a : WittVector p k) (x : M), F (a • x) = WittVector.frobenius a • F x
  V_smul : ∀ (a : WittVector p k) (x : M), V (WittVector.frobenius a • x) = a • V x
  F_V : ∀ x, F (V x) = (p : WittVector p k) • x
  V_F : ∀ x, V (F x) = (p : WittVector p k) • x

attribute [instance] DieudonneModule.addCommGroup DieudonneModule.module

namespace DieudonneModule

variable {p k}

/-- Morphisms of Dieudonné modules: `W(k)`-linear maps commuting with `F` and `V`. -/
@[ext]
structure Hom (M N : DieudonneModule p k) where
  /-- The underlying linear map. -/
  toLinearMap : M.M →ₗ[WittVector p k] N.M
  comm_F : ∀ x, toLinearMap (M.F x) = N.F (toLinearMap x)
  comm_V : ∀ x, toLinearMap (M.V x) = N.V (toLinearMap x)

instance : Category (DieudonneModule p k) where
  Hom := Hom
  id M := ⟨LinearMap.id, fun _ => rfl, fun _ => rfl⟩
  comp f g := ⟨g.toLinearMap.comp f.toLinearMap, fun x => by simp [f.comm_F, g.comm_F],
    fun x => by simp [f.comm_V, g.comm_V]⟩

end DieudonneModule

/-- Pink, Theorem 28.3 (§R07.2.8): finite commutative `p`-groups over any perfect
field are contravariantly classified by finite-length Dieudonné modules. -/
theorem dieudonneEquivalenceFinite :
    ∃ Mfun : (PGroup p k)ᵒᵖ ⥤ DieudonneModule p k,
      Mfun.Full ∧ Mfun.Faithful ∧
      (∀ (G : PGroup p k) (n : ℕ), rank G.obj = p ^ n →
        Module.length (WittVector p k) (Mfun.obj (op G)).M = n) ∧
      (∀ G : PGroup p k, IsEtale G.obj ↔ Function.Bijective (Mfun.obj (op G)).F) ∧
      (∀ M : DieudonneModule p k, Module.length (WittVector p k) M.M < ⊤ →
        ∃ G : PGroup p k, Nonempty (Mfun.obj (op G) ≅ M)) := by
  sorry

end Dieudonne

namespace FontaineLaffaille

open FiniteFlat

variable (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p] [PerfectRing k p]

/-- A Fontaine–Laffaille filtered module over `W(k)`: a decreasing filtration indexed by `ℤ` with
`σ`-semilinear `φ^i : Fil^i → M` and `φ^i = p φ^{i+1}` on `Fil^{i+1}`. Realization on a
small-width interval `[a,b]` uses `U_[a,b](M) = U_S(M(-a))(a)`, with raw `U_S` applied in the
effective range; the covariant realization is its integral or torsion Pontryagin dual. -/
structure FLModule where
  /-- The underlying `W(k)`-module. -/
  M : Type u
  [addCommGroup : AddCommGroup M]
  [module : Module (WittVector p k) M]
  /-- The filtration. -/
  fil : ℤ → Submodule (WittVector p k) M
  fil_antitone : Antitone fil
  fil_exhaustive : ∃ a, fil a = ⊤
  fil_separated : ∃ b, fil b = ⊥
  /-- The divided Frobenii. -/
  phi : ∀ i, fil i →ₛₗ[(WittVector.frobenius : WittVector p k →+* WittVector p k)] M
  phi_succ : ∀ (i : ℤ) (x : fil (i + 1)),
    phi i ⟨x, fil_antitone (by omega : i ≤ i + 1) x.2⟩ = (p : WittVector p k) • phi (i + 1) x

attribute [instance] FLModule.addCommGroup FLModule.module

variable {p k}

/-- `M ∈ MF_tor`: finite length and `Σ φ^i(Fil^i) = M`. -/
def FLModule.IsTorsion (M : FLModule p k) : Prop :=
  Module.length (WittVector p k) M.M < ⊤ ∧
    (⨆ i, AddMonoidHom.range (M.phi i).toAddMonoidHom) = (⊤ : AddSubgroup M.M)

/-- `M ∈ MF_tor^{[a,b]}`: finite-length generating objects with filtration support `[a,b]`,
so `Fil^a = M` and `Fil^{b+1} = 0`. In the small-width comparison the translated realization
`U_[a,b](M) = U_S(M(-a))(a)` uses interval `[a,b]`, and the covariant realization uses
`[-b,-a]`, with `HT(χ_p) = +1`. -/
def FLModule.IsTorsionIn (M : FLModule p k) (a b : ℤ) : Prop :=
  M.IsTorsion ∧ M.fil a = ⊤ ∧ M.fil (b + 1) = ⊥

/-- Morphisms of Fontaine–Laffaille modules: linear maps preserving the filtration and commuting
with every `φ^i`. -/
@[ext]
structure FLModule.Hom (M N : FLModule p k) where
  /-- The underlying linear map. -/
  toLinearMap : M.M →ₗ[WittVector p k] N.M
  map_fil : ∀ i, (M.fil i).map toLinearMap ≤ N.fil i
  comm_phi : ∀ i (x : M.fil i), toLinearMap (M.phi i x) =
    N.phi i ⟨toLinearMap x, map_fil i ⟨x, x.2, rfl⟩⟩

instance : Category (FLModule p k) where
  Hom := FLModule.Hom
  id M := ⟨LinearMap.id, fun _ => by simp, fun _ _ => rfl⟩
  comp f g := ⟨g.toLinearMap.comp f.toLinearMap,
    fun i => by
      intro y hy
      obtain ⟨x, hx, rfl⟩ := hy
      exact g.map_fil i (Submodule.mem_map_of_mem (f.map_fil i (Submodule.mem_map_of_mem hx))),
    fun i x => by
      change g.toLinearMap (f.toLinearMap _) = _
      rw [f.comm_phi, g.comm_phi]
      rfl⟩

variable (p k)

/-- Finite-length generating objects with filtration support `[0,1]`. -/
abbrev FLTorsion := ObjectProperty.FullSubcategory (fun M : FLModule p k => M.IsTorsionIn 0 1)

/-- Fontaine–Laffaille, §9 (§R07.3.18): finite flat `p`-groups over `W(k)` are
contravariantly classified by filtered modules of weights `[0,1]` when `p > 2`. -/
theorem flFiniteFlatDictionary (hp : 2 < p) :
    Nonempty ((PGroup p (WittVector p k))ᵒᵖ ≌ FLTorsion p k) := by
  sorry

end FontaineLaffaille

namespace BreuilKisin

open FiniteFlat

variable (p : ℕ) [hp : Fact p.Prime] (k : Type u) [Field k] [CharP k p] [PerfectRing k p]

/-- The Kisin coefficient ring `W(k)⟦u⟧`. -/
abbrev Sfrak := PowerSeries (WittVector p k)

/-- Witt Frobenius on coefficients and `u ↦ u^p`. -/
def frob : Sfrak p k →+* Sfrak p k :=
  (PowerSeries.expand p hp.out.ne_zero).toRingHom.comp (PowerSeries.map WittVector.frobenius)

/-- A finite `p`-power-torsion Kisin module of height at most one.
The injectivity of `u` is the finite-resolution condition of §R07.4.2. -/
structure TorsionKisinModule (E : Polynomial (WittVector p k)) where
  M : Type u
  [addCommGroup : AddCommGroup M]
  [module : Module (Sfrak p k) M]
  [finite : Module.Finite (Sfrak p k) M]
  killed : ∃ n : ℕ, ∀ x : M, (p : Sfrak p k) ^ n • x = 0
  u_injective : Function.Injective (fun x : M => (PowerSeries.X : Sfrak p k) • x)
  phi : M →ₛₗ[frob p k] M
  height_one : ∀ x : M, (E : Sfrak p k) • x ∈ Submodule.span (Sfrak p k) (Set.range phi)

attribute [instance] TorsionKisinModule.addCommGroup TorsionKisinModule.module
  TorsionKisinModule.finite

variable {p k}

/-- Kisin morphisms are linear maps commuting with Frobenius. -/
@[ext]
structure TorsionKisinModule.Hom {E : Polynomial (WittVector p k)}
    (M N : TorsionKisinModule p k E) where
  toLinearMap : M.M →ₗ[Sfrak p k] N.M
  comm : ∀ x, toLinearMap (M.phi x) = N.phi (toLinearMap x)

instance {E : Polynomial (WittVector p k)} : Category (TorsionKisinModule p k E) where
  Hom := TorsionKisinModule.Hom
  id M := ⟨LinearMap.id, fun _ => rfl⟩
  comp f g := ⟨g.toLinearMap.comp f.toLinearMap, fun x => by simp [f.comm, g.comm]⟩

variable (p k)

/-- Kisin, Theorem 2.3.5, and Kim, Corollary 4.3 (§§R07.4.22–R07.4.23): the
finite-flat classification at every prime. The algebra presentation identifies `R`
with the integers in the totally ramified extension defined by `E`. -/
theorem finiteFlatClassification (E : Polynomial (WittVector p k)) (hmonic : E.Monic)
    (hdegree : 0 < E.natDegree)
    (hE : E.IsEisensteinAt (Ideal.span {(p : WittVector p k)}))
    (R : Type u) [CommRing R] [Algebra (WittVector p k) R]
    (eR : AdjoinRoot E ≃ₐ[WittVector p k] R) :
    Nonempty ((PGroup p R)ᵒᵖ ≌ TorsionKisinModule p k E) := by
  sorry

end BreuilKisin

namespace FiniteFlat

/-- Multiplication by `m` is zero: on coordinates its pullback is the `m`th
convolution power of the identity, equal to the counit followed by the unit. -/
def KilledBy {R : Type u} [CommRing R] (G : FLF R) (m : ℕ) : Prop :=
  WithConv.toConv (AlgHom.id R (coord G)) ^ m = 1

/-- Fontaine, Théorème 1 (§R07.6.5): the normalized different of the field generated
by finite flat `p^n`-torsion is less than `e(n + 1/(p−1))`.
Here `S` is the integral closure in `L`; its different has normalized valuation
`length_R(S / differentIdeal R S) / [L:K]`. The hypotheses allow every perfect residue field. -/
theorem fontaineRamificationBound
    (R : Type u) [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) R]
    (p : ℕ) [Fact p.Prime] [CharP (IsLocalRing.ResidueField R) p]
    [PerfectRing (IsLocalRing.ResidueField R) p]
    (K : Type u) [Field K] [CharZero K] [Algebra R K] [IsFractionRing R K]
    (L : Type u) [Field L] [Algebra K L] [Module.Finite K L] [IsGalois K L]
    [Algebra R L] [IsScalarTower R K L]
    (S : Type u) [CommRing S] [IsDomain S] [IsDiscreteValuationRing S]
    [Algebra R S] [Algebra S L] [IsScalarTower R S L] [IsIntegralClosure S R L]
    [Module.Finite R S] [Module.IsTorsionFree R S]
    (G : FLF R) (n : ℕ) (hn : 1 ≤ n) (hG : KilledBy G (p ^ n))
    (hL : Algebra.adjoin K (⋃ x : coord G →ₐ[R] L, Set.range x) = ⊤) :
    ((Module.length R (S ⧸ differentIdeal R S)).toNat : ℝ) / (Module.finrank K L : ℝ) <
      (absRamificationIndex R p : ℝ) * ((n : ℝ) + 1 / ((p : ℝ) - 1)) := by
  sorry

end FiniteFlat

end TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory
