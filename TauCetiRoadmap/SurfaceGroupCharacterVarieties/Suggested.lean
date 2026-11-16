module

public import Mathlib
public import TauCeti.Algebra.AlgebraicGroup.Reductive.Basic
public import TauCeti.Algebra.AlgebraicGroup.Tangent.Adjoint
public import TauCeti.Topology.Algebra.PointTopology.Basic
public import TauCeti.Topology.Homotopy.AmbientIsotopic.Basic

/-!
# Surface group character varieties: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions they need, each with a real body on a carrier that exists at the pins.

Carriers. A connected reductive group `𝐆` over a field `k` is Tau Ceti's: a finite-type commutative
Hopf `k`-algebra `O(𝐆)` with `TauCeti.reductiveCommHopfAlgProperty k`; its points `𝐆(R)` are the
convolution group `WithConv (O(𝐆) →ₐ[k] R)` with the point topology; its Lie algebra is the module
of counit derivations `Derivation k O(𝐆) (Bialgebra.CounitAlgebra k O(𝐆) k)`, on which the points
act by Tau Ceti's `Derivation.adRepresentation`. A real reductive datum `(𝐆, G^ℝ)` is such an `O(𝐆)`
over `ℝ` and an open subgroup `G^ℝ` of `𝐆(ℝ)`. The outer automorphism group `Out(Γ)` is
TeichmullerGeometry's; it is restated here only because the pins have none.

Headline theorems stated here:
* the outer action of `Out(Γ)` on `Hom(Γ, H)` exists exactly when every homomorphism has
  commutative image (Layer 1.3);
* homeomorphisms and ambient isotopies of `X ∖ P` extend uniquely over the punctures (Layer 2.2);
* a homeomorphism and a path induce a well-defined homomorphism `Ψ_x` from the homeomorphism group
  of a path-connected space to `Out(π₁(X, x))`, trivial on the ambient isotopy class of the identity
  (Layer 3.3);
* the real Kempf–Ness theorem for a real reductive linear group (Layer 5.4);
* four of the six characterizations of reductive representations: adjoint semisimplicity over `ℝ`
  and over `ℂ`, closed complex orbit and closed real orbit (Layer 6.7);
* the character variety `𝒳(Γ, G^ℝ)` of a finitely generated group is Hausdorff, locally compact and
  second countable (Layer 7.1); for a complex reductive group it is the universal Hausdorff
  quotient of `Hom(Γ, G(ℂ))` by conjugation (Layer 7.2); and `Out(Γ)` acts by homeomorphisms on
  the character variety of every group `Γ` with values in a subgroup of the points of an affine
  group over a field with a topology, `𝒳(Γ, G^ℝ)` among them (Layer 7.4).

Headline theorems not statable at the pins:
* the description of the image of the orientation-preserving mapping classes of a closed oriented
  surface of genus at least one as the subgroup of `Out(π₁(Σ, x))` acting trivially on
  `H₂(π₁(Σ, x); ℤ)` (Layer 3.4): the pins have closed connected surfaces
  (`TauCeti.IsClosedConnectedSurface`) but neither the genus of a topological surface nor
  orientation-preserving homeomorphisms of one (Tau Ceti's orientations are those of smooth
  manifolds with corners);
* the non-descent theorem for the based action of the marked-point mapping class group
  `Mod(S*)` of `S = Σ_{g,n}` on `Hom(π₁(S, x), H)` (Layer 3.5): it holds for every `(g, n)`, so no
  genus enters, but `Mod(S*)` consists of classes of orientation-preserving homeomorphisms, which
  the pins lack for a topological surface; its group-theoretic core is the Layer 1.3 statement
  here;
* the clauses of Layer 6.7 on the Zariski closure of `ρ(Γ)` (reductive identity component and
  `G`-complete reducibility): the pins have no Zariski closure of a set of points of an affine group
  as a closed subgroup scheme and no `G`-complete reducibility of subgroups;
