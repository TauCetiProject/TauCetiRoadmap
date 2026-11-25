# Roadmap: horospherical homogeneous spaces

Horospherical homogeneous spaces `G/H`, where `H` contains a maximal unipotent
subgroup of `G`, form a natural class of spherical homogeneous spaces. They
include both algebraic tori (`G` a torus) and flag varieties (`H` parabolic),
and every such space is a torus bundle over a flag variety `G/P`. Their
classification by pairs `(I,M)` is much simpler than that of general
spherical homogeneous spaces (via Luna's spherical systems), which makes them
a natural intermediate step towards the latter. Moreover, unlike general
spherical homogeneous spaces, they are also classified in characteristic
`p ≥ 3` [MT26], so this roadmap is a first step towards a treatment in
positive characteristic.

**Main theorem (Layers 3 and 4).** ([Pas06], Proposition 1.6, pp.13–14.) 
Let `G` be connected reductive, with `B`, `T`, `U` and `S` as in Conventions. 
A horospherical subgroup `H ⊆ G` is *standard* if `U ⊆ H`.

1. (Layer 3) The map `(I,M) ↦ H_(I,M) = ⋂_(χ∈M) ker(χ : P_I → G_m)` is a
   bijection from the set of pairs `(I,M)`, where `I ⊆ S` and `M ≤ X(T)` is a
   sublattice with `⟨α^∨,χ⟩ = 0` for all `α ∈ I`, `χ ∈ M` (such `χ` are viewed
   as characters of `P_I` by Layer 1), onto the set of standard horospherical
   subgroups of `G`.
2. (Layer 4) Each conjugacy class of horospherical subgroups contains exactly
   one standard subgroup. Hence `(I,M) ↦ G/H_(I,M)` is a bijection onto the set
   of horospherical homogeneous spaces `G/H` up to `G`-equivariant isomorphism.



## Out of scope

This roadmap excludes equivariant embeddings, valuations, colors, positive
characteristic and spherical homogeneous spaces that are not horospherical.

## Conventions

- Fix algebraically closed `k` of characteristic zero, connected affine
  reductive `G` of finite type, Borel `B`, maximal torus `T ⊆ B`, and `U=R_u(B)`;
  consume `B=T ⋉ U` from ReductiveGroups.
- Smoothness of `G` and of all closed subgroups is automatic by Cartier's
  theorem, `TauCeti.smoothCommHopfAlgProperty_of_charZero`.
- Closed subgroups are native Hopf ideals, ordered oppositely to geometric
  inclusion, and may be disconnected.
- Write `X(K) = Hom_(k-gp)(K,G_m)` additively; identify `X(T)` with
  `TauCeti.CommHopfAlgCat.additiveCharacterGroup` over the algebraically closed base.
- The positive simple roots `S` come from `B`; `I ⊆ S` lists Levi roots,
  so `P_∅ = B`, `P_S = G`. Fix the simple-root/reflection comparison of
  FlagVarieties §2 and `χ ∘ α^∨(z) = z^⟨α^∨,χ⟩`.
- Use represented fppf quotients, cosets `gH` and left `G`-actions.

## Dependencies

The suppliers are [ReductiveGroups](../ReductiveGroups/README.md) (RG) and
[FlagVarieties](../FlagVarieties/README.md) (FV). Labels name their prose targets;
`gap:` labels are FV's supplier contracts.

| Input | Supplier and exact target, or absent |
| --- | --- |
| Characters, cocharacters, pairing; diagonalizable duality | RG 4, “Tori”; “Diagonalizable groups and groups of multiplicative type” |
| Derived groups and central-isogeny descent | RG 6, “Reductive” |
| Root datum and Weyl group of actual `(G,T)` | RG 7, “Root datum” |
| `B=T ⋉ U`, Levi factors; Borel conjugacy | RG 7, “Parabolic subgroup schemes and Levi decompositions”; “Borel subgroups and maximal tori” |
| Lie algebra, adjoint action, subgroup differentials | RG 2, “Tangent space at the identity / `Lie(G)`”; `Tangent/Lie/Basic.lean`, `Tangent/Representation.lean`, `HopfIdeal/Tangent.lean` |
| Root-space decomposition of actual `Lie(G)` | [RG 7, “Root datum”](../ReductiveGroups/README.md#layer-7-structure-theory); RG 7C.2, “The two specified root subsets”, supplies the root/intersection comparisons; existing `Tangent/RootSpace.lean`, `Tangent/RootSpace/BaseChange.lean` |
| Chevalley basis on actual `Lie(G)`, compatible with root maps | **absent** as an explicit supplier target; §2.1 constructs the normalization and compatibility adapter from RG 7/7C's supplied root data and maps |
| Root subgroups, tangent root lines, associated `SL₂` maps and pinned commutator polynomials | [RG 7C, “ordered unipotent factors and the contraction proof of Bruhat coordinates”](../ReductiveGroups/README.md#layer-7c-ordered-unipotent-factors-and-the-contraction-proof-of-bruhat-coordinates), early root-map construction (first two paragraphs: rank-one central isogeny and rank-two commutators) |
| Extension of a polynomial `G_m → H` curve to `A¹` | **absent**; local target §0.3 |
| Lie inclusion/equality for connected subgroups in characteristic zero | **absent** as an explicit supplier target; §0.3 |
| Identity components and quotients | RG 3, “Identity component `G°` and component group `π₀(G)`”; “Normality and quotients” |
| Standard `P_I`, labels and self-normalization | FV §2.1 “Algebraic realization” (`gap:standard-parabolic-scheme`, RG 7/7b); §2.2 “Standard classification”; §3.1 “Existence and uniqueness of a standard representative”; §3.2 “Pointwise normalizers” |
| Bruhat cells and `G/P` | RG 7, “Bruhat decomposition” and “BN-pairs / Tits systems” (`gap:tits-system-of-points`); FV §4.1 “Containing a Borel implies properness” (`gap:complete-borel-quotient`) |
| Orbit geometry and dimensions | RG 3A.2 “Constructible image and local closedness”; 3A.3 “Finite dimensions, including disconnected groups”; RG 7C.5 “Stabilizers, cell coordinates and existence without a circular premise” |

Tau Ceti paths above and below are under `TauCeti/Algebra/AlgebraicGroup/`.
Use `Derivation.adjointComodule`, `Derivation.adjointWeightSpace`,
`Derivation.isInternal_adjointWeightSpace`, `TauCeti.HopfIdeal.lieSubalgebra`;
§2.1 compares them with the actual root datum and one-dimensional root spaces.

## Layer 0 — Normalizers and definitions

Every closed subgroup has a representable normalizer, and every horospherical
subgroup is conjugate to one containing `U`.

### 0.1 Normalizer of an arbitrary closed subgroup

**Target: `normalizer-of-closed-subgroup`.** For closed `H`, construct `N_G(H)`
using `TauCeti.HopfAlgebra.conjugationComoduleAlgebra`
(`Hopf/Conjugation/Coaction.lean`) and `Submodule.stabilizerHopfIdeal`
(`Representation/Stabilizer/Basic.lean`) on the subspace `J ⊆ O(G)` defining `H`.
Its function action is `(g·f)(x)=f(g⁻¹xg)`.

Prove `N_G(H)(A)={g ∈ G(A) | gH_Ag⁻¹=H_A}` scheme-theoretically for every
`k`-algebra `A`, equivalently normalization on every `A`-algebra `C`.
Use flat scalar extension, the stabilizer criterion, `HopfIdeal.conjugate`
and `baseChangeHopfIdeal` (`HopfIdeal/{Conjugation,BaseChange}.lean`).
Export closedness, finite type, presentation independence, base change,
conjugation equivariance, `H ⊲ N_G(H)`, `N_G(H)=G ↔ J.IsNormal`,
and `N_G(1)=N_G(G)=G`. Identify rational points with the ideal stabilizer
and `Subgroup.normalizer H(k)` by point separation and Cartier smoothness
(`HopfIdeal/Points/Separation.lean`, `Smooth/CharZero.lean`).
Compare with `BialgHom.normalizerHopfIdeal`
(`DiagonalizableGroup/Normalizer/Scheme.lean`) by the universal property.
See Milne (2017), Chapter 1 (normalizers).

### 0.2 Horospherical subgroups

Define `IsHorospherical H` by `∃ g ∈ G(k), gUg⁻¹ ⊆ H`,
and `IsStandardHorospherical H` by `U ⊆ H`.
Use `FiniteTypeCommHopfAlgCat.unipotentRadical` (`Unipotent/Radical/Construction.lean`)
and native conjugation. Give the ideal inclusion criterion, conjugation
invariance, standard implies horospherical, and existence of a standard conjugate.
Reference: [Pas06], Definition 1.1, p.12, uses the standard convention `U ⊆ H`.

### 0.3 Characteristic-zero adapters

Prove `Lie(A) ⊆ Lie(K) ⇒ A ⊆ K` for connected closed `A` and closed `K`:
use `HopfIdeal.exists_finite_subcomodule_stabilizer`
(`Representation/SubspaceStabilizer.lean`), restrict to `A` and apply
`Submodule.exists_subcomodule_iff_forall_differential_mem` (`Representation/LieStable.lean`).
Deduce equality when both are connected with equal Lie algebras.
Prove a polynomial curve `A¹_R → G_R` factoring through closed `H_R` on
`G_m,R` factors through `H_R`, by injectivity of `R[t] → R[t,t⁻¹]`.
See Humphreys, *Linear Algebraic Groups*, §13 (Lie correspondence in
characteristic zero), and Milne (2017), §13.b (limits), respectively.

## Layer 1 — Characters of a standard parabolic

The characters of `P_I` are exactly the characters of `T` annihilating
the coroots indexed by `I`.

From RG 4, 6, 7 and FV §2, prove restriction induces
`X(P_I) ≃+ {χ ∈ X(T) | ∀ α ∈ I, ⟨α^∨,χ⟩=0}`.
Prove injectivity, unique extension, evaluation, additivity and compatibility
with `I ⊆ J`. Characters kill the unipotent radical and the Levi derived group;
identify the remaining condition with descent to the torus abelianization.
Recover `X(B) ≃+ X(T)` and the finite free lattice API.
Reference: [Pas06], proof of Proposition 1.6, p.13.

## Layer 2 — The normalizer and its torus bundle

For standard horospherical `H`, its normalizer `P=HT` is parabolic,
`P/H` is a torus, and `G/H→G/P` is a torsor under that torus.

### 2.1 Lie and rank-one proof of the structure theorem

Adapt [MT26]'s Lie-subalgebra stability, root-intersection “heights” lemma
and smooth-case statements to characteristic zero.

1. Consume the root-space decomposition of the actual `Lie(G)` from
   [RG Layer 7, “Root datum”](../ReductiveGroups/README.md#layer-7-structure-theory),
   and the root subgroups `U_α`, rank-one maps, tangent root lines and pinned
   commutator polynomials from
   [RG Layer 7C, “ordered unipotent factors and the contraction proof of Bruhat coordinates”](../ReductiveGroups/README.md#layer-7c-ordered-unipotent-factors-and-the-contraction-proof-of-bruhat-coordinates),
   early root-map construction (first two paragraphs).
   Construct the remaining normalization and compatibility adapter: differentiate
   these supplied maps and commutators to obtain a Chevalley basis compatible
   with `(G,T,B)`, retaining the central toral summand.
   Prove `[X_γ,X_δ]=N_{γ,δ}X_{γ+δ}`, with
   `N_{γ,δ} ∈ {±1,±2,±3}` when `γ+δ` is a root. Prove every Lie
   subalgebra containing `Lie(U)` is `T`-stable by induction on root height:
   these constants and the requisite Cartan determinants are invertible.
   Descend through central isogenies to the given reductive `G`.
2. For connected standard `H`, apply §0.3 to `H` and its `T`-conjugates.
   Thus `T` normalizes `H`; construct the closed product `HT`, and
   `P=N_G(H) ⊇ HT ⊇ B` is parabolic.
3. Prove `H∩U_{−γ}=P∩U_{−γ}` for every positive root `γ`.
   In the associated `SL₂` map, the source's conjugation curve has value
   `u_{−γ}(−x²)` at zero; §0.3 extends it into `H`.
   Closed subgroups of `G_a` are trivial or `G_a`; algebraic closedness
   and point separation give equality. Descend the rank-one central-isogeny
   calculation. Root generation gives `P=HT` and the split torus `P/H ≅ T/(T∩H)`.
4. For arbitrary standard `H`, `U ⊆ H°` and `H ⊆ N_G(H°)`.
   The connected case gives a torus `N_G(H°)/H°`; its finite subgroup
   `H/H°` is normal. Therefore `N_G(H)=N_G(H°)`, still parabolic,
   `P=HT`, and `P/H` is a torus.

### 2.2 Characters and the torsor

Identify `X(P/H)` with `M_H={χ ∈ X(P) | χ|_H=0}` by character descent;
recover `H` as an intersection of finitely many character kernels.
Define `rank(G/H)=finrank_ℤ M_H`.
Construct `π:G/H→G/P`, the right action `(gH)·(pH)=gpH`, and its fppf
local trivializations. Prove `(x,q)↦(x,x·q)` identifies
`(G/H)×(P/H)` with `(G/H)×_(G/P)(G/H)`.
Consume `HopfIdeal.exists_fppfHomogeneousQuotient_iso_projectiveOrbitPoints`
(`Representation/ProjectiveOrbit/Quotient.lean`) and quotient descent in
`Fppf/Quotient/Homogeneous/{Basic,Torsor,SchemeMap,Scheme}.lean`.
References: [Pas06], Proposition 1.3, pp.12–13 (normalizer and character
kernels), and Remark 1.5, p.13 (torus and fibration).
See Milne (2017), quotients and torsors.

## Layer 3 — Classification of standard subgroups

Standard horospherical subgroups correspond bijectively to pairs `(I,M)`
with `M ≤ X(T)` annihilating the coroots indexed by `I`.

Construct mutually inverse maps between standard `H` and pairs `(I,M)`
with `I ⊆ S`, `M ≤ X(T)`, and `⟨α^∨,χ⟩=0` for `α∈I, χ∈M`.
Send `H` to its unique normalizer label and the restriction of `M_H`;
send `(I,M)` to `H_(I,M)=⋂_(χ∈M)ker(χ:P_I→G_m)`.
A finite lattice basis gives the same defining Hopf ideal `(χ−1)`.
For `Q=N_G(H_(I,M))`, §2.1's root-intersection equality gives
`Q∩U_{−γ}=H_(I,M)∩U_{−γ}⊆P_I∩U_{−γ}`; hence `Q=P_I`.
Recover exactly `M` by diagonalizable duality, both inverse identities,
the quotient torus and rank. Allow unsaturated `M`: `G=G_m, M=nℤ`
gives `H=μ_n`. Include `H_(I,0)=P_I` and the torus case `I=∅`.
References: [Pas06], Proposition 1.6 and proof, pp.13–14; Example 1.2,
p.12 (character kernels); [MT26], characterization by character kernels.

## Layer 4 — Classification of horospherical homogeneous spaces

Horospherical `G/H` are classified up to `G`-isomorphism by the pairs `(I,M)`
of Layer 3, with a unique standard subgroup in each conjugacy class.

Conjugate standard horospherical subgroups `H,H'` have conjugate standard
parabolic normalizers `P,P'`, hence `P=P'`
by FV §3.1. A conjugating `g` normalizes `P`, so `g∈P(k)` by FV §3.2;
normality `H⊲P` yields `H'=H`.

Prove `G/H ≅_G G/H'` exactly when `H,H'` are conjugate, by evaluating
at the identity coset, using the rational-coset comparison over `k`, and
descending the converse map through the native quotient.
Combine standardization, uniqueness and Layer 3 for the main bijection,
with inverse `(I,M)↦[G/H_(I,M)]`.
Reference: [Pas06], Proposition 1.6, pp.13–14 (classification).
See Borel, *Linear Algebraic Groups*, 11.16 (parabolic subgroups are self-normalizing).

## Independent layer — Open Borel orbit and dimension

This layer shows that horospherical homogeneous spaces are spherical;
no other layer depends on it.

The space `G/H` has an open Borel orbit and satisfies
`dim(G/H)=dim(G/P)+rank(G/H)`.

For standard `H`, lift `w₀` to `n₀ ∈ N_G(T)(k)`.
Prove the open orbit `Bn₀H/H` is the inverse image of `Bn₀P/P`:
`P∩n₀⁻¹Bn₀→P/H` is surjective through `T→P/H`.
Use RG 7/7C and `TauCeti.longestElement`
(`TauCeti/LinearAlgebra/RootSystem/LongestElement.lean`).
Using the definition of rank in §2.2, prove
`dim(G/H)=dim(G/P)+rank(G/H)` using native Krull dimension,
torus duality and the torsor's constant relative dimension.
Prove lift independence and transport the orbit, rank and formula under conjugation.
References: [Pas06], Definition 1.4 and equation (1.4.1), p.13 (rank and
dimension); unnumbered paragraph after Definition 1.7, p.14 (open Borel
orbit).

## Realizable now

Only Layer 0 is realizable against the existing APIs.
Layers 1–4 consume ReductiveGroups Layer 7 and FlagVarieties §2;
implement those supplier targets before their consumer layers.
The independent layer also consumes RG 7/7C (Bruhat decomposition and `w₀`)
and can be developed in parallel with Layers 3–4, after Layer 2.

## References

Thesis pages are printed page numbers. Its statements are over `ℂ`;
this roadmap proves the stated characteristic-zero versions over `k`.

- **[Pas06]** B. Pasquier, *Variétés horosphériques de Fano*, thesis,
  Université Joseph Fourier (Grenoble I), 2006;
  [HAL](https://theses.hal.science/tel-00111912).
- **[MT26]** M. Maccan, R. Terpereau, *Horospherical subgroups in positive
  characteristic*, Canad. Math. Bull. (2026), 1–28,
  [doi:10.4153/S0008439526102288](https://doi.org/10.4153/S0008439526102288).
- J. S. Milne, *Algebraic Groups*, Cambridge University Press, 2017.
- J. E. Humphreys, *Linear Algebraic Groups*, Springer, 1975.
- A. Borel, *Linear Algebraic Groups*, second edition, Springer, 1991.
