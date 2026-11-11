import Mathlib
import TauCeti.GroupTheory.GroupAlgGeom.AlgebraicSet
import TauCeti.GroupTheory.LimitGroup.ResiduallyFree
import TauCeti.GroupTheory.LimitGroup.CentralizerExtension.Basic

/-!
# FreeGroupsAndLimitGroups: target signatures

The roadmap is `README.md`; this file is not the roadmap and is not exhaustive. It states the
roadmap's headline theorems against the pinned Mathlib and Tau Ceti, with the few definitions
they need. Equations over a group `G` are elements of Tau Ceti's free `G`-group
`TauCeti.GroupAlgGeom.GX G X = G ∗ F(X)`, with its evaluation map, algebraic sets and coordinate
groups; fully residually free groups and extensions of centralizers are Tau Ceti's.

Headline theorems that the pinned Tau Ceti already proves are not restated: free groups are CSA
(`IsFreeGroup.isCSA`); limit groups are the finitely generated fully residually free groups
(`TauCeti.LimitGroup.isLimitGroup_iff_isFullyResiduallyFree`), equivalently the finitely
generated groups satisfying the universal theory of `F₂`
(`TauCeti.LimitGroup.isLimitGroup_iff_forall_isUniversal`); free groups of countable rank are
equationally Noetherian (`TauCeti.GroupAlgGeom.isEquationallyNoetherian_of_freeGroupBasis`); and
an algebraic set is irreducible exactly when its coordinate group is discriminated
(`TauCeti.GroupAlgGeom.isIrreducible_V_iff_isDiscriminatedBy`).

Not statable at the pins:
* the existential, universal and positive theories of a free group as recursive sets of sentences
  (§§7.8 and 7.11): Mathlib has no `Primcodable` structure on first-order formulas;
* the abelian and cyclic JSJ decompositions of limit groups (§10.2) and the finite
  Makanin–Razborov diagrams (§10.7): there is no carrier for JSJ trees, their deformation spaces
  or `Hom`-diagrams;
* the implicit function theorem for regular NTQ systems (§11.6): there is no carrier for NTQ
  systems and their towers.
-/

namespace TauCetiRoadmap.FreeGroupsAndLimitGroups

open TauCeti.GroupAlgGeom

/-! ## Layer 2: Stallings graphs and finitely generated free subgroups -/

/-- Howson's theorem (§2.10): the intersection of two finitely generated subgroups of a free
group is finitely generated. -/
theorem fg_inf {α : Type*} (H K : Subgroup (FreeGroup α)) (hH : H.FG) (hK : K.FG) :
    (H ⊓ K).FG := by
  sorry

/-- The exact Schreier formula (§2.11): a subgroup of index `i` of the free group of rank `n` is
free of rank `1 + i (n - 1)`. -/
theorem rank_sub_one_eq_index_mul (n : ℕ) (H : Subgroup (FreeGroup (Fin n)))
    [H.FiniteIndex] [Group.FG H] :
    (Group.rank H : ℤ) - 1 = H.index * ((n : ℤ) - 1) := by
  sorry

/-! ## Layer 4: Bass–Serre theory and relative splittings -/

/-- The Grushko–Neumann theorem (§4.11(2)): rank is additive on free products of finitely
generated nontrivial groups. -/
theorem rank_coprod {G H : Type*} [Group G] [Group H] [Group.FG G] [Group.FG H]
    [Group.FG (Monoid.Coprod G H)] [Nontrivial G] [Nontrivial H] :
    Group.rank (Monoid.Coprod G H) = Group.rank G + Group.rank H := by
  sorry

/-- A group is freely indecomposable (§4.11) when it is nontrivial and is not the internal free
product of two nontrivial subgroups. -/
def IsFreelyIndecomposable (G : Type*) [Group G] : Prop :=
  Nontrivial G ∧ ∀ A B : Subgroup G,
    Function.Bijective (Monoid.Coprod.lift A.subtype B.subtype) → A = ⊥ ∨ B = ⊥

/-- `(H, t)` is a Grushko decomposition of `G` (§4.11(3)): `G` is the internal free product of
the subgroups `H i`, each freely indecomposable and not infinite cyclic, and of the free group on
the elements `t j`. -/
def IsGrushkoDecomposition {G : Type*} [Group G] {p q : ℕ} (H : Fin p → Subgroup G)
    (t : Fin q → G) : Prop :=
  (∀ i, IsFreelyIndecomposable (H i) ∧ ¬ (IsCyclic (H i) ∧ Infinite (H i))) ∧
    Function.Bijective
      (Monoid.Coprod.lift (Monoid.CoprodI.lift fun i => (H i).subtype) (FreeGroup.lift t))