* the homeomorphism of `𝒳(Γ, G^ℝ)` with the minimal vectors of `Hom(Γ, G^ℝ)` modulo a maximal
  compact subgroup (Layer 7.1): it needs a Cartan-compatible realization of the conjugation action
  as a linear action (Layer 5.3), a construction of this roadmap that the pins do not have;
* the homeomorphism of `𝒳(Γ, G(ℂ))` with the complex points of the affine quotient
  `Hom(Γ, G)//G` (Layer 7.2): the pins have the invariant subalgebra of a comodule algebra
  (`TauCeti.ComoduleAlgebra.coinvariants`) but not the representation algebra of a finitely
  generated group with its conjugation coaction, a construction of this roadmap (Layer 4.1); the
  topological content of the comparison, that `𝒳(Γ, G(ℂ))` is Hausdorff and the closed-orbit map
  is the universal Hausdorff quotient, is stated;
* the action of `Mod_{g,n}` on `𝒳(Σ_{g,n}, G^ℝ)` and its independence of the base point
  (Layer 7.4): `Mod_{g,n}` needs the orientation-preserving homeomorphisms of a topological
  surface, which the pins lack; on the whole homeomorphism group of a path-connected space the
  action is the composite of `exists_outerAction` and `exists_outAction_characterVariety`, and the
  independence of the base point follows from the triviality of inner automorphisms in
  `exists_outAction_characterVariety`, so neither is stated a second time.
-/

@[expose] public section

namespace TauCetiRoadmap.SurfaceGroupCharacterVarieties

open Topology Filter TauCeti

/-! ## Layer 1: Outer automorphisms and conjugacy classes of homomorphisms -/

section Layer1

/-- The inner automorphisms of a group form a normal subgroup of its automorphism group:
`φ ∘ MulAut.conj g ∘ φ⁻¹ = MulAut.conj (φ g)`. -/
instance innerAut_range_normal (Γ : Type*) [Group Γ] :
    (MulAut.conj : Γ →* MulAut Γ).range.Normal where
  conj_mem := by
    rintro _ ⟨g, rfl⟩ φ
    refine ⟨φ g, ?_⟩
    ext x
    simp [MulAut.conj_apply]

/-- The outer automorphism group `Out(Γ) = Aut(Γ)/Inn(Γ)` of a group (TeichmullerGeometry §4.2),
restated so that the headlines below can be stated against the pins. -/
abbrev Out (Γ : Type*) [Group Γ] : Type _ :=
  MulAut Γ ⧸ (MulAut.conj : Γ →* MulAut Γ).range

/-- **Non-descent** (Layer 1.3; LandesmanLitt2024, Definition 1.1.1 and the remark after it).
The left action `φ · ρ = ρ ∘ φ⁻¹` of `Aut(Γ)` on `Hom(Γ, H)` descends to an action of `Out(Γ)`
exactly when every homomorphism `Γ → H` has commutative image. -/
theorem exists_outAction_iff_commute (Γ H : Type*) [Group Γ] [Group H] :
    (∃ a : Out Γ →* Equiv.Perm (Γ →* H), ∀ (φ : MulAut Γ) (ρ : Γ →* H),
        a (QuotientGroup.mk φ) ρ = ρ.comp (φ⁻¹ : MulAut Γ).toMonoidHom) ↔
      ∀ (ρ : Γ →* H) (a b : Γ), Commute (ρ a) (ρ b) := by
  sorry

end Layer1

/-! ## Layer 2: Isotopy classes, punctures and marked points, and the standard model -/

section Layer2

variable {X : Type*} [TopologicalSpace X] [CompactSpace X] [T2Space X] {P : Set X}

/-- **Extension of homeomorphisms over punctures** (Layer 2.2). Let `X` be compact Hausdorff and
`P ⊆ X` finite such that every neighbourhood of every `p ∈ P` contains a compact neighbourhood `U`
of `p` with `U ∖ {p}` nonempty and connected. Then every homeomorphism of `X ∖ P` extends uniquely
to a homeomorphism of `X`. -/
theorem existsUnique_homeomorph_extension (hP : P.Finite)
    (hloc : ∀ p ∈ P, (𝓝 p).HasBasis
      (fun U : Set X => U ∈ 𝓝 p ∧ IsCompact U ∧ IsConnected (U \ {p})) id)
    (h : (Pᶜ : Set X) ≃ₜ (Pᶜ : Set X)) :
    ∃! e : X ≃ₜ X, ∀ y : (Pᶜ : Set X), e y = (h y : X) := by
  sorry

