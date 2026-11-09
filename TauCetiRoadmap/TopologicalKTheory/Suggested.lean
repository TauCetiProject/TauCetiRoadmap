import Mathlib
import TauCeti.CategoryTheory.GrothendieckGroup.Split
import TauCeti.Topology.Grassmannian.Tautological
import TauCeti.Topology.VectorBundle.FiniteRank.Biproduct
import TauCeti.Topology.VectorBundle.FiniteRank.Pullback

/-!
# Topological K-theory of vector bundles: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems that are statable against the pinned Mathlib and Tau Ceti, each with `sorry`, on the
pinned carriers: the constant-rank bundle cores `TauCeti.FiniteRankBundleCore`, their pullbacks,
the finite Grassmannians `TauCeti.finiteGrassmannian` with the tautological bundle, and the split
Grothendieck group `TauCeti.SplitK0`. On a connected base every bundle has constant rank, so the
split K-group of the cores over a sphere of positive dimension is its K⁰, respectively KO⁰.

Stated here: homotopy invariance of bundles over paracompact Hausdorff bases (T1.4); every
bundle over a compact Hausdorff base is a pullback of a tautological bundle (T1.6a); the
complex K-groups of all spheres of positive dimension (T4.8); and the real K-groups of all
spheres of positive dimension, the additive form of real Bott periodicity (T7.0b).

Not statable at the pins, and therefore not stated here:
* complex Bott periodicity as the product isomorphism `K(X)⊕K(X)≃K(X×S²)` (T4) and the ring
  `K(S²)≃ℤ[β]/(β²)`: the external and tensor products on bundle cores are missing;
* the Thom isomorphism `K_c(X)≃K_c(E)` (T5.3): compactly supported K-theory and the Koszul
  class are missing;
* equivariant Thom and representation Bott `R(G)≃K_(G,c)(V)` (T6.7): the category of
  equivariant bundles and its K-group are missing;
* the KO coefficient ring `ℤ[η,a,b,b⁻¹]/(2η,η³,ηa,a²−4b)` (T7.1): the graded theory KO* and its
  products are missing;
* the representability `[X,BU×ℤ]≃K(X)` (T2.1) and numerable classification by `BO(n)`, `BU(n)`
  (T1.6a): the stable Grassmannian colimits `Gr_k∞(𝕜)`, `BO` and `BU` are missing;
* real Bott periodicity `O≃Ω⁸O` (T7.0b): the stable orthogonal group is missing.
-/

namespace TauCetiRoadmap.TopologicalKTheory

open CategoryTheory

/-! ## Layer 1: Continuous finite-rank bundles as a category -/

/-- **Homotopy invariance of vector bundles** (T1.4). For a paracompact Hausdorff base `X`,
pullbacks of a finite-rank real or complex bundle core along homotopic maps `f g : X → Y` are
isomorphic. Hatcher, *Vector Bundles and K-Theory*, Theorem 1.6 and Proposition 1.7. -/
theorem nonempty_pullback_iso_of_homotopic {𝕜 : Type*} [RCLike 𝕜] {X Y : Type*}
    [TopologicalSpace X] [TopologicalSpace Y] [ParacompactSpace X] [T2Space X]
    (A : TauCeti.FiniteRankBundleCore 𝕜 Y) {f g : C(X, Y)} (h : f.Homotopic g) :
    Nonempty (A.pullback f ≅ A.pullback g) := by
  sorry

/-- **Bundles over compact bases are pulled back from finite Grassmannians** (T1.6a). Every
finite-rank real or complex bundle core over a compact Hausdorff base is isomorphic to the
pullback of the tautological bundle of some finite Grassmannian of planes of its rank.
Hatcher, *Vector Bundles and K-Theory*, Proposition 1.4 and the proof of Theorem 1.16. -/
theorem exists_iso_pullback_tautological {𝕜 : Type*} [RCLike 𝕜] {X : Type*}
    [TopologicalSpace X] [CompactSpace X] [T2Space X] (A : TauCeti.FiniteRankBundleCore 𝕜 X) :
    ∃ (N : ℕ) (f : C(X, TauCeti.finiteGrassmannian 𝕜 A.rank N)),
      Nonempty (A ≅ (TauCeti.FiniteRankBundleCore.ofBundle 𝕜 A.rank
        (TauCeti.finiteGrassmannian.Tautological 𝕜 A.rank N)).pullback f) := by
  sorry

