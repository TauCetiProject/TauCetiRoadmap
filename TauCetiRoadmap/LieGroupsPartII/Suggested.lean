module

import Mathlib
import TauCeti.GroupTheory.TitsSystem.Parabolic.Basic

/-!
# Lie groups, part II: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
simple definitions those statements need.

Stated here:

* Layer 6: conjugation into a standard parabolic subgroup of an arbitrary Tits system
  (`conj_standardParabolic_le_iff`), which contains the equality of conjugate standard parabolics.
* Layer 7, for a self-adjoint linear group `G ≤ GL_n(ℝ)` (closed, stable under transposition,
  finitely many components) with `θ(g) = (gᵀ)⁻¹`: the Langlands decomposition of the dynamic
  subgroups of a symmetric matrix (`dynamicLevi_decomposition`); the Langlands decomposition of the
  minimal parabolic subgroup `P = M·exp(𝔞)·N` with `G = K·P` (`minimalParabolic_langlands`); the
  conjugacy of the pairs `(𝔞, P)` under the identity component of `K`
  (`exists_conj_minimalParabolic`); the Bruhat decomposition over `N_K(𝔞)/Z_K(𝔞)`
  (`bruhat_decomposition_linear`) with its cell coordinates (`doubleCoset_cell_coordinates`);
  the dynamical description of a regular one-parameter subgroup
  over `N_K(𝔞)/Z_K(𝔞)` (`dynamicParabolic_eq_iUnion_doubleCoset`); the classification of the Lie
  subalgebras containing the minimal parabolic subalgebra (`exists_eq_nonnegEigenspaces_of_le`);
  the component condition and its equivalent forms (`linearComponentCondition_iff`), all with no
  component condition assumed; under the component condition, the dynamical description of the
  subgroups containing `P` (`eq_dynamicParabolic_of_le`) and the Tits system
  (`exists_titsSystem_linear`); and the splitting of `G` into the joint kernel `⁰G` of its real
  characters and the exponential of the `G`-invariant split centre
  (`positiveCharacterKernel_mul_exp`).
* Layer 8: the real points of a connected real algebraic subgroup of `GL_n` stable under
  transposition form a self-adjoint linear group satisfying the component condition
  (`isSelfAdjointLinearGroup_of_zeroLocus`).

Headline theorems of the README that are not statable at the pins, and what each lacks:

* the abstract forms of Layers 1–5 and 6.2 on a Lie group carrying a reductive Cartan datum:
  the conjugacy of the underlying Cartan involutions and of Iwasawa triples with a common split
  central part (§§1.2, 2.6), the comparison of `N_K(𝔞)/Z_K(𝔞)` with `W(Σ)` and the component
  condition (§§2.4, 2.5), `P = MAN` with its Langlands decomposition, the minimal parabolic datum
  and the Bruhat decomposition (§§3.3–3.5, 4.2), `⁰L` (§5.1) and the dynamical description (§6.2).
  Their carrier is LieGroups' `CartanInvolution` with its finite central matrix-cover model and
  its `IwasawaData`, which are planned by LieGroups and absent from the pinned Mathlib and Tau Ceti;
  the statements above are their forms for self-adjoint linear groups.
* the complexification criterion for parabolic subalgebras of a reductive Lie algebra with centre
  (§6.3): its carrier is the complexification `𝔮 ⊗_ℝ ℂ` of a real Lie subalgebra, inside the
  complexified derived algebra `[𝔤, 𝔤] ⊗_ℝ ℂ` as a complex Lie algebra. The pins have no base
  change of a Lie subalgebra (Mathlib's `LieSubmodule.baseChange` base-changes Lie submodules, and
  `Submodule.baseChange` forgets the bracket), and `TauCeti.borelSubalgebra` is taken in a Lie
  algebra carrying `LieAlgebra.IsKilling`, with a splitting Cartan subalgebra and a base of its
  root system. Matrices are not a Lie ring by instance search at the pins, so no complexified
  derived algebra of a real matrix Lie algebra carries that structure there.
-/

namespace TauCetiRoadmap.LieGroupsPartII

open Filter Topology Matrix

/-! ## Layer 6: Parabolic subgroups and subalgebras in general -/

