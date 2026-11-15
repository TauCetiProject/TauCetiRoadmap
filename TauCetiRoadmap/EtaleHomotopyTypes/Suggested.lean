module

public import Mathlib
public import TauCeti.AlgebraicGeometry.FiniteEtale.Fiber

/-!
# Étale homotopy types: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
theorems when statable against the pinned APIs. Two are statable at these pins, both on the
finite étale fundamental group of a scheme, the automorphism group of a geometric fibre functor
of Tau Ceti's finite étale carrier: the geometric product formula over an algebraically closed
field of characteristic zero (§3.8a) and the finite étale product formula over a field of
characteristic zero (§3.9a), with the one definition they need, the homomorphism of fundamental
groups induced by a morphism of schemes (§3.0b). Every other headline requires one of the
missing carriers listed below. No substitute assertion is stated.

Layer 0:
* Isaksen's simplicial model structure, properness and the strong-fibration presentation result
  lack the homotopy pro-local-system carrier and its model structure on pro-simplicial sets.
* Connected pointed homotopy detection and local-coefficient weak-equivalence detection lack
  those pro-local systems, their cohomology and the associated pointed homotopy category.

Layer 1:
* Sub-pro-group covering representability and invariance of covering categories lack native
  pro-coverings and the pointed pro-space homotopy category.
* Coverings as fibrations and homotopy-isomorphism base change with deck-equivariant cohomology
  lack the Isaksen model, its covering objects and their coefficient comparison.
* Full faithfulness of pro-classifying spaces, representability of maps into them and raw
  K(pi,1) recognition lack the classifying pro-space and raw homotopy-group carriers.

Layer 2:
* The derived constant/limit adjunction and nonabelian profinite derived-limit vanishing lack
  the unstable derived limit and nonabelian derived-limit carriers on these small pro-diagrams.
* Homotopy groups of materialization for profinite pro-spaces lack their derived materialization.
* Absolute monodromy orbit bijection, pointed isomorphism lifting, relative pointed surjectivity,
  relative isomorphism lifting and the stabilizer orbit bijection lack the pro-space homotopy
  categories and materialized path transport.

Layer 3:
* The profinite-completion universal property for a pro-group is an adapter rather than a
  headline and is not stated; its finite-quotient form is expressible with the native levelwise
  completion, the native profinite limit cone and limits and colimits of types.
* Profinite local-coefficient detection, raw K(pi,1) finite-cover effacement and its product
  formula lack the raw etale type and its homotopy pro-groups.
* Etale local-coefficient comparison, raw/finite fundamental-group comparison, raw profiniteness,
  the field classifying equivalence and finite etale base change lack the rigid etale type.
* Galois-equivariant geometric cohomology transport and the elementary-fibration homotopy
  sequence lack that type, its cover tower and its homotopy-fiber comparison.
* The homotopy exact sequence of fundamental groups for a morphism, on which the product
  formulas rest, lacks its hypotheses: cohomological properness in dimension at most 1 and local
  0-acyclicity, which need stacks of etale torsors with their direct images and base change, and
  strict localizations of schemes.
* Strong desingularizability of finite-type schemes over an algebraically closed field of
  characteristic zero lacks resolution of singularities and the strong-desingularizability
  notion of SGA 5. Cohomological properness of normal-crossings complements over an arbitrary
  base and of quasi-compact quasi-separated schemes, the relative Abhyankar step, the
  base-change criterion for universal local acyclicity with its fibre criterion for coherent
  locally 1-aspheric morphisms, universal local 1-asphericity and
  0-acyclicity of projections lack relative normal-crossings divisors, stacks of etale torsors
  with their direct images and base change, strict localizations of schemes and the relative
  purity of finite etale covers. Cohomological properness over an arbitrary field for every
  etale sheaf of sets and, in characteristic zero, for every ind-finite sheaf of groups, with
  universal local 1-asphericity in characteristic zero, lacks in addition the direct image and
  base-change exchange of sheaves of sets on the small etale sites of schemes along a morphism,
  ind-finite sheaves of groups and their torsor stacks, and constructible sheaves of sets with
  their descent along limits of schemes.