/-- Existence of Grushko decompositions (§4.11(3)): every finitely generated group is the free
product of finitely many freely indecomposable groups, none infinite cyclic, and a free group of
finite rank. -/
theorem exists_isGrushkoDecomposition (G : Type*) [Group G] [Group.FG G] :
    ∃ (p q : ℕ) (H : Fin p → Subgroup G) (t : Fin q → G), IsGrushkoDecomposition H t := by
  sorry

/-- Uniqueness of Grushko decompositions (§4.11(3)): two Grushko decompositions of a group have
free parts of the same rank, and their freely indecomposable factors agree up to permutation and
conjugacy in `G`. -/
theorem IsGrushkoDecomposition.unique {G : Type*} [Group G] {p q p' q' : ℕ}
    {H : Fin p → Subgroup G} {t : Fin q → G} {H' : Fin p' → Subgroup G} {t' : Fin q' → G}
    (h : IsGrushkoDecomposition H t) (h' : IsGrushkoDecomposition H' t') :
    q = q' ∧ ∃ σ : Fin p ≃ Fin p', ∀ i, ∃ g : G,
      H' (σ i) = (H i).map (MulAut.conj g).toMonoidHom := by
  sorry

/-! ## Layer 7: generalised equations, equation solving, and positive formal solutions -/

/-- Satisfiability over free groups of finite rank is recursive (§7.7), uniformly in the rank `n`
and in the number of variables. An input is the rank `n` and a triple of finite lists: equations
`w = 1` and inequations `w ≠ 1`, where `w` is a word in the variables `x_i` (letters `inl i`,
`i : ℕ`) and the basis letters `a_j` of `F(Fin n)` (letters `inr j`; a letter with `j ≥ n`
denotes `1`), and constraints `(i, B)` asking that `x_i` lie in the subgroup generated by the
basis letters with indices in `B`. The predicate holds exactly when the system has a solution in
`F(Fin n)` satisfying the constraints. -/
theorem satisfiability_recursive :
    ComputablePred (fun s : ℕ × ((List (List ((ℕ ⊕ ℕ) × Bool)) ×
        List (List ((ℕ ⊕ ℕ) × Bool))) × List (ℕ × List ℕ)) =>
      ∃ v : ℕ → FreeGroup (Fin s.1),
        (∀ w ∈ s.2.1.1, FreeGroup.lift (Sum.elim v
          (fun a => if h : a < s.1 then FreeGroup.of ⟨a, h⟩ else 1)) (FreeGroup.mk w) = 1) ∧
        (∀ w ∈ s.2.1.2, FreeGroup.lift (Sum.elim v
          (fun a => if h : a < s.1 then FreeGroup.of ⟨a, h⟩ else 1)) (FreeGroup.mk w) ≠ 1) ∧
        ∀ p ∈ s.2.2, v p.1 ∈ Subgroup.closure
          (FreeGroup.of '' {a : Fin s.1 | (a : ℕ) ∈ p.2})) := by
  sorry

/-- Merzljakov's theorem (§§7.10–7.11): if the positive sentence
`∀x₁∃y₁ ⋯ ∀x_k∃y_k S(X, Y, A) = 1` holds in `F = F(Fin n)`, `n ≥ 2`, witnessed by Skolem functions
in which `yᵢ` depends only on `x₁, …, xᵢ`, then it has a formal solution in `F(X ∪ A)` with the
same dependence: `yᵢ = qᵢ` with `qᵢ ∈ F(A ∪ {x₁, …, xᵢ})` and `S(X, q(X), A) = 1`. -/
theorem merzljakov (k n : ℕ) (hn : 2 ≤ n) (S : FreeGroup ((Fin k ⊕ Fin k) ⊕ Fin n))
    (h : ∃ f : (Fin k → FreeGroup (Fin n)) → Fin k → FreeGroup (Fin n),
      (∀ (i : Fin k) (x x' : Fin k → FreeGroup (Fin n)),
          (∀ j ≤ i, x j = x' j) → f x i = f x' i) ∧
        ∀ x, FreeGroup.lift (Sum.elim (Sum.elim x (f x)) FreeGroup.of) S = 1) :
    ∃ q : Fin k → FreeGroup (Fin k ⊕ Fin n),
      (∀ i, q i ∈ Subgroup.closure
          (Set.range (fun a => FreeGroup.of (Sum.inr a)) ∪
            (fun j => FreeGroup.of (Sum.inl j)) '' {j | j ≤ i})) ∧
        FreeGroup.lift (Sum.elim (Sum.elim (fun j => FreeGroup.of (Sum.inl j)) q)
          (fun a => FreeGroup.of (Sum.inr a))) S = 1 := by
  sorry

/-! ## Layer 8: fully residually free groups, limit groups, and NTQ towers -/

/-- Extensions of centralizers (§8.6): for a nonabelian fully residually free group `G` and `u`
not a proper power, the extension of the centralizer `G(u, ℤ) = G ∗_{C_G(u)} (C_G(u) × ℤ)` is
fully residually free. -/
theorem isFullyResiduallyFree_centralizerExt {G : Type*} [Group G]
    (hG : TauCeti.LimitGroup.IsFullyResiduallyFree G) (hnonabelian : ∃ a b : G, ¬ Commute a b)
    (u : G) (hadmissible : TauCeti.LimitGroup.IsAdmissibleCentralizerStep u 1) :
    TauCeti.LimitGroup.IsFullyResiduallyFree (TauCeti.LimitGroup.CentralizerExt u 1) := by
  sorry

/-- Finitely generated fully residually free groups are finitely presented (§8.7(3)). -/
theorem isFinitelyPresented_of_fullyResiduallyFree (G : Type*) [Group G] [Group.FG G]
    (hG : TauCeti.LimitGroup.IsFullyResiduallyFree G) : Group.IsFinitelyPresented G := by
  sorry

/-! ## Layer 9: length functions and infinite-word representations -/

/-- Lyndon length functions with values in an ordered abelian group `Λ` (§9.1). The Gromov
product is used doubled, `2 c(g, f) = l g + l f - l (g⁻¹ f)`, to stay inside `Λ`; the field
`gromov` is axiom (L3), `c(g, h) ≥ min (c(g, f), c(f, h))`, in its isosceles form. -/
structure LyndonLength (G : Type*) [Group G] (Λ : Type*) [AddCommGroup Λ] [LinearOrder Λ]
    [IsOrderedAddMonoid Λ] where
  /-- The length. -/
  l : G → Λ
  l_nonneg : ∀ g, 0 ≤ l g
  l_one : l 1 = 0
  l_inv : ∀ g, l g⁻¹ = l g
  gromov : ∀ g f h : G,
    l g + l h - l (g⁻¹ * h) < l g + l f - l (g⁻¹ * f) →
      l g + l h - l (g⁻¹ * h) = l f + l h - l (f⁻¹ * h)

namespace LyndonLength

/-- Free length functions (§9.1): Gromov products lie in `Λ` (axiom (L4)) and
`l g < l (g ^ 2)` for `g ≠ 1` (axiom (L5)). -/
def IsFree {G Λ : Type*} [Group G] [AddCommGroup Λ] [LinearOrder Λ] [IsOrderedAddMonoid Λ]
    (L : LyndonLength G Λ) : Prop :=
  (∀ g f : G, ∃ c : Λ, 2 • c = L.l g + L.l f - L.l (g⁻¹ * f)) ∧
    ∀ g : G, g ≠ 1 → L.l g < L.l (g ^ 2)

end LyndonLength

/-- Finitely generated fully residually free groups have free length functions with values in
`ℤⁿ` with the lexicographic order (§9.5). -/
theorem exists_free_lyndonLength (G : Type*) [Group G] [Group.FG G]
    (hG : TauCeti.LimitGroup.IsFullyResiduallyFree G) :
    ∃ (n : ℕ) (L : LyndonLength G (Lex (Fin n → ℤ))), L.IsFree := by
  sorry

/-! ## Layer 11: regular implicit-function theorems over free groups -/

/-- The source commutator `[x, y] = x⁻¹ y⁻¹ x y`, equal to Mathlib's `⁅x⁻¹, y⁻¹⁆`. -/
def comm {G : Type*} [Group G] (x y : G) : G := x⁻¹ * y⁻¹ * x * y

/-- The variable `x` of `G[X]`. -/
abbrev var {G X : Type*} [Group G] (x : X) : GX G X := Monoid.Coprod.inr (FreeGroup.of x)

/-- The atoms of the orientable standard quadratic word of genus `n` with coefficients
`c₁, …, c_m` (§6.5): the commutators `[x_i, y_i]`, `i < n`, followed by the conjugates
`z_j⁻¹ c_j z_j`, `j < m`. The variables are `x_i = (i, false)`, `y_i = (i, true)` and `z_j`. -/
def orientableAtoms {G : Type*} [Group G] (n m : ℕ) (c : Fin m → G) :
    List (GX G ((Fin n × Bool) ⊕ Fin m)) :=
  (List.finRange n).map (fun i => comm (var (Sum.inl (i, false))) (var (Sum.inl (i, true)))) ++
    (List.finRange m).map (fun j => (var (Sum.inr j))⁻¹ * Monoid.Coprod.inl (c j) * var (Sum.inr j))

/-- The atoms of the non-orientable standard quadratic word of genus `n` with coefficients
`c₁, …, c_m` (§6.5): the squares `x_i²`, `i < n`, followed by the conjugates `z_j⁻¹ c_j z_j`. -/
def nonorientableAtoms {G : Type*} [Group G] (n m : ℕ) (c : Fin m → G) :
    List (GX G (Fin n ⊕ Fin m)) :=
  (List.finRange n).map (fun i => var (Sum.inl i) ^ 2) ++
    (List.finRange m).map (fun j => (var (Sum.inr j))⁻¹ * Monoid.Coprod.inl (c j) * var (Sum.inr j))

/-- A non-commutative solution in `G` of the equation `r₁ ⋯ r_k d = 1` with atoms
`r = [r₁, …, r_k]` (§6.5): a solution at which some two adjacent atoms take values that do not
commute. -/
def IsNonCommutativeSolution {G X : Type*} [Group G] (r : List (GX G X)) (d : G) (v : X → G) :
    Prop :=
  eval (MonoidHom.id G) v (r.prod * Monoid.Coprod.inl d) = 1 ∧
    ∃ (i : ℕ) (h : i + 1 < r.length),
      ¬ Commute (eval (MonoidHom.id G) v r[i]) (eval (MonoidHom.id G) v r[i + 1])

/-- Regularity (§6.7) of the orientable standard quadratic equation
`∏[x_i, y_i] ∏ z_j⁻¹ c_j z_j d = 1` over `G`, in the form of README §6.7's equivalent
characterization. The equation is standard (of type (1): `m = 0`, `d = 1`; or of type (2):
`d ≠ 1` and every `c_j ≠ 1`) and consistent, and either `κ = 2n + m + ε ≥ 4` (with `ε = 1`
exactly when `d ≠ 1`) and it has a non-commutative solution, or it is `[x, y] d = 1` with `d ≠ 1`,
or it is `[x₁, y₁][x₂, y₂] = 1`. -/
def IsRegularOrientable {G : Type*} [Group G] (n m : ℕ) (c : Fin m → G) (d : G) : Prop :=
  (m = 0 ∧ d = 1 ∨ d ≠ 1 ∧ ∀ j, c j ≠ 1) ∧
    (∃ v, eval (MonoidHom.id G) v ((orientableAtoms n m c).prod * Monoid.Coprod.inl d) = 1) ∧
    (((d = 1 ∧ 4 ≤ 2 * n + m) ∨ (d ≠ 1 ∧ 3 ≤ 2 * n + m)) ∧
        (∃ v, IsNonCommutativeSolution (orientableAtoms n m c) d v) ∨
      (n = 1 ∧ m = 0 ∧ d ≠ 1) ∨ (n = 2 ∧ m = 0 ∧ d = 1))

/-- Regularity (§6.7) of the non-orientable standard quadratic equation
`∏ x_i² ∏ z_j⁻¹ c_j z_j d = 1` over `G`: it is standard (`n > 0`, and either of type (3):
`m = 0`, `d = 1`; or of type (4): `d ≠ 1` and every `c_j ≠ 1`) and consistent, `κ = n + m + ε ≥ 4`
(with `ε = 1` exactly when `d ≠ 1`), and it has a non-commutative solution. -/
def IsRegularNonorientable {G : Type*} [Group G] (n m : ℕ) (c : Fin m → G) (d : G) : Prop :=
  0 < n ∧ (m = 0 ∧ d = 1 ∨ d ≠ 1 ∧ ∀ j, c j ≠ 1) ∧
    (∃ v, eval (MonoidHom.id G) v ((nonorientableAtoms n m c).prod * Monoid.Coprod.inl d) = 1) ∧
    ((d = 1 ∧ 4 ≤ n + m) ∨ (d ≠ 1 ∧ 3 ≤ n + m)) ∧
    ∃ v, IsNonCommutativeSolution (nonorientableAtoms n m c) d v

/-- Compatibility of `T(X, Y) = 1` with `S(X) = 1` over `G` (§11.1): every solution of `S` in `G`
extends to a solution of `T`. -/
def IsCompatible {G X Y : Type*} [Group G] (S : Set (GX G X)) (T : Set (GX G (X ⊕ Y))) : Prop :=
  ∀ v ∈ V (MonoidHom.id G) S, ∃ w : Y → G,
    ∀ t ∈ T, eval (MonoidHom.id G) (Sum.elim v w) t = 1

/-- `T` admits an `S`-lift (§11.1): it has a solution `Y(X)` in the coordinate group
`G_{R(S)}`, with `X` interpreted as the generic point. -/
def HasLift {G X Y : Type*} [Group G] (S : Set (GX G X)) (T : Set (GX G (X ⊕ Y))) : Prop :=
  ∃ w : Y → CoordGroup (MonoidHom.id G) S,
    ∀ t ∈ T, eval (CoordGroup.coeff (MonoidHom.id G) S)
      (Sum.elim (fun x => ((var x : GX G X) : CoordGroup (MonoidHom.id G) S)) w) t = 1

/-- `T` admits a complete `S`-lift (§11.1): an ordinary `S`-lift, and for every `W` such that
`T = 1 ∧ W ≠ 1` is compatible with `S`, a solution in `G_{R(S)}` at the generic point with
`W ≠ 1`. -/
def HasCompleteLift {G X Y : Type*} [Group G] (S : Set (GX G X))
    (T : Set (GX G (X ⊕ Y))) : Prop :=
  HasLift S T ∧ ∀ W : GX G (X ⊕ Y),
    (∀ v ∈ V (MonoidHom.id G) S, ∃ w : Y → G,
      (∀ t ∈ T, eval (MonoidHom.id G) (Sum.elim v w) t = 1) ∧
        eval (MonoidHom.id G) (Sum.elim v w) W ≠ 1) →
    ∃ w : Y → CoordGroup (MonoidHom.id G) S,
      (∀ t ∈ T, eval (CoordGroup.coeff (MonoidHom.id G) S)
        (Sum.elim (fun x => ((var x : GX G X) : CoordGroup (MonoidHom.id G) S)) w) t = 1) ∧
      eval (CoordGroup.coeff (MonoidHom.id G) S)
        (Sum.elim (fun x => ((var x : GX G X) : CoordGroup (MonoidHom.id G) S)) w) W ≠ 1

/-- The implicit function theorem for regular orientable quadratic equations (§11.5): over a
nonabelian free group `F = F(Fin r)`, every finite system `T(X, Y) = 1` compatible with a regular
orientable standard quadratic equation `S(X) = 1` admits a complete `S`-lift. -/
theorem hasCompleteLift_of_isRegularOrientable {r : ℕ} (hr : 2 ≤ r) {n m : ℕ}
    {c : Fin m → FreeGroup (Fin r)} {d : FreeGroup (Fin r)} (hS : IsRegularOrientable n m c d)
    {Y : Type*} [Finite Y] (T : Set (GX (FreeGroup (Fin r)) (((Fin n × Bool) ⊕ Fin m) ⊕ Y)))
    (hT : T.Finite)
    (hcompat : IsCompatible {(orientableAtoms n m c).prod * Monoid.Coprod.inl d} T) :
    HasCompleteLift {(orientableAtoms n m c).prod * Monoid.Coprod.inl d} T := by
  sorry

/-- The implicit function theorem for regular non-orientable quadratic equations (§11.5): over a
nonabelian free group `F = F(Fin r)`, every finite system `T(X, Y) = 1` compatible with a regular
non-orientable standard quadratic equation `S(X) = 1` admits a complete `S`-lift. -/
theorem hasCompleteLift_of_isRegularNonorientable {r : ℕ} (hr : 2 ≤ r) {n m : ℕ}
    {c : Fin m → FreeGroup (Fin r)} {d : FreeGroup (Fin r)}
    (hS : IsRegularNonorientable n m c d)
    {Y : Type*} [Finite Y] (T : Set (GX (FreeGroup (Fin r)) ((Fin n ⊕ Fin m) ⊕ Y)))
    (hT : T.Finite)
    (hcompat : IsCompatible {(nonorientableAtoms n m c).prod * Monoid.Coprod.inl d} T) :
    HasCompleteLift {(nonorientableAtoms n m c).prod * Monoid.Coprod.inl d} T := by
  sorry

end TauCetiRoadmap.FreeGroupsAndLimitGroups