/-- **§6.1. Conjugation into a standard parabolic.** In an arbitrary Tits system, with standard
parabolic subgroups `P_J`, an element `g` conjugates `P_J` into `P_{J'}` iff `J ⊆ J'` and
`g ∈ P_{J'}`. For `J = ∅` (so `P_J = B`) this says that `g B g⁻¹ ⊆ P_{J'}` forces `g ∈ P_{J'}`;
applied to `g` and `g⁻¹` it says that conjugate standard parabolics are equal and that `P_J` is
self-normalizing (Bourbaki, Ch. IV §2, nos. 5–6; Borel–Tits 1965, Corollaire 5.18 (ii)). -/
theorem conj_standardParabolic_le_iff {G : Type*} [Group G] (T : TauCeti.TitsSystem G)
    (J J' : Set T.simple) (g : G) :
    (∀ p ∈ T.standardParabolic J, g * p * g⁻¹ ∈ T.standardParabolic J') ↔
      J ⊆ J' ∧ g ∈ T.standardParabolic J' := by
  sorry

/-! ## Layer 7: The self-adjoint linear model -/

section Linear

variable {n : ℕ}

/-- **§7.1.** A self-adjoint linear group: a subgroup of `GL_n(ℝ)` that is closed, stable under
transposition, and has finitely many connected components. -/
def IsSelfAdjointLinearGroup (G : Subgroup (GL (Fin n) ℝ)) : Prop :=
  IsClosed (G : Set (GL (Fin n) ℝ)) ∧
    (∀ g ∈ G, ∃ h ∈ G, (h : Matrix (Fin n) (Fin n) ℝ) = (g : Matrix (Fin n) (Fin n) ℝ)ᵀ) ∧
    Finite (ConnectedComponents G)

/-- **§7.1.** The Lie algebra of a matrix group: the matrices `X` such that `exp(tX)` is (the matrix
of) an element of `G` for every real `t`. For closed `G` this is Tau Ceti's
`TauCeti.Lie.lieSubalgebraOfSubgroup G` read on matrices
(`TauCeti.Lie.unitsLieAlgebraLieEquiv_symm_mem_lieSubalgebraOfSubgroup_iff`). -/
def linearLieAlgebra (G : Subgroup (GL (Fin n) ℝ)) : Set (Matrix (Fin n) (Fin n) ℝ) :=
  {X | ∀ t : ℝ, ∃ g ∈ G, (g : Matrix (Fin n) (Fin n) ℝ) = NormedSpace.exp (t • X)}

/-- **§7.3.** `𝔞` is a maximal abelian subspace of the symmetric part `𝔭` of `linearLieAlgebra G`:
it consists of symmetric elements of `linearLieAlgebra G`, its elements commute, and every
symmetric element of `linearLieAlgebra G` commuting with all of `𝔞` lies in `𝔞`. -/
def IsMaximalAbelianSymmetric (G : Subgroup (GL (Fin n) ℝ))
    (𝔞 : Submodule ℝ (Matrix (Fin n) (Fin n) ℝ)) : Prop :=
  (∀ X ∈ 𝔞, X ∈ linearLieAlgebra G ∧ Xᵀ = X) ∧
    (∀ X ∈ 𝔞, ∀ Y ∈ 𝔞, X * Y = Y * X) ∧
    ∀ Z ∈ linearLieAlgebra G, Zᵀ = Z → (∀ X ∈ 𝔞, X * Z = Z * X) → Z ∈ 𝔞

/-- **§7.3.** `H₀ ∈ 𝔞` is regular: every element of `linearLieAlgebra G` commuting with `H₀`
commutes with all of `𝔞`, that is, no restricted root vanishes at `H₀`. Its positive system is
`{β : β(H₀) > 0}`. -/
def IsRegularElement (G : Subgroup (GL (Fin n) ℝ)) (𝔞 : Submodule ℝ (Matrix (Fin n) (Fin n) ℝ))
    (H₀ : Matrix (Fin n) (Fin n) ℝ) : Prop :=
  H₀ ∈ 𝔞 ∧ ∀ Z ∈ linearLieAlgebra G, Z * H₀ = H₀ * Z → ∀ X ∈ 𝔞, Z * X = X * Z

/-- **§7.3.** `M = Z_K(𝔞)`: the orthogonal elements of `G` commuting with every element of `𝔞`. -/
def orthogonalCentralizer (G : Subgroup (GL (Fin n) ℝ))
    (𝔞 : Submodule ℝ (Matrix (Fin n) (Fin n) ℝ)) : Set (GL (Fin n) ℝ) :=
  {m | m ∈ G ∧ (m : Matrix (Fin n) (Fin n) ℝ)ᵀ * m = 1 ∧
    ∀ H ∈ 𝔞, (m : Matrix (Fin n) (Fin n) ℝ) * H = H * m}

/-- **§7.3.** `N_K(𝔞)`: the orthogonal elements `k` of `G` with `k 𝔞 k⁻¹ ⊆ 𝔞`. -/
def orthogonalNormalizer (G : Subgroup (GL (Fin n) ℝ))
    (𝔞 : Submodule ℝ (Matrix (Fin n) (Fin n) ℝ)) : Set (GL (Fin n) ℝ) :=
  {k | k ∈ G ∧ (k : Matrix (Fin n) (Fin n) ℝ)ᵀ * k = 1 ∧
    ∀ H ∈ 𝔞, (k : Matrix (Fin n) (Fin n) ℝ) * H * (k : Matrix (Fin n) (Fin n) ℝ)ᵀ ∈ 𝔞}

/-- **§7.2.** The dynamic parabolic of `X`: the `g ∈ G` whose conjugates
`exp(−tX) g exp(tX)`, `t ≥ 0`, are bounded entrywise. -/
def dynamicParabolic (G : Subgroup (GL (Fin n) ℝ)) (X : Matrix (Fin n) (Fin n) ℝ) :
    Set (GL (Fin n) ℝ) :=
  {g | g ∈ G ∧ ∃ C : ℝ, ∀ t : ℝ, 0 ≤ t → ∀ i j,
    |(NormedSpace.exp ((-t) • X) * (g : Matrix (Fin n) (Fin n) ℝ) * NormedSpace.exp (t • X)) i j|
      ≤ C}

/-- **§7.2.** The dynamic unipotent subgroup of `X`: the `g ∈ G` whose conjugates
`exp(−tX) g exp(tX)` tend to `1` as `t → +∞`. -/
def dynamicUnipotent (G : Subgroup (GL (Fin n) ℝ)) (X : Matrix (Fin n) (Fin n) ℝ) :
    Set (GL (Fin n) ℝ) :=
  {g | g ∈ G ∧ Tendsto (fun t : ℝ =>
    NormedSpace.exp ((-t) • X) * (g : Matrix (Fin n) (Fin n) ℝ) * NormedSpace.exp (t • X))
      atTop (𝓝 1)}

/-- **§7.2.** The dynamic Levi subgroup of `X`: the `g ∈ G` commuting with `X`. -/
def dynamicLevi (G : Subgroup (GL (Fin n) ℝ)) (X : Matrix (Fin n) (Fin n) ℝ) :
    Set (GL (Fin n) ℝ) :=
  {g | g ∈ G ∧ (g : Matrix (Fin n) (Fin n) ℝ) * X = X * g}

/-- **§7.3.** The minimal parabolic subgroup `P = M·exp(𝔞)·N` of `(𝔞, H₀)`, with
`M = orthogonalCentralizer G 𝔞` and `N = dynamicUnipotent G H₀`. -/
def minimalParabolic (G : Subgroup (GL (Fin n) ℝ)) (𝔞 : Submodule ℝ (Matrix (Fin n) (Fin n) ℝ))
    (H₀ : Matrix (Fin n) (Fin n) ℝ) : Set (GL (Fin n) ℝ) :=
  {g | ∃ m ∈ orthogonalCentralizer G 𝔞, ∃ H ∈ 𝔞, ∃ u ∈ dynamicUnipotent G H₀,
    (g : Matrix (Fin n) (Fin n) ℝ) =
      (m : Matrix (Fin n) (Fin n) ℝ) * NormedSpace.exp H * (u : Matrix (Fin n) (Fin n) ℝ)}

/-- **§7.3.** The component condition for `(G, 𝔞)`: every element of `G` lies in the connected
component, in `G`, of an element of `M = Z_K(𝔞)`. -/
def LinearComponentCondition (G : Subgroup (GL (Fin n) ℝ))
    (𝔞 : Submodule ℝ (Matrix (Fin n) (Fin n) ℝ)) : Prop :=
  ∀ g ∈ G, ∃ m ∈ orthogonalCentralizer G 𝔞, g ∈ connectedComponentIn (G : Set (GL (Fin n) ℝ)) m

/-- **§7.3.** The sum of the eigenspaces of `ad Y : Z ↦ YZ − ZY` on `n × n` matrices with
non-negative eigenvalue. -/
noncomputable def nonnegEigenspaces (Y : Matrix (Fin n) (Fin n) ℝ) :
    Submodule ℝ (Matrix (Fin n) (Fin n) ℝ) :=
  ⨆ (c : ℝ) (_ : 0 ≤ c),
    Module.End.eigenspace (LinearMap.mulLeft ℝ Y - LinearMap.mulRight ℝ Y) c

/-- **§7.4.** `⁰G`: the elements of `G` on which every continuous homomorphism `G → (ℝ, +)` vanishes
(equivalently, through `log`, every continuous homomorphism `G → (ℝ_{>0}, ·)` takes the value `1`). -/
def positiveCharacterKernel (G : Subgroup (GL (Fin n) ℝ)) : Set (GL (Fin n) ℝ) :=
  {g | ∃ hg : g ∈ G, ∀ χ : G →* Multiplicative ℝ,
    Continuous (fun x => Multiplicative.toAdd (χ x)) → χ ⟨g, hg⟩ = 1}

/-- **§7.2. The Langlands decomposition of the dynamic subgroups.** Let `G ≤ GL_n(ℝ)` be closed and
stable under transposition and let `X` be symmetric. The dynamic parabolic, unipotent and Levi
subgroups of `X` are closed subgroups; the unipotent one is normal in the parabolic one; the
parabolic one meets its image under `θ(g) = (gᵀ)⁻¹` exactly in the Levi one; and if
`exp(tX) G exp(−tX) ⊆ G` for every real `t`, every element of the dynamic parabolic factors uniquely
as `l·u` with `l` in the Levi and `u` in the unipotent subgroup. Finitely many components are not
required (Knapp 2002, Ch. VII §7, in matrix form). -/
theorem dynamicLevi_decomposition (G : Subgroup (GL (Fin n) ℝ))
    (hG : IsClosed (G : Set (GL (Fin n) ℝ)))
    (hGt : ∀ g ∈ G, ∃ h ∈ G, (h : Matrix (Fin n) (Fin n) ℝ) = (g : Matrix (Fin n) (Fin n) ℝ)ᵀ)
    (X : Matrix (Fin n) (Fin n) ℝ) (hX : Xᵀ = X) :
    (∃ Q : Subgroup (GL (Fin n) ℝ),
      (Q : Set (GL (Fin n) ℝ)) = dynamicParabolic G X ∧ IsClosed (Q : Set (GL (Fin n) ℝ))) ∧
    (∃ U : Subgroup (GL (Fin n) ℝ),
      (U : Set (GL (Fin n) ℝ)) = dynamicUnipotent G X ∧ IsClosed (U : Set (GL (Fin n) ℝ))) ∧
    (∃ L : Subgroup (GL (Fin n) ℝ),
      (L : Set (GL (Fin n) ℝ)) = dynamicLevi G X ∧ IsClosed (L : Set (GL (Fin n) ℝ))) ∧
    (∀ g ∈ dynamicParabolic G X, ∀ u ∈ dynamicUnipotent G X,
      g * u * g⁻¹ ∈ dynamicUnipotent G X) ∧
    {g | g ∈ dynamicParabolic G X ∧ ∃ h ∈ dynamicParabolic G X,
        (h : Matrix (Fin n) (Fin n) ℝ) * (g : Matrix (Fin n) (Fin n) ℝ)ᵀ = 1} =
      dynamicLevi G X ∧
    ((∀ t : ℝ, ∀ g ∈ G, ∃ h ∈ G, (h : Matrix (Fin n) (Fin n) ℝ) =
        NormedSpace.exp (t • X) * (g : Matrix (Fin n) (Fin n) ℝ) * NormedSpace.exp ((-t) • X)) →
      ∀ g ∈ dynamicParabolic G X, ∃! p : GL (Fin n) ℝ × GL (Fin n) ℝ,
        p.1 ∈ dynamicLevi G X ∧ p.2 ∈ dynamicUnipotent G X ∧ g = p.1 * p.2) := by
  sorry

/-- **§7.3. The Langlands decomposition of the minimal parabolic subgroup.** For a self-adjoint
linear group `G`, a maximal abelian subspace `𝔞` of the symmetric part of its Lie algebra and a
regular `H₀ ∈ 𝔞`, with no component condition: `P = M·exp(𝔞)·N` is a closed subgroup; every element
of `P` is `m·exp(H)·u` for unique `m ∈ M`, `H ∈ 𝔞` and `u ∈ N`; `G = K·P`; and `K ∩ P = M`
(Knapp 2002, Ch. VI §4 and Ch. VII §§2, 7). -/
theorem minimalParabolic_langlands (G : Subgroup (GL (Fin n) ℝ)) (hG : IsSelfAdjointLinearGroup G)
    (𝔞 : Submodule ℝ (Matrix (Fin n) (Fin n) ℝ)) (h𝔞 : IsMaximalAbelianSymmetric G 𝔞)
    (H₀ : Matrix (Fin n) (Fin n) ℝ) (hH₀ : IsRegularElement G 𝔞 H₀) :
    (∃ Q : Subgroup (GL (Fin n) ℝ), (Q : Set (GL (Fin n) ℝ)) = minimalParabolic G 𝔞 H₀ ∧
      IsClosed (Q : Set (GL (Fin n) ℝ))) ∧
    (∀ g ∈ minimalParabolic G 𝔞 H₀,
      ∃! x : GL (Fin n) ℝ × Matrix (Fin n) (Fin n) ℝ × GL (Fin n) ℝ,
        x.1 ∈ orthogonalCentralizer G 𝔞 ∧ x.2.1 ∈ 𝔞 ∧ x.2.2 ∈ dynamicUnipotent G H₀ ∧
        (g : Matrix (Fin n) (Fin n) ℝ) = (x.1 : Matrix (Fin n) (Fin n) ℝ) *
          NormedSpace.exp x.2.1 * (x.2.2 : Matrix (Fin n) (Fin n) ℝ)) ∧
    (∀ g ∈ G, ∃ k ∈ G, (k : Matrix (Fin n) (Fin n) ℝ)ᵀ * k = 1 ∧
      ∃ p ∈ minimalParabolic G 𝔞 H₀, g = k * p) ∧
    {k | k ∈ G ∧ (k : Matrix (Fin n) (Fin n) ℝ)ᵀ * k = 1 ∧ k ∈ minimalParabolic G 𝔞 H₀} =
      orthogonalCentralizer G 𝔞 := by
  sorry

/-- **§7.3. Conjugacy of minimal parabolic subgroups.** For a self-adjoint linear group `G`, two
maximal abelian subspaces `𝔞, 𝔞'` of the symmetric part of its Lie algebra and regular
`H₀ ∈ 𝔞`, `H₀' ∈ 𝔞'`, there is `k` in the identity component of `K = G ∩ O(n)` carrying `𝔞` onto
`𝔞'` and conjugating the minimal parabolic subgroup of `(𝔞, H₀)` onto that of `(𝔞', H₀')`. No
component condition is assumed (Knapp 2002, Ch. VI §5 and Ch. VII §7). -/
theorem exists_conj_minimalParabolic (G : Subgroup (GL (Fin n) ℝ))
    (hG : IsSelfAdjointLinearGroup G) (𝔞 𝔞' : Submodule ℝ (Matrix (Fin n) (Fin n) ℝ))
    (h𝔞 : IsMaximalAbelianSymmetric G 𝔞) (h𝔞' : IsMaximalAbelianSymmetric G 𝔞')
    (H₀ H₀' : Matrix (Fin n) (Fin n) ℝ) (hH₀ : IsRegularElement G 𝔞 H₀)
    (hH₀' : IsRegularElement G 𝔞' H₀') :
    ∃ k ∈ connectedComponentIn
        {g : GL (Fin n) ℝ | g ∈ G ∧ (g : Matrix (Fin n) (Fin n) ℝ)ᵀ * g = 1} 1,
      (∀ H ∈ 𝔞, (k : Matrix (Fin n) (Fin n) ℝ) * H * (k : Matrix (Fin n) (Fin n) ℝ)ᵀ ∈ 𝔞') ∧
      (∀ H ∈ 𝔞', (k : Matrix (Fin n) (Fin n) ℝ)ᵀ * H * (k : Matrix (Fin n) (Fin n) ℝ) ∈ 𝔞) ∧
      ∀ g : GL (Fin n) ℝ, g ∈ minimalParabolic G 𝔞' H₀' ↔
        k⁻¹ * g * k ∈ minimalParabolic G 𝔞 H₀ := by
  sorry

/-- **§7.3. The Bruhat decomposition over `N_K(𝔞)/Z_K(𝔞)`.** For a self-adjoint linear group,
with no component condition: every `g ∈ G` lies in a double coset `P k P` with `k ∈ N_K(𝔞)`, and two
such double cosets `P k P`, `P k' P` meet only if `k⁻¹k'` commutes with `𝔞`, that is, only if `k`
and `k'` have the same class in `N_K(𝔞)/Z_K(𝔞)` (Knapp 2002, Ch. VII §4). -/
theorem bruhat_decomposition_linear (G : Subgroup (GL (Fin n) ℝ))
    (hG : IsSelfAdjointLinearGroup G) (𝔞 : Submodule ℝ (Matrix (Fin n) (Fin n) ℝ))
    (h𝔞 : IsMaximalAbelianSymmetric G 𝔞) (H₀ : Matrix (Fin n) (Fin n) ℝ)
    (hH₀ : IsRegularElement G 𝔞 H₀) :
    (∀ g ∈ G, ∃ k ∈ orthogonalNormalizer G 𝔞,
      g ∈ DoubleCoset.doubleCoset k (minimalParabolic G 𝔞 H₀) (minimalParabolic G 𝔞 H₀)) ∧
    ∀ k ∈ orthogonalNormalizer G 𝔞, ∀ k' ∈ orthogonalNormalizer G 𝔞,
      (DoubleCoset.doubleCoset k (minimalParabolic G 𝔞 H₀) (minimalParabolic G 𝔞 H₀) ∩
        DoubleCoset.doubleCoset k' (minimalParabolic G 𝔞 H₀) (minimalParabolic G 𝔞 H₀)).Nonempty →
      ∀ H ∈ 𝔞, ((k⁻¹ * k' : GL (Fin n) ℝ) : Matrix (Fin n) (Fin n) ℝ) * H =
        H * ((k⁻¹ * k' : GL (Fin n) ℝ) : Matrix (Fin n) (Fin n) ℝ) := by
  sorry

/-- **§7.3. The cell coordinates of the Bruhat decomposition.** For a self-adjoint linear group,
with no component condition: for `k ∈ N_K(𝔞)`, every element of the double coset `P k P` is
`u·k·p` for a unique pair of `u ∈ N ∩ k N̄ k⁻¹` and `p ∈ P`, where `N = dynamicUnipotent G H₀` and
`N̄ = dynamicUnipotent G (−H₀)` is its image under `θ(g) = (gᵀ)⁻¹` (Knapp 2002, Ch. VII §4). -/
theorem doubleCoset_cell_coordinates (G : Subgroup (GL (Fin n) ℝ))
    (hG : IsSelfAdjointLinearGroup G) (𝔞 : Submodule ℝ (Matrix (Fin n) (Fin n) ℝ))
    (h𝔞 : IsMaximalAbelianSymmetric G 𝔞) (H₀ : Matrix (Fin n) (Fin n) ℝ)
    (hH₀ : IsRegularElement G 𝔞 H₀) :
    ∀ k ∈ orthogonalNormalizer G 𝔞,
      ∀ g ∈ DoubleCoset.doubleCoset k (minimalParabolic G 𝔞 H₀) (minimalParabolic G 𝔞 H₀),
        ∃! x : GL (Fin n) ℝ × GL (Fin n) ℝ,
          x.1 ∈ dynamicUnipotent G H₀ ∧ k⁻¹ * x.1 * k ∈ dynamicUnipotent G (-H₀) ∧
          x.2 ∈ minimalParabolic G 𝔞 H₀ ∧ g = x.1 * k * x.2 := by
  sorry

/-- **§7.3. The dynamical description of a regular one-parameter subgroup.** With no component
condition, the dynamic parabolic of the regular `H₀` is the union of the double cosets `P k P` over
the `k ∈ N_K(𝔞)` commuting with `H₀` (Knapp 2002, Ch. VII §7). -/
theorem dynamicParabolic_eq_iUnion_doubleCoset (G : Subgroup (GL (Fin n) ℝ))
    (hG : IsSelfAdjointLinearGroup G) (𝔞 : Submodule ℝ (Matrix (Fin n) (Fin n) ℝ))
    (h𝔞 : IsMaximalAbelianSymmetric G 𝔞) (H₀ : Matrix (Fin n) (Fin n) ℝ)
    (hH₀ : IsRegularElement G 𝔞 H₀) :
    dynamicParabolic G H₀ =
      ⋃ k ∈ {k | k ∈ orthogonalNormalizer G 𝔞 ∧ (k : Matrix (Fin n) (Fin n) ℝ) * H₀ = H₀ * k},
        DoubleCoset.doubleCoset k (minimalParabolic G 𝔞 H₀) (minimalParabolic G 𝔞 H₀) := by
  sorry

/-- **§7.3. Subalgebras containing the minimal parabolic subalgebra.** With `𝔮₀` the sum of the
eigenspaces of `ad H₀` on `linearLieAlgebra G` with non-negative eigenvalue, and no component
condition: every Lie subalgebra of `linearLieAlgebra G` containing `𝔮₀` is the corresponding sum for
some `Y ∈ 𝔞`; and for `X, Y ∈ 𝔞` whose sums contain `𝔮₀`, the two sums are equal iff `X` and `Y`
have the same centralizer in `linearLieAlgebra G` (Knapp 2002, Ch. VII §7, Proposition 7.76 with
Lemma 7.73). -/
theorem exists_eq_nonnegEigenspaces_of_le (G : Subgroup (GL (Fin n) ℝ))
    (hG : IsSelfAdjointLinearGroup G) (𝔞 : Submodule ℝ (Matrix (Fin n) (Fin n) ℝ))
    (h𝔞 : IsMaximalAbelianSymmetric G 𝔞) (H₀ : Matrix (Fin n) (Fin n) ℝ)
    (hH₀ : IsRegularElement G 𝔞 H₀) :
    (∀ 𝔮 : Submodule ℝ (Matrix (Fin n) (Fin n) ℝ),
      (∀ A ∈ 𝔮, ∀ B ∈ 𝔮, A * B - B * A ∈ 𝔮) →
      (𝔮 : Set (Matrix (Fin n) (Fin n) ℝ)) ⊆ linearLieAlgebra G →
      linearLieAlgebra G ∩ (nonnegEigenspaces H₀ : Set (Matrix (Fin n) (Fin n) ℝ)) ⊆ 𝔮 →
      ∃ Y ∈ 𝔞, (𝔮 : Set (Matrix (Fin n) (Fin n) ℝ)) =
        linearLieAlgebra G ∩ (nonnegEigenspaces Y : Set (Matrix (Fin n) (Fin n) ℝ))) ∧
    ∀ X ∈ 𝔞, ∀ Y ∈ 𝔞,
      linearLieAlgebra G ∩ (nonnegEigenspaces H₀ : Set (Matrix (Fin n) (Fin n) ℝ)) ⊆
        nonnegEigenspaces X →
      linearLieAlgebra G ∩ (nonnegEigenspaces H₀ : Set (Matrix (Fin n) (Fin n) ℝ)) ⊆
        nonnegEigenspaces Y →
      (linearLieAlgebra G ∩ (nonnegEigenspaces X : Set (Matrix (Fin n) (Fin n) ℝ)) =
          linearLieAlgebra G ∩ (nonnegEigenspaces Y : Set (Matrix (Fin n) (Fin n) ℝ)) ↔
        ∀ Z ∈ linearLieAlgebra G, (Z * X = X * Z ↔ Z * Y = Y * Z)) := by
  sorry

/-- **§7.3. The component condition and its equivalent forms.** For a self-adjoint linear group,
`(G, 𝔞)` satisfies the component condition iff every `k ∈ N_K(𝔞)` normalizing `N` commutes with
`𝔞` (the stabilizer of the positive system of `H₀` in `N_K(𝔞)` is `M`), and iff the minimal
parabolic `P` contains every `g ∈ G` with `g P g⁻¹ ⊆ P` (Knapp 2002, Ch. VII §§2, 5). -/
theorem linearComponentCondition_iff (G : Subgroup (GL (Fin n) ℝ))
    (hG : IsSelfAdjointLinearGroup G) (𝔞 : Submodule ℝ (Matrix (Fin n) (Fin n) ℝ))
    (h𝔞 : IsMaximalAbelianSymmetric G 𝔞) (H₀ : Matrix (Fin n) (Fin n) ℝ)
    (hH₀ : IsRegularElement G 𝔞 H₀) :
    (LinearComponentCondition G 𝔞 ↔
      ∀ k ∈ orthogonalNormalizer G 𝔞,
        (∀ u ∈ dynamicUnipotent G H₀, k * u * k⁻¹ ∈ dynamicUnipotent G H₀) →
        k ∈ orthogonalCentralizer G 𝔞) ∧
    (LinearComponentCondition G 𝔞 ↔
      ∀ g ∈ G, (∀ p ∈ minimalParabolic G 𝔞 H₀, g * p * g⁻¹ ∈ minimalParabolic G 𝔞 H₀) →
        g ∈ minimalParabolic G 𝔞 H₀) := by
  sorry

/-- **§7.3. Subgroups containing the minimal parabolic.** Under the component condition: the dynamic
parabolic of `H₀` is `P`; every subgroup of `G` containing `P` is the dynamic parabolic of some
`X ∈ 𝔞`; and for `X, Y ∈ 𝔞` whose dynamic parabolics contain `P`, these are equal iff `X` and `Y`
have the same centralizer in `linearLieAlgebra G` (Knapp 2002, Ch. VII §7). -/
theorem eq_dynamicParabolic_of_le (G : Subgroup (GL (Fin n) ℝ))
    (hG : IsSelfAdjointLinearGroup G) (𝔞 : Submodule ℝ (Matrix (Fin n) (Fin n) ℝ))
    (h𝔞 : IsMaximalAbelianSymmetric G 𝔞) (H₀ : Matrix (Fin n) (Fin n) ℝ)
    (hH₀ : IsRegularElement G 𝔞 H₀) (hc : LinearComponentCondition G 𝔞) :
    dynamicParabolic G H₀ = minimalParabolic G 𝔞 H₀ ∧
    (∀ Q : Subgroup (GL (Fin n) ℝ), Q ≤ G → minimalParabolic G 𝔞 H₀ ⊆ Q →
      ∃ X ∈ 𝔞, (Q : Set (GL (Fin n) ℝ)) = dynamicParabolic G X) ∧
    ∀ X ∈ 𝔞, ∀ Y ∈ 𝔞, minimalParabolic G 𝔞 H₀ ⊆ dynamicParabolic G X →
      minimalParabolic G 𝔞 H₀ ⊆ dynamicParabolic G Y →
      (dynamicParabolic G X = dynamicParabolic G Y ↔
        ∀ Z ∈ linearLieAlgebra G, (Z * X = X * Z ↔ Z * Y = Y * Z)) := by
  sorry

/-- **§7.3. The Tits system.** Under the component condition, `G` carries a Tits system whose `B`
is the minimal parabolic `P` and whose `N` is `N_G(𝔞) = {g ∈ G : g 𝔞 g⁻¹ ⊆ 𝔞}` (Bourbaki, Ch. IV §2;
Knapp 2002, Ch. VII §4). -/
theorem exists_titsSystem_linear (G : Subgroup (GL (Fin n) ℝ))
    (hG : IsSelfAdjointLinearGroup G) (𝔞 : Submodule ℝ (Matrix (Fin n) (Fin n) ℝ))
    (h𝔞 : IsMaximalAbelianSymmetric G 𝔞) (H₀ : Matrix (Fin n) (Fin n) ℝ)
    (hH₀ : IsRegularElement G 𝔞 H₀) (hc : LinearComponentCondition G 𝔞) :
    ∃ T : TauCeti.TitsSystem G,
      (∀ g : G, g ∈ T.subgroupB ↔ (g : GL (Fin n) ℝ) ∈ minimalParabolic G 𝔞 H₀) ∧
      ∀ g : G, g ∈ T.subgroupN ↔ ∀ H ∈ 𝔞,
        ((g : GL (Fin n) ℝ) : Matrix (Fin n) (Fin n) ℝ) * H *
          (((g : GL (Fin n) ℝ)⁻¹ : GL (Fin n) ℝ) : Matrix (Fin n) (Fin n) ℝ) ∈ 𝔞 := by
  sorry

/-- **§7.4. `⁰G` and the split component.** For a self-adjoint linear group `G`, let `F` be the set
of symmetric elements of `linearLieAlgebra G` that commute with `linearLieAlgebra G` and with every
element of `G`. Every `g ∈ G` is `l·exp(X)` for a unique `l ∈ ⁰G` and a unique `X ∈ F`; the
components of `G` may move the split centre, and only its `G`-fixed part `F` splits off
(Knapp 2002, Ch. VII §2; Wallach 1988, Ch. 2 §2.2). -/
theorem positiveCharacterKernel_mul_exp (G : Subgroup (GL (Fin n) ℝ))
    (hG : IsSelfAdjointLinearGroup G) :
    ∀ g ∈ G, ∃! p : GL (Fin n) ℝ × Matrix (Fin n) (Fin n) ℝ,
      p.1 ∈ positiveCharacterKernel G ∧
      (p.2 ∈ linearLieAlgebra G ∧ p.2ᵀ = p.2 ∧
        (∀ Y ∈ linearLieAlgebra G, p.2 * Y = Y * p.2) ∧
        ∀ h ∈ G, (h : Matrix (Fin n) (Fin n) ℝ) * p.2 = p.2 * h) ∧
      (g : Matrix (Fin n) (Fin n) ℝ) = (p.1 : Matrix (Fin n) (Fin n) ℝ) * NormedSpace.exp p.2 := by
  sorry

end Linear

/-! ## Layer 8: Real points of connected reductive groups over ℝ -/

/-- **§8.1. Real points as self-adjoint linear groups.** Let `S` be a set of real polynomials in the
`n²` matrix entries whose zero locus in `GL_n(ℂ)` is a connected subgroup stable under
transposition, that is, the complex points of a connected linear algebraic `ℝ`-group embedded in
`GL_n` with transpose-stable image. Then its real points, the zero locus of `S` in `GL_n(ℝ)`, form a
self-adjoint linear group satisfying the component condition for every maximal abelian subspace of
the symmetric part of its Lie algebra (Knapp 2002, Ch. VII §2). -/
theorem isSelfAdjointLinearGroup_of_zeroLocus {n : ℕ} (S : Set (MvPolynomial (Fin n × Fin n) ℝ))
    (Gℂ : Subgroup (GL (Fin n) ℂ))
    (hGℂ : ∀ g : GL (Fin n) ℂ, g ∈ Gℂ ↔ ∀ p ∈ S,
      MvPolynomial.eval (fun ij => (g : Matrix (Fin n) (Fin n) ℂ) ij.1 ij.2)
        (MvPolynomial.map (algebraMap ℝ ℂ) p) = 0)
    (hconn : ConnectedSpace Gℂ)
    (htr : ∀ g ∈ Gℂ, ∃ h ∈ Gℂ, (h : Matrix (Fin n) (Fin n) ℂ) = (g : Matrix (Fin n) (Fin n) ℂ)ᵀ)
    (G : Subgroup (GL (Fin n) ℝ))
    (hG : ∀ g : GL (Fin n) ℝ, g ∈ G ↔ ∀ p ∈ S,
      MvPolynomial.eval (fun ij => (g : Matrix (Fin n) (Fin n) ℝ) ij.1 ij.2) p = 0) :
    IsSelfAdjointLinearGroup G ∧
      ∀ 𝔞 : Submodule ℝ (Matrix (Fin n) (Fin n) ℝ),
        IsMaximalAbelianSymmetric G 𝔞 → LinearComponentCondition G 𝔞 := by
  sorry

end TauCetiRoadmap.LieGroupsPartII