Layer 4:
* Open arithmetic image is an adapter rather than a headline and is not stated.
* Pointed arithmetic lifting, arithmetic isomorphism lifting, the geometric orbit surjection and
  bijection, the outer fundamental-group map, the open-image restriction and the product mapping
  result lack the raw etale homotopy category and its arithmetic structural maps.

Layer 5:
* Algebraic evaluation representability lacks the supplied analytification/analytic-points
  functor on quasi-projective complex schemes. Continuous-function evaluation alone is not it.
* Smooth Cech descent and analytic etale hypercover descent lack that functor and its diagonal
  Betti realization. A definition on arbitrary simplicial topological spaces would not state
  these scheme theorems.

Layer 6:
* The p-profinite completion mapping-space universal property and its localized-model comparison
  lack the homotopy-coherent category of p-finite types and its Pro construction.
* Finite-type materialization comparison lacks that p-profinite carrier and materialization.
* The Betti-etale zigzag, mod-p cohomology/homology comparison on finite-type and specified-graded
  objects, field-automorphism naturality, and strictification of the functor and action lack the
  rigid etale realization, its completion, the analytic functor and coherent action carriers.

No substitute predicates, admitted data, API lemmas or boundary-case theorems are asserted.
-/

open CategoryTheory AlgebraicGeometry

universe u

namespace TauCetiRoadmap.EtaleHomotopyTypes

/-! ## Layer 3: Rigid étale types and finite-cover comparison -/

/-- The homomorphism of étale fundamental groups induced by a morphism of schemes `f : X ⟶ Y`
at a geometric point `a : Spec Ω ⟶ X`, with `Ω` separably closed (§3.0b). The fundamental group
of `X` at `a` is the automorphism group of the geometric fibre functor
`TauCeti.FiniteEtaleScheme.fiber a` on finite étale `X`-schemes. An automorphism `σ` of it acts on
the fibre at `a` of the base change `E ×_Y X` of every finite étale `Y`-scheme `E`; that fibre is
the fibre of `E` at `a ≫ f` through `TauCeti.FiniteEtaleScheme.pullbackCompFiberIso`, and the
image of `σ` is the automorphism of the geometric fibre functor at `a ≫ f` so obtained. -/
noncomputable def fundamentalGroupMap {X Y : Scheme.{u}} (f : X ⟶ Y) {Ω : Type u} [Field Ω]
    [IsSepClosed Ω] (a : Spec (.of Ω) ⟶ X) :
    Aut (TauCeti.FiniteEtaleScheme.fiber a) →* Aut (TauCeti.FiniteEtaleScheme.fiber (a ≫ f)) :=
  (TauCeti.FiniteEtaleScheme.pullbackCompFiberIso f a).conjAut.toMonoidHom.comp
    (((Functor.whiskeringLeft _ _ FintypeCat.{u}).obj
      (TauCeti.FiniteEtaleScheme.pullback f)).mapAut (TauCeti.FiniteEtaleScheme.fiber a))

