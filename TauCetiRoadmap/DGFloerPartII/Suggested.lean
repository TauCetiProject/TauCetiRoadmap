module

public import Mathlib
public import TauCeti.AlgebraicTopology.EilenbergMacLane.Basic
public import TauCeti.AlgebraicTopology.Singular.LocalHomology.FundamentalClass
public import TauCeti.Geometry.Diffeomorphism.Topology
public import TauCeti.Geometry.Manifold.Instances.ComplexProjectiveSpace
public import TauCeti.Geometry.Manifold.Instances.QuaternionicProjectiveSpace
public import TauCeti.Geometry.Manifold.IsManifold.RestrictScalars
public import TauCeti.Geometry.Manifold.SmoothEmbedding.NormalSpace.Topology
public import TauCeti.Geometry.Symplectic.Capacity.HoferZehnder
public import TauCeti.Geometry.Symplectic.Cotangent.Bundle.Codisc
public import TauCeti.Geometry.Symplectic.Cotangent.Bundle.Liouville
public import TauCeti.Geometry.Symplectic.Hamiltonian.AlmostExistence
public import TauCeti.Topology.Homotopy.HomotopyGroup.Map

/-!
# DG Floer theory, Part II: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`.

Stated here:

* the convenient category of README 1.0 on Mathlib's carriers: the inclusion of
  `CompactlyGenerated` into topological spaces is a left adjoint, through Mathlib's coreflection
  `GeneratedByTopCat.adj` for the family of compact Hausdorff spaces of `CompHaus`; and the
  product of a compactly generated space with a locally compact Hausdorff space is compactly
  generated;
* Theorem B in its general form, Theorem 5.14 of the source (README 3.2), on the carriers of the
  base roadmap's Theorem A: `TauCeti.CotangentBundle.symplecticForm`,
  `TauCeti.SmoothTwoForm.HasContractibleAlmostExistence`, and Mathlib's singular homology for the
  map `H_n(U; ℤ) → H_n(Q; ℤ)`;
* the finiteness `c°_HZ(D*Q) < ∞` of Theorem I (README 4.5), for every smooth Riemannian metric,
  on `TauCeti.SmoothTwoForm.contractibleHZCapacity` and `TauCeti.CotangentBundle.codiscBundle`:
  for the spheres `Sⁿ`, `n ≥ 2`; for the closed connected oriented manifolds that are
  `ℓ`-covered by diffeomorphisms, on Tau Ceti's `C^∞` topology
  `Diffeomorph.weakWhitneyTopology`, under the homotopy hypothesis of Propositions 6.29 and 6.33;
  for the compact connected Lie groups that are not aspherical; and for the complex and
  quaternionic projective spaces `TauCeti.ComplexProjectiveSpace` and
  `TauCeti.QuaternionicProjectiveSpace`, the quotients of unit spheres by the unit complex numbers
  and the unit quaternions;
* on the carrier `SO n = Matrix.specialOrthogonalGroup (Fin n) ℝ` with the subtype topology of
  the matrix space and Mathlib's cubical homotopy groups `π_ n X x`: the finite-to-stable range of
  the block inclusion `SO(n) → SO(n+1)` (README 4.2a), through Tau Ceti's induced map
  `HomotopyGroup.map`; real Bott periodicity and the stable homotopy groups of `SO` (README 4.2c),
  in the finite ranks where `π_i(SO(n))` is already stable; and the torsion group
  `π_(n−1)(SO(n))` of Lemma 6.35 (README 4.3), with its seven low-rank values and the torsion
  statement for every odd `n ≥ 3`;
* Theorem G, Theorem 7.1 of the source (README 4.6), on the carriers of Theorem B, with the
  embedded sphere and the transverse submanifold given by Tau Ceti's `TauCeti.SmoothEmbedding`,
  transversality by their tangent ranges `TauCeti.SmoothEmbedding.tangentRange`, and the
  triviality of the normal bundle by a linear Mathlib `Bundle.Trivialization` over the whole
  submanifold of Tau Ceti's intrinsic normal bundle `TauCeti.SmoothEmbedding.NormalSpace`.

