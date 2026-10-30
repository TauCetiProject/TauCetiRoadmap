import Mathlib
import TauCeti.AlgebraicGeometry.Cohomology.Genus

/-!
# Mordell after Lawrence and Venkatesh: headline target statements

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These statements suggest Lean forms for headline milestones; discharging them
finishes neither a layer nor the roadmap.

The statements are the semilinear centralizer dimension bound (§0.4, LV20 Lemma 2.1), the
Jordan–Schönflies extension theorem (§5.2), S-unit finiteness (§6.10, LV20 Theorem 4.1), and
Mordell finiteness (§11.6, LV20 Theorem 5.4). The latter two specify the Lawrence–Venkatesh
proofs of the statements owned by DiophantineApproximationAndTranscendence §2.4 and
HeightsRationalPointsAndObstructions §§5.12, 6.4. They use native S-unit subgroups and
morphisms over `Spec K`; the native scheme genus requires finite-dimensional H¹(𝒪).

The other headline statements need interfaces absent from Mathlib `6b7abb3` and Tau Ceti
`a91d3aa`. Faltings's representation finiteness and friendly-place Hodge-weight identities
(§§1.2, 1.11, 1.13, 1.15) need continuous arithmetic representations with ramification,
purity, integral Frobenius polynomials and de Rham realizations. Frobenius-compatible
Gauss–Manin transport (§2.11), period-image density and finite preimages (§§3.18–3.19),
and the residue-disk and abelian-by-finite finiteness theorems (§§4.4–4.5, 7.9) need
polarized abelian schemes, their de Rham bundles, crystalline comparison and period maps.
The Hurwitz and Kodaira–Parshin constructions (§§8.7, 8.13), cover normal form (§9.11),
and point-pushing and Kodaira–Parshin monodromy theorems (§§10.9–10.10) need geometric
étale fundamental groups with peripheral inertia, relative Pryms, oriented surfaces,
mapping class groups and their lifted actions on primitive homology. The native fundamental
group and singular homology do not supply those actions. The symplectic generation and
Goursat results (§§0.21, 0.26) also need the algebraic subgroup and Zariski-closure interface
on arbitrary symplectic spaces. These results remain specified in the README.
-/

namespace TauCetiRoadmap.MordellLawrenceVenkatesh

section SemilinearCentralizer

variable (F : Type*) {E V : Type*} [Field F] [Field E] [Algebra F E]
  [AddCommGroup V] [Module E V] [Module F V] [IsScalarTower F E V]

/-- The centralizer `Z(φ)` of a `σ`-semilinear map `φ : V → V`: the `E`-linear endomorphisms of `V`
commuting with `φ`, as an `F`-subalgebra of `End_E(V)` for a subfield `F` of `E` fixed by `σ`.
README 0.3. -/
def semilinearCentralizer (σ : E →+* E) (hσ : ∀ a : F, σ (algebraMap F E a) = algebraMap F E a)
    (φ : V →ₛₗ[σ] V) : Subalgebra F (Module.End E V) where
  carrier := {f | ∀ v, f (φ v) = φ (f v)}
  mul_mem' := by
    intro f g hf hg v
    change f (g (φ v)) = φ (f (g v))
    rw [hg v, hf]
  add_mem' := by
    intro f g hf hg v
    change f (φ v) + g (φ v) = φ (f v + g v)
    rw [hf v, hg v, map_add]
  algebraMap_mem' := by
    intro a v
    simp only [Algebra.algebraMap_eq_smul_one, LinearMap.smul_apply, Module.End.one_apply]
    rw [← IsScalarTower.algebraMap_smul E a v, φ.map_smulₛₗ, hσ,
      IsScalarTower.algebraMap_smul]

/-- Dimension of the centralizer (Lawrence–Venkatesh, Lemma 2.1): if `σ` has finite order with
fixed field exactly `F` and `φ` is bijective, then `dim_F Z(φ) ≤ (dim_E V)²`. README 0.4. -/
theorem finrank_semilinearCentralizer_le [FiniteDimensional E V] (σ : E →+* E)
    (hσ : ∀ a : F, σ (algebraMap F E a) = algebraMap F E a)
    (hfix : ∀ x : E, σ x = x → x ∈ (algebraMap F E).range) (e : ℕ) (he : 0 < e)
    (hord : ∀ x : E, (σ ^ e) x = x) (φ : V →ₛₗ[σ] V) (hφ : Function.Bijective φ) :
    Module.finrank F (semilinearCentralizer F σ hσ φ) ≤ Module.finrank E V ^ 2 := by
  sorry

end SemilinearCentralizer

/-- Every homeomorphism between two embedded plane circles extends to the whole plane.
README 5.2; Gallier–Xu, Appendix E, Theorem E.1, p. 160. -/
theorem schoenflies_extension
    (c₁ c₂ : Circle → EuclideanSpace ℝ (Fin 2))
    (h₁ : Topology.IsEmbedding c₁) (h₂ : Topology.IsEmbedding c₂)
    (f : Set.range c₁ ≃ₜ Set.range c₂) :
    ∃ F : EuclideanSpace ℝ (Fin 2) ≃ₜ EuclideanSpace ℝ (Fin 2),
      ∀ x : Set.range c₁, F x = (f x : EuclideanSpace ℝ (Fin 2)) := by
  sorry

universe u

/-- The S-unit theorem by the Lawrence–Venkatesh method (README §6.10, LV20 Theorem 4.1):
there are finitely many solutions of `x + y = 1` in the S-unit subgroup of a number field. -/
theorem sUnitEquation_finite (K : Type u) [Field K] [NumberField K]
    (S : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers K))) :
    {xy : (Set.unit (R := NumberField.RingOfIntegers K) (↑S) K) ×
        (Set.unit (R := NumberField.RingOfIntegers K) (↑S) K) |
      ((xy.1 : Kˣ) : K) + ((xy.2 : Kˣ) : K) = 1}.Finite := by
  sorry

open CategoryTheory AlgebraicGeometry

/-- Mordell finiteness by the Lawrence–Venkatesh method (README §11.6, LV20 Theorem 5.4):
a smooth proper geometrically connected curve of genus at least two over a number field
has finitely many rational points. -/
theorem mordell_finite (K : Type u) [Field K] [NumberField K]
    (C : Scheme.{u}) [C.Over (Spec (.of K))]
    [Smooth (C ↘ Spec (.of K))] [IsProper (C ↘ Spec (.of K))]
    [GeometricallyConnected (C ↘ Spec (.of K))]
    [FiniteDimensional K (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology
      (TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial C).obj 1)]
    (hdim : topologicalKrullDim C = 1) (hg : 2 ≤ C.genus K) :
    Finite (Over.mk (𝟙 (Spec (.of K))) ⟶ Over.mk (C ↘ Spec (.of K))) := by
  sorry

end TauCetiRoadmap.MordellLawrenceVenkatesh