/-! ## Layer 4: Complex Bott periodicity without an index theorem -/

/-- **The complex K-group of an even sphere** (T4.8). For every `n`, `K⁰(S^(2n+2)) ≃ ℤ × ℤ`,
for the unit sphere of `ℝ^(2n+3)`. Hatcher, *Vector Bundles and K-Theory*, Corollary 2.12. -/
theorem nonempty_kZero_evenSphere_addEquiv (n : ℕ) :
    Nonempty (TauCeti.SplitK0.{0} (TauCeti.FiniteRankBundleCore ℂ
      (Metric.sphere (0 : EuclideanSpace ℝ (Fin (2 * n + 3))) 1)) ≃+ ℤ × ℤ) := by
  sorry

/-- **The complex K-group of an odd sphere** (T4.8). For every `n`, `K⁰(S^(2n+1)) ≃ ℤ`, for the
unit sphere of `ℝ^(2n+2)`. Hatcher, *Vector Bundles and K-Theory*, Corollary 2.12. -/
theorem nonempty_kZero_oddSphere_addEquiv (n : ℕ) :
    Nonempty (TauCeti.SplitK0.{0} (TauCeti.FiniteRankBundleCore ℂ
      (Metric.sphere (0 : EuclideanSpace ℝ (Fin (2 * n + 2))) 1)) ≃+ ℤ) := by
  sorry

/-! ## Layer 7: Real K-theory and concrete acceptance calculations -/

/-- **Real K-groups of spheres, dimensions divisible by four** (T7.0b). For `d > 0` with
`4 ∣ d`, `KO⁰(S^d) ≃ ℤ × ℤ`, for the unit sphere of `ℝ^(d+1)`: the reduced group `π_(d-1)(O)`
is `ℤ`. Hatcher, *Vector Bundles and K-Theory*, Introduction, table of `K̃O(Sⁿ)`. -/
theorem nonempty_kOZero_sphere_addEquiv_of_four_dvd {d : ℕ} (hd : 0 < d) (h4 : 4 ∣ d) :
    Nonempty (TauCeti.SplitK0.{0} (TauCeti.FiniteRankBundleCore ℝ
      (Metric.sphere (0 : EuclideanSpace ℝ (Fin (d + 1))) 1)) ≃+ ℤ × ℤ) := by
  sorry

/-- **Real K-groups of spheres, dimensions `1` and `2` mod `8`** (T7.0b). For `d ≡ 1, 2 (mod 8)`,
`KO⁰(S^d) ≃ ℤ × ℤ/2`, for the unit sphere of `ℝ^(d+1)`: the reduced group `π_(d-1)(O)` is
`ℤ/2`. Hatcher, *Vector Bundles and K-Theory*, Introduction, table of `K̃O(Sⁿ)`. -/
theorem nonempty_kOZero_sphere_addEquiv_of_mod_eight_one_two {d : ℕ}
    (h : d % 8 = 1 ∨ d % 8 = 2) :
    Nonempty (TauCeti.SplitK0.{0} (TauCeti.FiniteRankBundleCore ℝ
      (Metric.sphere (0 : EuclideanSpace ℝ (Fin (d + 1))) 1)) ≃+ ℤ × ZMod 2) := by
  sorry

/-- **Real K-groups of spheres, dimensions `3, 5, 6, 7` mod `8`** (T7.0b). For
`d ≡ 3, 5, 6, 7 (mod 8)`, `KO⁰(S^d) ≃ ℤ`, for the unit sphere of `ℝ^(d+1)`: every real bundle
over `S^d` is stably trivial. Hatcher, *Vector Bundles and K-Theory*, Introduction, table of
`K̃O(Sⁿ)`. -/
theorem nonempty_kOZero_sphere_addEquiv_of_mod_eight_three_five_six_seven {d : ℕ}
    (h : d % 8 = 3 ∨ d % 8 = 5 ∨ d % 8 = 6 ∨ d % 8 = 7) :
    Nonempty (TauCeti.SplitK0.{0} (TauCeti.FiniteRankBundleCore ℝ
      (Metric.sphere (0 : EuclideanSpace ℝ (Fin (d + 1))) 1)) ≃+ ℤ) := by
  sorry

end TauCetiRoadmap.TopologicalKTheory