Not statable at the pins, and stated in the README only:

* Theorem H and the abundance conclusions of Propositions 6.13, 6.15, 6.29, 6.31, 6.33, 6.34,
  6.36, 6.38 and 6.39 (README 4.1–4.5): abundance with 2-spheres needs classes of
  `H_*(Map(S², Q))` living over the fundamental class, that is the shriek map
  `H_*(Map(S², Q)) → H_(*−n)(Ω²Q)` of the evaluation fibration, which neither library has.
* Theorem I for fibered families of 2-spheres, for sphere bundles over highly connected bases and
  for products with an abundant factor (README 4.2, 4.5): their hypotheses are a map of fibre
  bundles into the evaluation fibration `Map(S², Q) → Q` with a nonzero fibre class, or abundance
  itself, and neither library has that fibration. The homogeneous spaces of Proposition 6.36
  (README 4.4) need the smooth structure of `G/H` for a closed subgroup `H`, absent at the pins.
* The stable orthogonal group `O` of README 4.2a, a colimit of the `O(r)` in compactly generated
  spaces, has no named carrier at the pins, so neither its Bott equivalences (README 4.2c) nor the
  stable-plus-Stiefel splitting `π_(n−1)(SO(n)) ≅ π_(n−1)(O) ⊕ π_n(V_(n+2,2)(ℝ))` behind
  Lemma 6.35 for `n ≥ 17` (README 4.3) is stated here. The Clifford chain and the index bounds of
  README 4.2b–4.2c need the energy on its path spaces, which neither library has.
-/

@[expose] public section

namespace TauCetiRoadmap.DGFloerPartII

open TauCeti AlgebraicTopology Bundle CategoryTheory
open scoped Manifold Topology ContDiff Quaternion

universe u w

/-! ## Layer 1: compactly generated spaces -/

/-- Compact generation is right adjoint to the inclusion of compactly generated spaces into
topological spaces, for all universes: Mathlib's coreflection `GeneratedByTopCat.adj` for the
family of compact Hausdorff spaces, transported along the equality of the two full subcategories
of `TopCat.{w}` (README 1.0). A space is generated by the spaces of `CompHaus.{u}` exactly when it
is `u`-compactly generated, both conditions saying that its topology is coinduced by all
continuous maps from those spaces. -/
theorem compactlyGeneratedToTop_isLeftAdjoint :
    (CompactlyGenerated.compactlyGeneratedToTop.{u, w}).IsLeftAdjoint :=
  sorry