/-- **Geometric product formula** (§3.8a; SGA 1, Exposé XIII, Proposition 4.6(b)). Let `K` be an
algebraically closed field of characteristic zero, `X` a connected quasi-compact quasi-separated
`K`-scheme and `Y` a connected `K`-scheme, with no finiteness condition on `Y`. Then `X ×_K Y` is
connected, and at every geometric point `c` of `X ×_K Y` the homomorphisms induced by the two
projections form an isomorphism of profinite groups
`π₁(X ×_K Y, c) ≅ π₁(X, pr₁ ∘ c) × π₁(Y, pr₂ ∘ c)`. -/
theorem geometric_product_formula {K : Type u} [Field K] [IsAlgClosed K] [CharZero K]
    {X Y : Scheme.{u}} (p : X ⟶ Spec (.of K)) (q : Y ⟶ Spec (.of K)) [QuasiCompact p]
    [QuasiSeparated p] [ConnectedSpace X] [ConnectedSpace Y] {Ω : Type u} [Field Ω]
    [IsSepClosed Ω] (c : Spec (.of Ω) ⟶ Limits.pullback p q) :
    ConnectedSpace (Limits.pullback p q : Scheme.{u}) ∧
      ∃ e : Aut (TauCeti.FiniteEtaleScheme.fiber c) ≃ₜ*
          Aut (TauCeti.FiniteEtaleScheme.fiber (c ≫ Limits.pullback.fst p q)) ×
            Aut (TauCeti.FiniteEtaleScheme.fiber (c ≫ Limits.pullback.snd p q)),
        ∀ σ, e σ = (fundamentalGroupMap (Limits.pullback.fst p q) c σ,
          fundamentalGroupMap (Limits.pullback.snd p q) c σ) := by
  sorry

/-- **Finite étale product formula over a field** (§3.9a; Schmidt–Stix, proof of Lemma 2.9;
SGA 1, Exposé XIII, Proposition 4.6). Let `k` be a field of characteristic zero and `Y₁`, `Y₂`
geometrically connected `k`-schemes of finite type, with structure morphisms `p₁`, `p₂`. Let `c`
be a geometric point of `Y₁ ×_k Y₂` with images `a` in `Y₁` and `b` in `Y₂`; the equality
`b ≫ p₂ = a ≫ p₁` identifies the fundamental groups of `Spec k` at the two images. The
homomorphisms induced by the two projections identify `π₁(Y₁ ×_k Y₂, c)`, as a profinite group,
with the fibre product of `π₁(Y₁, a)` and `π₁(Y₂, b)` over the fundamental group of `Spec k`: the
subgroup of pairs with the same image there. -/
theorem finiteEtale_product_formula {k : Type u} [Field k] [CharZero k] {Y₁ Y₂ : Scheme.{u}}
    (p₁ : Y₁ ⟶ Spec (.of k)) (p₂ : Y₂ ⟶ Spec (.of k)) [GeometricallyConnected p₁]
    [GeometricallyConnected p₂] [LocallyOfFiniteType p₁] [QuasiCompact p₁]
    [LocallyOfFiniteType p₂] [QuasiCompact p₂] {Ω : Type u} [Field Ω] [IsSepClosed Ω]
    (c : Spec (.of Ω) ⟶ Limits.pullback p₁ p₂) :
    ∃ e : Aut (TauCeti.FiniteEtaleScheme.fiber c) ≃ₜ*
        MonoidHom.eqLocus
          (G := Aut (TauCeti.FiniteEtaleScheme.fiber (c ≫ Limits.pullback.fst p₁ p₂)) ×
            Aut (TauCeti.FiniteEtaleScheme.fiber (c ≫ Limits.pullback.snd p₁ p₂)))
          ((fundamentalGroupMap p₁ (c ≫ Limits.pullback.fst p₁ p₂)).comp (MonoidHom.fst _ _))
          ((eqToIso (congrArg (TauCeti.FiniteEtaleScheme.fiber (Ω := Ω))
              (show (c ≫ Limits.pullback.snd p₁ p₂) ≫ p₂ = (c ≫ Limits.pullback.fst p₁ p₂) ≫ p₁ by
                simp [Limits.pullback.condition]))).conjAut.toMonoidHom.comp
            ((fundamentalGroupMap p₂ (c ≫ Limits.pullback.snd p₁ p₂)).comp (MonoidHom.snd _ _))),
      ∀ σ, (e σ).val = (fundamentalGroupMap (Limits.pullback.fst p₁ p₂) c σ,
        fundamentalGroupMap (Limits.pullback.snd p₁ p₂) c σ) := by
  sorry

end TauCetiRoadmap.EtaleHomotopyTypes