/-- **Extension of ambient isotopies over punctures** (Layer 2.2). Under the hypotheses of
`existsUnique_homeomorph_extension`, every ambient isotopy of `X ∖ P` extends uniquely to an ambient
isotopy of `X`, and the extension fixes `P` pointwise at every time. -/
theorem existsUnique_ambientIsotopy_extension (hP : P.Finite)
    (hloc : ∀ p ∈ P, (𝓝 p).HasBasis
      (fun U : Set X => U ∈ 𝓝 p ∧ IsCompact U ∧ IsConnected (U \ {p})) id)
    (Φ : AmbientIsotopy (Pᶜ : Set X)) :
    ∃! Φ' : AmbientIsotopy X,
      (∀ (t : unitInterval) (y : (Pᶜ : Set X)),
          Φ'.toContinuousMap (t, (y : X)) = (Φ.toContinuousMap (t, y) : X)) ∧
        ∀ (t : unitInterval) (p : X), p ∈ P → Φ'.toContinuousMap (t, p) = p := by
  sorry

end Layer2

/-! ## Layer 3: The outer action of the mapping class group -/

section Layer3

/-- **The outer action `Ψ_x`** (Layer 3.3; FarbMargalit2012, Ch. 8, §8.1). For a path-connected
space `X` and `x ∈ X`, sending a homeomorphism `f` to the outer class of
`f_δ : [γ] ↦ [δ ⬝ (f ∘ γ) ⬝ δ̄]`, for any path `δ` from `x` to `f x`, is a well-defined homomorphism
from the homeomorphism group to `Out(π₁(X, x))`, and it is trivial on every homeomorphism ambient
isotopic to the identity; so it factors through the group `Mod^±(X)` of ambient isotopy classes. -/
theorem exists_outerAction (X : Type*) [TopologicalSpace X] [PathConnectedSpace X] (x : X) :
    ∃ Ψ : (X ≃ₜ X) →* Out (FundamentalGroup X x),
      (∀ (f : X ≃ₜ X) (δ : Path x (f x)), ∃ φ : MulAut (FundamentalGroup X x),
          Ψ f = QuotientGroup.mk φ ∧
            ∀ γ : FundamentalGroup X x, φ γ =
              (FundamentalGroup.fundamentalGroupMulEquivOfPath δ).symm
                (FundamentalGroup.map (f : C(X, X)) x γ)) ∧
        ∀ f : X ≃ₜ X, AmbientIsotopic (ContinuousMap.id X) (f : C(X, X)) → Ψ f = 1 := by
  sorry

end Layer3

/-! ## Layer 4: Representation schemes -/

section Layer4

/-- The topology of pointwise convergence on `Hom(Γ, G)`, induced from the product topology on
`Γ → G` (Layer 4.2). -/
scoped instance pointwiseTopology (Γ G : Type*) [Group Γ] [Group G] [TopologicalSpace G] :
    TopologicalSpace (Γ →* G) :=
  TopologicalSpace.induced (fun ρ : Γ →* G => (ρ : Γ → G)) Pi.topologicalSpace

/-- The orbit of `ρ ∈ Hom(Γ, G)` under conjugation by `G`, `{MulAut.conj g ∘ ρ : g ∈ G}`
(Layer 4.1). -/
def conjOrbit {Γ G : Type*} [Group Γ] [Group G] (ρ : Γ →* G) : Set (Γ →* G) :=
  {ρ' | ∃ g : G, ρ' = (MulAut.conj g).toMonoidHom.comp ρ}

end Layer4

/-! ## Layer 5: Real reductive groups and minimal vectors -/

section Layer5

variable {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℝ V]

/-- The symmetric part `𝔭 = 𝔤 ∩ Sym(V)` of the Lie algebra of a subgroup `G ⊆ GL(V)`: the
symmetric endomorphisms `A` with `exp(tA) ∈ G` for every real `t` (Layer 5.4). -/
def symmetricPart (G : Subgroup (V →L[ℝ] V)ˣ) : Set (V →L[ℝ] V) :=
  {A | (A : V →ₗ[ℝ] V).IsSymmetric ∧
    ∀ t : ℝ, ∃ g ∈ G, (g : V →L[ℝ] V) = NormedSpace.exp (t • A)}

/-- A real reductive linear group (Layer 5.4; BohmLafuente2021, condition (1)): a closed subgroup
`G ⊆ GL(V)` with `G = K exp(𝔭)`, where `K = G ∩ O(V)` and `𝔭` is `symmetricPart G`. -/
def IsRealReductiveLinearGroup (G : Subgroup (V →L[ℝ] V)ˣ) : Prop :=
  IsClosed (G : Set (V →L[ℝ] V)ˣ) ∧
    ∀ g ∈ G, ∃ k ∈ G, (∀ v : V, ‖(k : V →L[ℝ] V) v‖ = ‖v‖) ∧
      ∃ A ∈ symmetricPart G, (g : V →L[ℝ] V) = (k : V →L[ℝ] V) * NormedSpace.exp A

/-- The minimal vectors `{v : ⟪A v, v⟫ = 0 for all A ∈ 𝔭}` (Layer 5.4). -/
def minimalVectors (G : Subgroup (V →L[ℝ] V)ˣ) : Set V :=
  {v | ∀ A ∈ symmetricPart G, inner ℝ (A v) v = 0}

/-- The orbit `G v` of a vector under a linear group (Layer 5.4). -/
def linearOrbit (G : Subgroup (V →L[ℝ] V)ˣ) (v : V) : Set V :=
  (fun g : (V →L[ℝ] V)ˣ => (g : V →L[ℝ] V) v) '' G

/-- **Minimal vectors minimize the norm on their orbit** (Layer 5.4 (i); BohmLafuente2021,
Lemma 5.1). For a real reductive linear group, `v` is a minimal vector exactly when
`‖v‖ ≤ ‖g v‖` for every `g ∈ G`. -/
theorem minimalVectors_eq_normMinimizers [FiniteDimensional ℝ V] {G : Subgroup (V →L[ℝ] V)ˣ}
    (hG : IsRealReductiveLinearGroup G) :
    minimalVectors G = {v | ∀ g ∈ G, ‖v‖ ≤ ‖(g : V →L[ℝ] V) v‖} := by
  sorry

/-- **The real Kempf–Ness theorem, closed orbits** (Layer 5.4 (ii); BohmLafuente2021,
Theorem 1.1 (i); RichardsonSlodowy1990, §4). For a real reductive linear group, an orbit is closed
exactly when it contains a minimal vector. -/
theorem isClosed_linearOrbit_iff [FiniteDimensional ℝ V] {G : Subgroup (V →L[ℝ] V)ˣ}
    (hG : IsRealReductiveLinearGroup G) (v : V) :
    IsClosed (linearOrbit G v) ↔ (linearOrbit G v ∩ minimalVectors G).Nonempty := by
  sorry

/-- **The real Kempf–Ness theorem, uniqueness of minimal vectors** (Layer 5.4 (ii);
BohmLafuente2021, Theorem 1.1 (i)). The minimal vectors of an orbit containing a minimal vector `w`
form the orbit `K w` of the maximal compact subgroup `K = G ∩ O(V)`. -/
theorem linearOrbit_inter_minimalVectors [FiniteDimensional ℝ V] {G : Subgroup (V →L[ℝ] V)ˣ}
    (hG : IsRealReductiveLinearGroup G) {v w : V} (hw : w ∈ linearOrbit G v ∩ minimalVectors G) :
    linearOrbit G v ∩ minimalVectors G =
      (fun k : (V →L[ℝ] V)ˣ => (k : V →L[ℝ] V) w) ''
        {k | k ∈ G ∧ ∀ u : V, ‖(k : V →L[ℝ] V) u‖ = ‖u‖} := by
  sorry

/-- **The real Hilbert–Mumford criterion** (Layer 5.4 (iii); BohmLafuente2021, Theorem 1.1 (ii)).
If the orbit of `v` is not closed, some `α ∈ 𝔭` moves `v` along `exp(tα)` to a limit with closed
orbit. -/
theorem exists_tendsto_closed_linearOrbit [FiniteDimensional ℝ V] {G : Subgroup (V →L[ℝ] V)ˣ}
    (hG : IsRealReductiveLinearGroup G) {v : V} (hv : ¬ IsClosed (linearOrbit G v)) :
    ∃ α ∈ symmetricPart G, ∃ w : V,
      Tendsto (fun t : ℝ => NormedSpace.exp (t • α) v) atTop (𝓝 w) ∧
        IsClosed (linearOrbit G w) := by
  sorry

/-- **Unique closed orbit in an orbit closure** (Layer 5.4 (iv); BohmLafuente2021,
Theorem 1.1 (iii)). The closure of every orbit of a real reductive linear group contains exactly
one closed orbit. -/
theorem existsUnique_closed_linearOrbit [FiniteDimensional ℝ V] {G : Subgroup (V →L[ℝ] V)ˣ}
    (hG : IsRealReductiveLinearGroup G) (v : V) :
    ∃! O : Set V, (∃ w : V, O = linearOrbit G w ∧ IsClosed O) ∧
      O ⊆ closure (linearOrbit G v) := by
  sorry

end Layer5

/-! ## Layer 6: Reductive representations -/

section Layer6

/-- The adjoint representation `Ad` of the `B`-points of an affine group `Spec A` over `R` on its
`B`-valued Lie algebra, Tau Ceti's `Derivation.adRepresentation` read on `B`-valued points
(Layer 6.1). -/
noncomputable def adjointRepresentation (R A B : Type*) [CommRing R] [CommRing A]
    [HopfAlgebra R A] [CommRing B] [Algebra R B] :
    Representation B (WithConv (A →ₐ[R] B)) (Derivation R A (Bialgebra.CounitAlgebra R A B)) :=
  (Derivation.adRepresentation B).comp
    (AlgHom.mapValue (Bialgebra.CounitAlgebra.algEquivSelf R A B).symm.toAlgHom)

/-- A homomorphism `ρ : Γ → G` into a subgroup of the `k`-points of an affine group over `k` is
**reductive** when `Ad ∘ ρ` is a semisimple representation on the Lie algebra over `k`
(Layer 6.1; BCGGO2024, §8.1). -/
def IsReductiveRep {k A Γ : Type*} [Field k] [CommRing A] [HopfAlgebra k A] [Group Γ]
    (G : Subgroup (WithConv (A →ₐ[k] k))) (ρ : Γ →* G) : Prop :=
  Representation.IsSemisimpleRepresentation
    ((adjointRepresentation k A k).comp (G.subtype.comp ρ))

/-- **Characterizations of reductive representations** (Layer 6.7; BCGGO2024, §8.1;
Sikora2012, Theorem 30; RichardsonSlodowy1990, §7). For a real reductive datum `(𝐆, G^ℝ)`, a
finitely generated `Γ` and `ρ : Γ → G^ℝ`, the following are equivalent: `ρ` is reductive; `Ad ∘ ρ`
is semisimple on the complexified Lie algebra; the `𝐆(ℂ)`-orbit of `ρ` is closed in
`Hom(Γ, 𝐆(ℂ))`; the `G^ℝ`-orbit of `ρ` is closed in `Hom(Γ, G^ℝ)`. -/
theorem isReductiveRep_tfae {H : Type} [CommRing H] [HopfAlgebra ℝ H] [Algebra.FiniteType ℝ H]
    (hH : reductiveCommHopfAlgProperty ℝ (FiniteTypeCommHopfAlgCat.of ℝ H))
    (G : Subgroup (WithConv (H →ₐ[ℝ] ℝ))) (hG : IsOpen (G : Set (WithConv (H →ₐ[ℝ] ℝ))))
    {Γ : Type*} [Group Γ] [Group.FG Γ] (ρ : Γ →* G) :
    List.TFAE
      [IsReductiveRep G ρ,
        Representation.IsSemisimpleRepresentation
          ((adjointRepresentation ℝ H ℂ).comp
            ((AlgHom.mapValue (H := H) (Algebra.ofId ℝ ℂ)).comp (G.subtype.comp ρ))),
        IsClosed
          (conjOrbit ((AlgHom.mapValue (H := H) (Algebra.ofId ℝ ℂ)).comp (G.subtype.comp ρ))),
        IsClosed (conjOrbit ρ)] := by
  sorry

end Layer6

/-! ## Layer 7: Character varieties -/

section Layer7

/-- Conjugation as an equivalence relation on the reductive homomorphisms (Layer 7.1). -/
def reductiveConjSetoid {k A Γ : Type*} [Field k] [CommRing A] [HopfAlgebra k A] [Group Γ]
    (G : Subgroup (WithConv (A →ₐ[k] k))) : Setoid {ρ : Γ →* G // IsReductiveRep G ρ} where
  r ρ ρ' := ρ'.1 ∈ conjOrbit ρ.1
  iseqv := by
    refine ⟨fun ρ => ⟨1, by ext; simp⟩, ?_, ?_⟩
    · rintro ρ ρ' ⟨g, hg⟩
      refine ⟨g⁻¹, ?_⟩
      ext γ
      simp [hg, mul_assoc]
    · rintro ρ ρ' ρ'' ⟨g, hg⟩ ⟨g', hg'⟩
      refine ⟨g' * g, ?_⟩
      ext γ
      simp [hg, hg', mul_assoc]

/-- The **character variety** `𝒳(Γ, G) = Hom^red(Γ, G)/G` of a group `Γ` with values in a subgroup
`G` of the points of an affine group: reductive homomorphisms modulo conjugation, with the quotient
topology of the topology of pointwise convergence (Layer 7.1; BCGGO2024, Definition 8.1). -/
def CharacterVariety {k A : Type*} [Field k] [CommRing A] [HopfAlgebra k A] (Γ : Type*) [Group Γ]
    (G : Subgroup (WithConv (A →ₐ[k] k))) : Type _ :=
  Quotient (reductiveConjSetoid (Γ := Γ) G)

/-- The quotient topology on the character variety, of the subspace topology of the topology of
pointwise convergence on the reductive homomorphisms (Layer 7.1). -/
instance {k A : Type*} [Field k] [TopologicalSpace k] [CommRing A] [HopfAlgebra k A] (Γ : Type*)
    [Group Γ] (G : Subgroup (WithConv (A →ₐ[k] k))) : TopologicalSpace (CharacterVariety Γ G) :=
  inferInstanceAs (TopologicalSpace (Quotient (reductiveConjSetoid (Γ := Γ) G)))

/-- **Topology of the character variety** (Layer 7.1; RichardsonSlodowy1990, §9). For a real
reductive datum `(𝐆, G^ℝ)` and a finitely generated group `Γ`, `𝒳(Γ, G^ℝ)` is Hausdorff, locally
compact and second countable. -/
theorem characterVariety_t2_locallyCompact_secondCountable {H : Type} [CommRing H]
    [HopfAlgebra ℝ H] [Algebra.FiniteType ℝ H]
    (hH : reductiveCommHopfAlgProperty ℝ (FiniteTypeCommHopfAlgCat.of ℝ H))
    (G : Subgroup (WithConv (H →ₐ[ℝ] ℝ))) (hG : IsOpen (G : Set (WithConv (H →ₐ[ℝ] ℝ))))
    (Γ : Type*) [Group Γ] [Group.FG Γ] :
    T2Space (CharacterVariety Γ G) ∧ LocallyCompactSpace (CharacterVariety Γ G) ∧
      SecondCountableTopology (CharacterVariety Γ G) := by
  sorry

/-- **The universal Hausdorff quotient** (Layer 7.2, which proves the topological statement;
Sikora2012 lines 835–837 for the unique closed orbit in each fibre of the affine quotient). For a
connected reductive group `G` over `ℂ` and a finitely generated group `Γ`, the character variety
`𝒳(Γ, G(ℂ))` is Hausdorff, and sending a homomorphism to the class of the unique closed orbit in its
orbit closure is a continuous map from `Hom(Γ, G(ℂ))` to it, constant on conjugation orbits and
equal to the quotient map on reductive homomorphisms, through which every continuous
conjugation-invariant map to a Hausdorff space factors uniquely and continuously. -/
theorem characterVariety_universalHausdorffQuotient {H : Type} [CommRing H] [HopfAlgebra ℂ H]
    [Algebra.FiniteType ℂ H]
    (hH : reductiveCommHopfAlgProperty ℂ (FiniteTypeCommHopfAlgCat.of ℂ H))
    (Γ : Type*) [Group Γ] [Group.FG Γ] :
    T2Space (CharacterVariety Γ (⊤ : Subgroup (WithConv (H →ₐ[ℂ] ℂ)))) ∧
      ∃ q : (Γ →* (⊤ : Subgroup (WithConv (H →ₐ[ℂ] ℂ)))) →
          CharacterVariety Γ (⊤ : Subgroup (WithConv (H →ₐ[ℂ] ℂ))),
        Continuous q ∧
          (∀ (ρ : Γ →* (⊤ : Subgroup (WithConv (H →ₐ[ℂ] ℂ)))) (hρ : IsReductiveRep ⊤ ρ),
            q ρ = Quotient.mk _ ⟨ρ, hρ⟩) ∧
          (∀ ρ ρ' : Γ →* (⊤ : Subgroup (WithConv (H →ₐ[ℂ] ℂ))), ρ' ∈ conjOrbit ρ → q ρ' = q ρ) ∧
          ∀ (Z : Type*) [TopologicalSpace Z] [T2Space Z]
            (F : (Γ →* (⊤ : Subgroup (WithConv (H →ₐ[ℂ] ℂ)))) → Z), Continuous F →
            (∀ ρ ρ', ρ' ∈ conjOrbit ρ → F ρ' = F ρ) →
              ∃! F' : CharacterVariety Γ (⊤ : Subgroup (WithConv (H →ₐ[ℂ] ℂ))) → Z,
                Continuous F' ∧ F' ∘ q = F := by
  sorry

/-- **The outer action on the character variety** (Layer 7.4). For every group `Γ`, every field
`k` with a topology and every subgroup `G` of the `k`-points of an affine group over `k`,
precomposition with automorphisms of `Γ` preserves reductivity, and `Out(Γ)` acts on the character
variety `CharacterVariety Γ G` by homeomorphisms, `[φ] · [ρ] = [ρ ∘ φ⁻¹]`; in particular on
`𝒳(Γ, G^ℝ)` for a real reductive datum `(𝐆, G^ℝ)`. -/
theorem exists_outAction_characterVariety {k A : Type*} [Field k] [TopologicalSpace k]
    [CommRing A] [HopfAlgebra k A] (G : Subgroup (WithConv (A →ₐ[k] k))) (Γ : Type*) [Group Γ] :
    (∀ (φ : MulAut Γ) (ρ : Γ →* G), IsReductiveRep G ρ → IsReductiveRep G (ρ.comp φ.toMonoidHom)) ∧
      ∃ a : Out Γ →* (CharacterVariety Γ G ≃ₜ CharacterVariety Γ G),
        ∀ (φ : MulAut Γ) (ρ ρ' : {ρ : Γ →* G // IsReductiveRep G ρ}),
          ρ'.1 = ρ.1.comp (φ⁻¹ : MulAut Γ).toMonoidHom →
            a (QuotientGroup.mk φ) (Quotient.mk _ ρ) = Quotient.mk _ ρ' := by
  sorry

end Layer7

end TauCetiRoadmap.SurfaceGroupCharacterVarieties