/-- The product of a compactly generated space with a locally compact Hausdorff space is
compactly generated, so it is the convenient product (README 1.0; Strickland, *The category of
CGWH spaces*, Proposition 2.6). The Hausdorff hypothesis is needed: with `X` a point the
statement says that the locally compact factor is itself compactly generated, which Mathlib
proves for Hausdorff spaces. -/
theorem compactlyGeneratedSpace_prod {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    [CompactlyGeneratedSpace X] [LocallyCompactSpace Y] [T2Space Y] :
    CompactlyGeneratedSpace (X × Y) :=
  sorry

/-! ## Layer 3: multiple realization and Theorem B -/

/-- **Theorem B of the source, in its general form Theorem 5.14** (README 3.2). Let `Q` be a
closed connected `n`-manifold such that either `π₂(Q) ≠ 0` or some `π_ℓ(Q)`, `ℓ ≥ 3`, is not a
torsion group. Let `F : T*Q → ℝ` be smooth with compact sublevel sets and `c` a regular value of
`F`, so that the hypersurface `F⁻¹(c)` bounds the relatively compact domain `U = {F < c}`, and
assume that the projection `U → Q` induces a nonzero map `H_n(U; ℤ) → H_n(Q; ℤ)` on singular
homology. Then `F⁻¹(c)` has the contractible almost existence property for the canonical
symplectic form. The source's orientability of `Q` follows from the hypothesis on `U`, since
`H_n(Q; ℤ) = 0` for a closed connected nonorientable `Q`. The proof realizes a multiple of a
class of `H_n(U; ℤ)` by a closed oriented manifold (Thom) and applies the base roadmap's
Theorem 5.10. -/
theorem hasContractibleAlmostExistence_of_map_singularHomology_ne_zero {E Q : Type}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E] [TopologicalSpace Q]
    [T2Space Q] [ChartedSpace E Q] [IsManifold 𝓘(ℝ, E) ∞ Q] [CompactSpace Q] [ConnectedSpace Q]
    (q : Q) (hQ : Nontrivial (π_ 2 Q q) ∨ ∃ ℓ : ℕ, ¬ IsMulTorsion (π_ (ℓ + 3) Q q))
    (F : CotangentBundle 𝓘(ℝ, E) Q → ℝ)
    (hF : ContMDiff (𝓘(ℝ, E).prod 𝓘(ℝ, E →L[ℝ] ℝ)) 𝓘(ℝ) ∞ F)
    (hFc : ∀ b : ℝ, IsCompact (F ⁻¹' Set.Iic b)) {c : ℝ}
    (hc : IsRegularValue (𝓘(ℝ, E).prod 𝓘(ℝ, E →L[ℝ] ℝ)) 𝓘(ℝ) F c)
    (hU : ((singularHomologyFunctor (ModuleCat.{0} ℤ) (Module.finrank ℝ E)).obj
        (ModuleCat.of ℤ (ULift.{0} ℤ))).map (TopCat.ofHom
          ((⟨Bundle.TotalSpace.proj, FiberBundle.continuous_proj _ _⟩ :
            C(CotangentBundle 𝓘(ℝ, E) Q, Q)).restrict {z | F z < c})) ≠ 0) :
    (CotangentBundle.symplecticForm 𝓘(ℝ, E) Q).HasContractibleAlmostExistence Set.univ F c :=
  sorry

/-! ## Layer 4: manifolds abundant with 2-spheres -/

/-- **Theorem I for spheres** (README 4.5; Examples 6.16 and 6.20 and Proposition 6.34 with
Theorem H). For every smooth Riemannian metric on the unit sphere `Sⁿ ⊂ ℝⁿ⁺¹`, `n ≥ 2`, the unit
codisc bundle `D*Sⁿ` has finite `π₁`-sensitive Hofer–Zehnder capacity. The circle is excluded:
`S¹` is a torus and `c°_HZ(D*S¹) = ∞`. -/
theorem contractibleHZCapacity_codiscBundle_sphere_lt_top (n : ℕ) (hn : 2 ≤ n)
    [RiemannianBundle (fun x : Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1 ↦
      TangentSpace (𝓡 n) x)]
    [IsContMDiffRiemannianBundle (𝓡 n) ∞ (EuclideanSpace ℝ (Fin n))
      (fun x : Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1 ↦ TangentSpace (𝓡 n) x)] :
    (CotangentBundle.symplecticForm (𝓡 n)
        (Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1)).contractibleHZCapacity
      (CotangentBundle.codiscBundle (𝓡 n)
        (Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1)) < ⊤ :=
  sorry

/-- **Theorem I for compact Lie groups** (README 4.5; Proposition 6.31 with Theorem H). For a
compact connected Lie group `G` that is not aspherical, equivalently not a torus (the base
roadmap's torus criterion), and every smooth Riemannian metric on `G`, invariant or not, the unit
codisc bundle `D*G` has finite `π₁`-sensitive Hofer–Zehnder capacity. -/
theorem contractibleHZCapacity_codiscBundle_lieGroup_lt_top {E G : Type} [NormedAddCommGroup E]
    [NormedSpace ℝ E] [FiniteDimensional ℝ E] [TopologicalSpace G] [ChartedSpace E G] [Group G]
    [LieGroup 𝓘(ℝ, E) ∞ G] [CompactSpace G] [ConnectedSpace G]
    [RiemannianBundle (fun x : G ↦ TangentSpace 𝓘(ℝ, E) x)]
    [IsContMDiffRiemannianBundle 𝓘(ℝ, E) ∞ E (fun x : G ↦ TangentSpace 𝓘(ℝ, E) x)]
    (hG : ¬ IsAspherical G 1) :
    (CotangentBundle.symplecticForm 𝓘(ℝ, E) G).contractibleHZCapacity
      (CotangentBundle.codiscBundle 𝓘(ℝ, E) G) < ⊤ :=
  sorry

open scoped TauCeti.DiffeomorphWeakWhitney in
/-- **Theorem I for manifolds covered by diffeomorphisms** (README 4.5; Propositions 6.29 and
6.33 with Theorem H). Let `M` be a closed connected oriented `n`-manifold with base point `x₀`, and
`ℓ > 0` such that `M` is `ℓ`-covered by diffeomorphisms: some class `A` of `H_n(Diff(M); ℤ)`, for
the `C^∞` topology on `Diff(M)`, has `ev_* A = ℓ • [M]` under evaluation at `x₀`. Assume that
`π₂(M) ≠ 0`, or that the first nontrivial `π_k(M)`, `k ≥ 2`, has an element not annihilated by
`ℓ`; for `ℓ = 1` this says exactly that `M` is not aspherical. Then for every smooth Riemannian
metric the unit codisc bundle `D*M` has finite `π₁`-sensitive Hofer–Zehnder capacity. -/
theorem contractibleHZCapacity_codiscBundle_lt_top_of_covered {E M : Type}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E] [TopologicalSpace M]
    [T2Space M] [ChartedSpace E M] [IsManifold 𝓘(ℝ, E) ∞ M] [CompactSpace M] [ConnectedSpace M]
    [RiemannianBundle (fun x : M ↦ TangentSpace 𝓘(ℝ, E) x)]
    [IsContMDiffRiemannianBundle 𝓘(ℝ, E) ∞ E (fun x : M ↦ TangentSpace 𝓘(ℝ, E) x)]
    (o : HomologicalOrientation M E (Module.finrank ℝ E)) (x₀ : M) {ℓ : ℕ} (hℓ : 0 < ℓ)
    (hcov : ∃ A, (((singularHomologyFunctor (ModuleCat.{0} ℤ) (Module.finrank ℝ E)).obj
        (ModuleCat.of ℤ (ULift.{0} ℤ))).map (TopCat.ofHom
          ⟨fun f : M ≃ₘ^∞⟮𝓘(ℝ, E), 𝓘(ℝ, E)⟯ M ↦ f x₀,
            Diffeomorph.continuous_eval_const x₀⟩)).hom A =
        (ℓ : ℤ) • o.mapFundamentalClass rfl (ContinuousMap.id M))
    (hM : Nontrivial (π_ 2 M x₀) ∨ ∃ k : ℕ, (∀ j < k, Subsingleton (π_ (j + 2) M x₀)) ∧
      ∃ x : π_ (k + 2) M x₀, x ^ ℓ ≠ 1) :
    (CotangentBundle.symplecticForm 𝓘(ℝ, E) M).contractibleHZCapacity
      (CotangentBundle.codiscBundle 𝓘(ℝ, E) M) < ⊤ :=
  sorry

/-- Complex projective space `CPᵈ` as a real smooth manifold: Tau Ceti's complex manifold
structure on `TauCeti.ComplexProjectiveSpace d`, the quotient of the unit sphere of `ℂᵈ⁺¹` by the
unit complex numbers, modelled on `𝓘(ℂ, Fin d → ℂ)` by the homogeneous-coordinate charts, with its
scalars restricted to `ℝ`. -/
instance instIsManifoldRealComplexProjectiveSpace (d : ℕ) :
    IsManifold 𝓘(ℝ, Fin d → ℂ) ∞ (ComplexProjectiveSpace d) :=
  IsManifold.restrictScalars ℝ
    (inferInstance : IsManifold 𝓘(ℂ, Fin d → ℂ) ∞ (ComplexProjectiveSpace d))

/-- **Theorem I for complex projective spaces** (README 4.5; Proposition 6.38 with Theorem H).
For every smooth Riemannian metric on `CPᵈ`, the unit codisc bundle `D*CPᵈ` has finite
`π₁`-sensitive Hofer–Zehnder capacity. For `d = 0` the space is a point, whose codisc bundle has
capacity `0`. -/
theorem contractibleHZCapacity_codiscBundle_complexProjectiveSpace_lt_top (d : ℕ)
    [RiemannianBundle (fun x : ComplexProjectiveSpace d ↦ TangentSpace 𝓘(ℝ, Fin d → ℂ) x)]
    [IsContMDiffRiemannianBundle 𝓘(ℝ, Fin d → ℂ) ∞ (Fin d → ℂ)
      (fun x : ComplexProjectiveSpace d ↦ TangentSpace 𝓘(ℝ, Fin d → ℂ) x)] :
    (CotangentBundle.symplecticForm 𝓘(ℝ, Fin d → ℂ)
        (ComplexProjectiveSpace d)).contractibleHZCapacity
      (CotangentBundle.codiscBundle 𝓘(ℝ, Fin d → ℂ) (ComplexProjectiveSpace d)) < ⊤ :=
  sorry

/-- **Theorem I for quaternionic projective spaces** (README 4.5; the quaternionic half of
Proposition 6.39 with Theorem H). For every smooth Riemannian metric on `HPᵈ`, the unit codisc
bundle `D*HPᵈ` has finite `π₁`-sensitive Hofer–Zehnder capacity. For `d = 0` the space is a
point, whose codisc bundle has capacity `0`. -/
theorem contractibleHZCapacity_codiscBundle_quaternionicProjectiveSpace_lt_top (d : ℕ)
    [RiemannianBundle (fun x : QuaternionicProjectiveSpace d ↦ TangentSpace 𝓘(ℝ, Fin d → ℍ) x)]
    [IsContMDiffRiemannianBundle 𝓘(ℝ, Fin d → ℍ) ∞ (Fin d → ℍ)
      (fun x : QuaternionicProjectiveSpace d ↦ TangentSpace 𝓘(ℝ, Fin d → ℍ) x)] :
    (CotangentBundle.symplecticForm 𝓘(ℝ, Fin d → ℍ)
        (QuaternionicProjectiveSpace d)).contractibleHZCapacity
      (CotangentBundle.codiscBundle 𝓘(ℝ, Fin d → ℍ) (QuaternionicProjectiveSpace d)) < ⊤ :=
  sorry

/-! ## Layer 4: stable orthogonal groups and real Bott periodicity -/

/-- `SO(n)`: the special orthogonal group of real `n × n` matrices, with the subspace topology of
the matrix space. -/
abbrev SO (n : ℕ) : Type := Matrix.specialOrthogonalGroup (Fin n) ℝ

/-- The block inclusion `A ↦ diag(A, 1)` of `SO(n)` into `SO(n+1)`, with the new coordinate last
(README 4.2a). -/
def soBlockInclusion (n : ℕ) : C(SO n, SO (n + 1)) where
  toFun A := ⟨Matrix.reindex finSumFinEquiv finSumFinEquiv
      (Matrix.fromBlocks (A : Matrix (Fin n) (Fin n) ℝ) 0 0 (1 : Matrix (Fin 1) (Fin 1) ℝ)), by
    obtain ⟨hO, hdet⟩ := Matrix.mem_specialOrthogonalGroup_iff.mp A.2
    refine Matrix.mem_specialOrthogonalGroup_iff.mpr ⟨?_, ?_⟩
    · rw [Matrix.mem_orthogonalGroup_iff] at hO ⊢
      simp only [Matrix.reindex_apply, Matrix.transpose_submatrix, Matrix.submatrix_mul_equiv,
        Matrix.fromBlocks_transpose, Matrix.fromBlocks_multiply]
      simp [hO]
    · rw [Matrix.det_reindex_self, Matrix.det_fromBlocks_zero₂₁]
      simp [hdet]⟩
  continuous_toFun := (Continuous.matrix_reindex (Continuous.matrix_fromBlocks
    continuous_subtype_val continuous_const continuous_const continuous_const) _ _).subtype_mk _

/-- The block inclusion is based: it sends the identity to the identity. -/
theorem soBlockInclusion_one (n : ℕ) : soBlockInclusion n 1 = 1 := by
  ext : 1
  simp [soBlockInclusion, Matrix.fromBlocks_one]

/-- The finite-to-stable range: the block inclusion `SO(n) → SO(n+1)` induces a bijection on
`π_i` for `i ≤ n − 2`, from the exact sequence of the fibration `SO(n) → SO(n+1) → Sⁿ`
(README 4.2a). In degree `0` this is a statement about path components. -/
theorem bijective_map_soBlockInclusion (n i : ℕ) (h : i + 2 ≤ n) :
    Function.Bijective
      (HomotopyGroup.map (N := Fin i) (soBlockInclusion n) (soBlockInclusion_one n)) :=
  sorry

/-- The block inclusion `SO(n) → SO(n+1)` induces a surjection on `π_i` for `i ≤ n − 1`
(README 4.2a). -/
theorem surjective_map_soBlockInclusion (n i : ℕ) (h : i + 1 ≤ n) :
    Function.Surjective
      (HomotopyGroup.map (N := Fin i) (soBlockInclusion n) (soBlockInclusion_one n)) :=
  sorry

/-- Real Bott periodicity in finite rank: for `i = j + 1 ≥ 1` and `m ≥ i + 10`, so that both
groups are stable, `π_(i+8)(SO(m)) ≅ π_i(SO(m))` (README 4.2c). -/
theorem nonempty_pi_add_eight_SO_mulEquiv (j m : ℕ) (hm : j + 11 ≤ m) :
    Nonempty (π_ (j + 9) (SO m) 1 ≃* π_ (j + 1) (SO m) 1) :=
  sorry

/-- `π_i(SO(m)) = 0` for `i ≡ 2, 4, 5, 6 (mod 8)` in the stable range `m ≥ i + 2`, with
`i = j + 1` (README 4.2c). -/
theorem subsingleton_pi_SO_of_stable (j m : ℕ)
    (hj : j % 8 = 1 ∨ j % 8 = 3 ∨ j % 8 = 4 ∨ j % 8 = 5) (hm : j + 3 ≤ m) :
    Subsingleton (π_ (j + 1) (SO m) 1) :=
  sorry

/-- `π_i(SO(m)) ≅ ℤ/2` for `i ≡ 0, 1 (mod 8)`, `i ≥ 1`, in the stable range `m ≥ i + 2`, with
`i = j + 1` (README 4.2c). -/
theorem nonempty_pi_SO_mulEquiv_zmod_two (j m : ℕ) (hj : j % 8 = 0 ∨ j % 8 = 7)
    (hm : j + 3 ≤ m) : Nonempty (π_ (j + 1) (SO m) 1 ≃* Multiplicative (ZMod 2)) :=
  sorry

/-- `π_i(SO(m)) ≅ ℤ` for `i ≡ 3, 7 (mod 8)` in the stable range `m ≥ i + 2`, with `i = j + 1`
(README 4.2c). -/
theorem nonempty_pi_SO_mulEquiv_int (j m : ℕ) (hj : j % 8 = 2 ∨ j % 8 = 6) (hm : j + 3 ≤ m) :
    Nonempty (π_ (j + 1) (SO m) 1 ≃* Multiplicative ℤ) :=
  sorry

/-! ## Layer 4: the torsion group `π_(n−1)(SO(n))` -/

/-- `π₂(SO(3)) = 0`, the first low-rank value of Lemma 6.35 (README 4.3), through the double
cover `S³ → SO(3)`. -/
theorem subsingleton_pi2_SO3 : Subsingleton (π_ 2 (SO 3) 1) := sorry

/-- `π₄(SO(5)) ≅ ℤ/2` (README 4.3). -/
theorem nonempty_pi4_SO5_mulEquiv : Nonempty (π_ 4 (SO 5) 1 ≃* Multiplicative (ZMod 2)) := sorry

/-- `π₆(SO(7)) = 0` (README 4.3). -/
theorem subsingleton_pi6_SO7 : Subsingleton (π_ 6 (SO 7) 1) := sorry

/-- `π₈(SO(9)) ≅ (ℤ/2)²`: the stabilization `π₈(SO(9)) → π₈(SO) = ℤ/2` is split with kernel
`ℤ/2` (Crowley–Schick–Steimle, proof of Lemma 2.2; README 4.3). -/
theorem nonempty_pi8_SO9_mulEquiv :
    Nonempty (π_ 8 (SO 9) 1 ≃* Multiplicative (ZMod 2 × ZMod 2)) := sorry

/-- `π₁₀(SO(11)) ≅ ℤ/2` (README 4.3). -/
theorem nonempty_pi10_SO11_mulEquiv :
    Nonempty (π_ 10 (SO 11) 1 ≃* Multiplicative (ZMod 2)) := sorry

/-- `π₁₂(SO(13)) ≅ ℤ/2` (README 4.3). -/
theorem nonempty_pi12_SO13_mulEquiv :
    Nonempty (π_ 12 (SO 13) 1 ≃* Multiplicative (ZMod 2)) := sorry

/-- `π₁₄(SO(15)) ≅ ℤ/2` (README 4.3). -/
theorem nonempty_pi14_SO15_mulEquiv :
    Nonempty (π_ 14 (SO 15) 1 ≃* Multiplicative (ZMod 2)) := sorry

/-- Lemma 6.35: for every odd `n ≥ 3`, written `n = k + 3`, the group `π_(n−1)(SO(n))` is torsion.
The stable-plus-Stiefel splitting `π_(n−1)(SO(n)) ≅ π_(n−1)(O) ⊕ π_n(V_(n+2,2)(ℝ))` behind it, for
`n ≥ 17`, needs the stable orthogonal group and the Stiefel carrier of the README and is stated
there (README 4.3). -/
theorem isOfFinOrder_pi_SO (k : ℕ) (hk : Odd (k + 3))
    (x : π_ (k + 2) (SO (k + 3)) 1) : IsOfFinOrder x := sorry

/-! ## Layer 4: knotted hypersurfaces -/

/-- **Theorem G of the source, Theorem 7.1** (README 4.6). Let `Q` be a closed orientable
`n`-manifold, `n = dim E`, containing an embedded sphere `X = s(Sᵏ)`, `k ≥ 2`, and a closed
orientable `(n − k)`-submanifold `Y = y(Y)` that meets `X` in the single point `s a = y b`,
transversely: the tangent spaces of `X` and `Y` there span the tangent space of `Q`. Assume that
`Y` is `ℓ`-connected, with `ℓ = 2k − 2` for even `k` and `ℓ = k − 1` for odd `k`, and that its
normal bundle is trivial. Let `S` be a closed oriented `(n − k)`-manifold and `φ : S → T*Q` a
continuous map into `π⁻¹(Y)`, with `π ∘ φ = y ∘ g` and `g : S → Y` of degree `d ≠ 0`. Then every
regular level `F⁻¹(c)` of a smooth `F : T*Q → ℝ` with compact sublevel sets whose domain
`U = {F < c}` contains `φ(S)` has the contractible almost existence property for the canonical
symplectic form. The proof produces a class `α` with `i_(Q*)α = 0` and `j_(Y!)α` not torsion from
the Pontryagin–Thom collapse onto the trivial normal disc bundle of `Y` (Proposition 7.5,
Lemmas 7.6 and 7.7) and applies the base roadmap's cotangent criterion. -/
theorem hasContractibleAlmostExistence_of_knottedSphere {E Q F' Y S : Type}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace Q] [T2Space Q] [ChartedSpace E Q] [IsManifold 𝓘(ℝ, E) ∞ Q] [CompactSpace Q]
    (oQ : HomologicalOrientation Q E (Module.finrank ℝ E)) (k : ℕ) (hk : 2 ≤ k)
    (s : SmoothEmbedding (𝓡 k) 𝓘(ℝ, E) ∞
      (Metric.sphere (0 : EuclideanSpace ℝ (Fin (k + 1))) 1) Q)
    [NormedAddCommGroup F'] [NormedSpace ℝ F'] [FiniteDimensional ℝ F']
    [TopologicalSpace Y] [T2Space Y] [ChartedSpace F' Y] [IsManifold 𝓘(ℝ, F') ∞ Y]
    [CompactSpace Y] (hdim : Module.finrank ℝ F' + k = Module.finrank ℝ E)
    (oY : HomologicalOrientation Y F' (Module.finrank ℝ F'))
    (y : SmoothEmbedding 𝓘(ℝ, F') 𝓘(ℝ, E) ∞ Y Q)
    (a : Metric.sphere (0 : EuclideanSpace ℝ (Fin (k + 1))) 1) (b : Y)
    (hab : Set.range s ∩ Set.range y = {y b}) (has : s a = y b)
    (htr : (s.tangentRange a (WithTop.coe_ne_zero.2 ENat.top_ne_zero) : Submodule ℝ E) ⊔
      (y.tangentRange b (WithTop.coe_ne_zero.2 ENat.top_ne_zero) : Submodule ℝ E) = ⊤)
    (hY : PathConnectedSpace Y ∧
      ∀ i : ℕ, i + 1 ≤ (if Even k then 2 * k - 2 else k - 1) → Subsingleton (π_ (i + 1) Y b))
    (htriv : ∃ e : Trivialization (EuclideanSpace ℝ (Fin k))
          (TotalSpace.proj : TotalSpace (EuclideanSpace ℝ (Fin k))
            (fun x ↦ y.NormalSpace x (WithTop.coe_ne_zero.2 ENat.top_ne_zero)) → Y),
        e.IsLinear ℝ ∧ e.baseSet = Set.univ)
    [TopologicalSpace S] [T2Space S] [ChartedSpace F' S] [IsManifold 𝓘(ℝ, F') ∞ S]
    [CompactSpace S] (oS : HomologicalOrientation S F' (Module.finrank ℝ F'))
    (φ : C(S, CotangentBundle 𝓘(ℝ, E) Q)) (g : C(S, Y)) (hφ : ∀ x, (φ x).proj = y (g x))
    {d : ℤ} (hd : d ≠ 0)
    (hdeg : (((singularHomologyFunctor (ModuleCat.{0} ℤ) (Module.finrank ℝ F')).obj
        (ModuleCat.of ℤ (ULift.{0} ℤ))).map (TopCat.ofHom g)).hom
          (oS.mapFundamentalClass rfl (ContinuousMap.id S)) =
        d • oY.mapFundamentalClass rfl (ContinuousMap.id Y))
    (F : CotangentBundle 𝓘(ℝ, E) Q → ℝ)
    (hF : ContMDiff (𝓘(ℝ, E).prod 𝓘(ℝ, E →L[ℝ] ℝ)) 𝓘(ℝ) ∞ F)
    (hFc : ∀ r : ℝ, IsCompact (F ⁻¹' Set.Iic r)) {c : ℝ}
    (hc : IsRegularValue (𝓘(ℝ, E).prod 𝓘(ℝ, E →L[ℝ] ℝ)) 𝓘(ℝ) F c)
    (hφU : ∀ x, F (φ x) < c) :
    (CotangentBundle.symplecticForm 𝓘(ℝ, E) Q).HasContractibleAlmostExistence Set.univ F c :=
  sorry

end TauCetiRoadmap.DGFloerPartII
