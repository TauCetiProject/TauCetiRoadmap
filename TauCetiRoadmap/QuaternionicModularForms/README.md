# Quaternionic modular forms

Develop adelic coefficient-valued functions and Hecke actions for quaternion
algebras over arbitrary number fields, and their classical and overconvergent
modular-form theory in the totally definite case. The latter includes finite
adelic class sets, analytic weight actions, explicit Hecke matrices, Fredholm
determinants and finite-slope parts, and small-slope classicality over `ℚ`.
Evaluation on double-coset representatives identifies coefficient-valued functions
with a product of stabiliser invariants. With finite class sets and the definite
stabiliser theorem, this gives the finite products of Banach modules used in
the analysis. The automorphic forms on `Dˣ` of ArithmeticLocallySymmetricSpaces
are specialised to every quaternion algebra over every number field, compared
with the definite coefficient model, and specialised to Bianchi forms for
`M₂(F)` over an imaginary quadratic field.
Boundary-of-weight-space slope phenomena motivate the uniform estimates below.
The full annular family uses a separate weighted Mahler coefficient module;
ordinary analytic disc stages have weight-dependent admissibility bounds.

This README is the mathematical specification. All targets and checks below are
required. [Suggested.lean](Suggested.lean) fixes representative interfaces against
the pinned Mathlib and Tau Ceti libraries; its admitted theorem proofs are targets,
not completed results. It is not an exhaustive checklist. Production code imports
library modules, not another roadmap's prototype.

## Scope and dependencies

| Supplier or neighbour | Interface used here | Boundary |
| --- | --- | --- |
| [Restricted power series][RestrictedPowerSeries] ([PR #919](https://github.com/TauCetiProject/TauCetiRoadmap/pull/919)) | Native one- and several-variable restricted series, Gauss norms, substitution, coefficient recovery, derivatives and entire series | All generic series algebra and analytic identity theorems belong there |
| [P-adic functional analysis][PadicFunctionalAnalysis] ([PR #930](https://github.com/TauCetiProject/TauCetiRoadmap/pull/930)) | Banach–Tate modules, `C₀`, bounded matrices, analytic disc stages, characters, orthonormalisability and property (Pr) | This roadmap supplies the arithmetic weight data and form spaces, not another functional-analysis library |
| [Compact operators][CompactOperators] ([PR #932](https://github.com/TauCetiProject/TauCetiRoadmap/pull/932)) | Row compactness, determinants, Riesz projectors, finite-slope summands, base change and principal-minor estimates | This roadmap proves the hypotheses for its Hecke operators and interprets the results |
| [Newton polygons][NewtonPolygons] ([PR #926](https://github.com/TauCetiProject/TauCetiRoadmap/pull/926)) | Coefficient bounds, root/slope dictionaries and scalar slope factors | No duplicate polygon, preparation or root-counting theory |
| [Quadratic-form invariants](../QuadraticFormInvariants/README.md), Layer 2, and [Semisimple algebras](../RepresentationTheory/SemisimpleAlgebras/README.md) | Native quaternion presentations, norm forms, conjugation, base change, splitting and central simple algebras | Generic quaternion and central-simple algebra theory stays there; §0.1 supplies the degree-two and arithmetic comparisons |
| [Global number fields](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields) and Mathlib | Number fields, completions, finite adeles, product formula and local–global comparison | General adelic and commutative order theory stay there; the quaternionic order calculations needed below belong here |
| [Modular forms, Layer 2(a)](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms) | The abstract Hecke ring built on Mathlib's double-coset definitions | Construct its action on quaternionic forms here, not its convolution ring a second time |
| [Adelic algebraic groups, PR #792](https://github.com/TauCetiProject/TauCetiRoadmap/pull/792) | General adelic-group comparisons and Hecke-pair finiteness where needed | Its general class-number, reduction, neat-level and volume theorems stay there; it consumes §0.3's quaternionic class-set and stabiliser interfaces |
| [Arithmetic locally symmetric spaces][ArithmeticLocallySymmetricSpaces] ([PR #871](https://github.com/TauCetiProject/TauCetiRoadmap/pull/871)) | ALS.F.6's automorphic forms, constant terms and cusp forms, ALS.F.7's algebraic weights, ALS.0.4–0.8's `X^G` and `X_K`, ALS.1.1's local systems, ALS.3.1's Hecke action on invariants and ALS.5b.5's cuspidal cohomology | §§2.4–2.6 specialise these to `GL_1(D)`; no second automorphic-form, locally-symmetric-space or cuspidal-cohomology definition is made here |
| [Automorphic forms on reductive groups][AutomorphicFormsOnReductiveGroups] ([PR #1037](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1037)) | §7.4's `inverseActionHeckeEquiv` and rational covariance model, §7.5's `automorphicEquiv`, §7.6's central-character carrier | Those sections specialise §§2.1 and 3.1, and §2.5 consumes them; the dependency is at the theorem level in both directions |
| [Kleinian groups][KleinianGroups] ([PR #432](https://github.com/TauCetiProject/TauCetiRoadmap/pull/432)) | The upper half-space `H^3` with its `PSL(2,ℂ)` action and the Bianchi groups `PSL(2,𝒪_F)` | §2.6 identifies the symmetric space of `GL₂` over an imaginary quadratic field with `H^3`; hyperbolic geometry, fundamental domains and covolumes stay there |
| [FLT division-algebra finiteness](https://github.com/ImperialCollegeLondon/FLT/blob/f6c6a2fe9796d6d89cd2a0d24e8a453729d881ff/FLT/DivisionAlgebra/Finiteness.lean) | `units_cocompact` and `finiteDoubleCoset`, after a compatible port | Reuse the division-algebra theorem and prove the carrier/topology comparison; do not develop a second general reduction theory |
| [AdicSpacesPartII, PR #817](https://github.com/TauCetiProject/TauCetiRoadmap/pull/817), *completed-tensor-banach-module*, and CompactOperators §1.7 | Native completed Banach-module scalar extension and the general `c0_completedBaseChange` comparison | Tensor carriers and functoriality stay with Part II; [LocallyAnalyticDistributions, PR #854](https://github.com/TauCetiProject/TauCetiRoadmap/pull/854), §4.2 consumes the comparison for distributions |
| Geometric and automorphic roadmaps | The forms and Hecke/Fredholm data constructed here | Weight-space representability, eigenvariety gluing, Jacquet–Langlands and Galois representations are downstream |

The dependence on PR #792 is not circular: its general Hecke machinery can supply
§3.1, while its later quaternionic volume application consumes §0.3. Prove §0.3
from quaternionic definiteness and the FLT comparison, independently of that
volume application. General reductive-group foundations are not new milestones
of this roadmap. The class-set/stabiliser contract consists of `Dfx`, `unitsIncl`,
`globalUnits`, `classSet`, `finite_classSet` and `DefiniteQuaternion.finite_stab`.
These replace the former `OverconvergentForms` supplier name. The reciprocal
supplier row and AA.5.3 in [#792 at `0f2c303`](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0f2c303908e99d7a682447cc3aa1048092f8ce3c/TauCetiRoadmap/AdelicAlgebraicGroups/README.md)
now name these six interfaces and §§0.2–0.3. Their representative signatures are
in `TauCetiRoadmap.QuaternionicModularForms`; implementations use the shared
library declarations, not imports of that prototype namespace. The comparison
also conjugates `U ∩ x⁻¹Dˣx` to `Dˣ ∩ xUx⁻¹`. Weighted class numbers, quotient
measures and volume identities remain with AA.5.3.

[GL2AutomorphicRepresentationsAndTransfer, PR #931](https://github.com/TauCetiProject/TauCetiRoadmap/pull/931),
Layers R17.1–R17.3, owns quaternionic local/global Jacquet–Langlands,
ramification realization and the representation-theoretic transfer. Its
R17.3.9 consumes §2.1's generic form carrier and evaluation, §2.2's classical
definite forms and §3.1's Hecke action. It owns the specialized coefficient
representations, central-character subspaces, division-place coefficient adapter,
the comparison with Pan's spaces, norm-character decomposition and transfer
theorems. The adapter records §1.3's dual/right-action and
determinant-normalization dictionaries; division-place coefficients use §2.1
without a split-place analytic chart, and its finite-level realisation is the
instance of §2.5 at a division place. Its R16.1.6 owns the `GL₂` finite-level
restriction adapter that §2.4 extends to `Dˣ`. These form spaces do not depend
on that transfer.
[AlgebraicModularFormsAndSerreWeights, PR #928](https://github.com/TauCetiProject/TauCetiRoadmap/pull/928)
owns geometric forms on modular stacks, characteristic-`p` theta and Serre weights;
the characteristic-zero coefficient derivative in Layer 5 is a different operation.
Neither general automorphic representation theory nor those geometric forms are
constructed here.

**Generality.** Quaternionic algebra and adelic carriers (§§0.1–0.2), local
coefficient actions (Layer 1), abstract evaluation (§2.1), and algebraic
finite-coset Hecke actions (§§3.1–3.2) carry no blanket total-reality or
definiteness assumption. Local analytic constructions require splittings only
at the places where they are used. The class-set theorem in §0.3 uses the
central division-algebra hypothesis; the stronger stabiliser theorem requires
`F` totally real and `D` ramified at every real place. State these hypotheses
at their uses in the global classical and overconvergent applications.

This definite condition makes `Dˣ(F⊗ℝ)` compact modulo its centre. At a complex
place `D⊗_Fℂ≃M₂(ℂ)`, so that compactness fails. Finiteness of the finite adelic
class set alone does not give finite stabilisers modulo the centre or the
averaging projections of §2.3. Bianchi forms and other nondefinite automorphic
forms therefore need the archimedean automorphic realisation in addition to these
algebraic interfaces. Section 2.4 supplies it for every quaternion algebra over
every number field by specialising ArithmeticLocallySymmetricSpaces ALS.F.6,
§2.5 compares it with the definite coefficient model `M(U,A)`, and §2.6 is the
Bianchi case `D=M₂(F)` over an imaginary quadratic field. The overconvergent and
Fredholm theory of Layers 3–5 is the definite one. See Loeffler, Assumption 3.1.3
and Proposition 3.1.4.

## Conventions and library floor

1. `F` is a number field and `D` a quaternion algebra over `F`, represented by
   an existing central simple `F`-algebra carrier of dimension four. Total
   definiteness means that `F` is totally real and every real base change of `D`
   is Hamilton's algebra; assume it only for the results that use it. For each
   selected finite place `v | p` with an analytic coefficient construction, carry
   a splitting `D ⊗[F] F_v ≃ₐ[F_v] M₂(F_v)` as data, with maximal-order
   compatibility for integral levels. The general adelic and abstract
   coefficient-module definitions require no such splitting.
2. Write `D_fˣ = (D ⊗[F] 𝔸_F^f)ˣ`. Give the tensor product its canonical
   `𝔸_F^f`-module topology and the units their native units topology, recording
   the comparison with local restricted products. An arbitrary topology is not
   an acceptable hypothesis for a finiteness theorem.
3. Field-valued analysis uses a complete ultrametric extension `K/ℚ_p` containing
   the local embeddings required for the selected places, with `|p|=p⁻¹`.
   Families use a complete commutative Banach–Tate `K`-algebra `R`, possibly
   nonreduced. State contractivity, invertibility of finite group orders and
   Noetherian hypotheses at the theorem that needs them. Integral Banach–Tate
   variants may instead use supplied weight-action data; do not silently invert
   `p` there.
4. A coefficient action is a **right** action of a submonoid `Δ ≤ D_fˣ`:
   `(a | δ) | ε = a | (δε)`. Encode it by an action of `Δᵐᵒᵖ`, or equivalently
   an antihomomorphism into endomorphisms. For functions use
   `(φ | δ)(g) = φ(gδ⁻¹) | δ`. Thus level forms satisfy
   `φ(γgu)=φ(g)|u`, for `γ ∈ Dˣ`, `u ∈ U`. Keep this convention through coset
   representatives, matrix multiplication and Hecke-ring transport.
5. The general local weight action, with a separately specified determinant twist, is
   `f |κ γ (z) = n(cz+d) ν(det γ) f((az+b)/(cz+d))`, with the character value
   interpreted by its analytic expansion in Layers 1–3, and pointwise on
   `ℤ_p` in the separate Mahler construction of §4.4. In several variables take the product
   over embeddings. The extension `ν : F_vˣ → Rˣ` is normalised by `ν(π_v)=1`.
   The single-character constructor takes `ν=1`; over `ℚ`, Jacobs's character
   `κ_J` gives `n(u)=κ_J(u)u⁻²`. Section 1.1 records this dictionary.
   Distinguish the normalised determinant twist from an algebraic determinant
   character; §1.3 gives the scalar relating their Hecke operators.
6. `M(U,A)` is the coefficient-valued finite-level function space of §2.1,
   defined over any number field. For totally definite `D` it gives the
   quaternionic forms denoted `L(U,A)` or `S^D` in the sources; that `S` imposes
   no additional cuspidality condition here. Weight two can contain constant
   forms and reduced-norm characters. Bianchi forms are not a case of `M(U,A)`;
   they are the automorphic specialisation of §2.6.
7. Set `Γ_x = U ∩ x⁻¹Dˣx`. For totally definite `D` and compact `U`, it is
   finite modulo its diagonal central subgroup, and finite itself over `ℚ`.
   Abstract evaluation identifies functions with `∏_x A^{Γ_x}` without these
   finiteness hypotheses.
   Trivial stabiliser **action** is a separate, explicit hypothesis; it is not
   the definition of a neat level. Finite-image stabiliser actions with invertible
   image orders give bounded averaging projections and property (Pr).
8. In matrices `aᵢⱼ` is the output-`i`, input-`j` entry. For several selected
   places the compact controlling operator is the product of the `U_v` which
   contracts **every analytic coordinate**. An individual `U_v` need not be
   compact if another place still contributes an infinite-dimensional analytic
   factor. Slopes refer to nonzero eigenvalues, counted with algebraic
   multiplicity, and to an explicitly chosen normalisation of the operator.
9. Automorphic forms on `Dˣ` are those of ArithmeticLocallySymmetricSpaces
   ALS.F.6 for the connected reductive `F`-group `G=GL_1(D)` of §0.1, with that
   roadmap's maximal compact `K_∞`, split component `A_∞`, symmetric space
   `X^G=G(F_∞)/K_∞A_∞` and level space `X_U`. An **archimedean type** is an
   irreducible algebraic representation `W` of `Res_{F/ℚ}G` over a splitting
   field (ALS.F.7). Forms of type `W` have the infinitesimal character of `W`
   and the central character of `W` at infinity; the cohomological coefficient
   system they pair with is `W^∨`. `D_fˣ` acts on automorphic forms by right
   translation, and `[UηU]` acts on `U`-invariants by `Σ_i f(·η_i)` for
   `UηU=⊔_i η_iU` (ALS.3.1). The operator `T_η` of §3.1 on trivial
   coefficients is this `[Uη⁻¹U]`; AutomorphicFormsOnReductiveGroups §7.4's
   `inverseActionHeckeEquiv` is the general dictionary.

Mathlib supplies `QuaternionAlgebra`, tensor products, `Algebra.IsCentral`,
`IsSimpleRing`, number fields and finite adeles, `DoubleCoset`, `IsHeckeTriple`,
`HeckeCosetModule`, continuous linear maps, restricted series and derivatives.
Tau Ceti supplies `QuaternionAlgebra.normForm`, its multiplicativity and
invariance under algebra equivalences, and quaternion base change and splitting
in `TauCeti/Algebra/Quaternion/{NormForm,AlgEquiv,BaseChange,Split,CentralSimple}`.
Its `NumberTheory/HeckeRing/{Basic,Multiplication,Associativity,One,Representation}`
modules provide coset sums and the abstract Hecke product. Reuse these APIs.
A suitable home is `TauCeti/NumberTheory/AutomorphicForm/Quaternionic/`, with
missing general algebra, adelic and matrix lemmas extending the native libraries.

Follow the API directions of [Mathlib #41538](https://github.com/leanprover-community/mathlib4/pull/41538)
for central simplicity of quaternion presentations,
[#28970](https://github.com/leanprover-community/mathlib4/pull/28970) for reduced
norms and traces, and [#41277](https://github.com/leanprover-community/mathlib4/pull/41277)
for the Hecke product. The degree-two presentation comparison below must prove
choice independence and descent; an unreconciled splitting-field formula does
not supply a base-field reduced norm. The intrinsic coset-decomposition work in
[#43327](https://github.com/leanprover-community/mathlib4/pull/43327) is a comparison
interface for the explicit certificates, not a second Hecke ring. Build missing
results in Tau Ceti in the native API shape, without waiting for these proposals.

## Layer 0: quaternion algebras, levels and definite finiteness

### 0.1 Quaternionic and local data

**Reduced norm and definiteness.** Work over an arbitrary number field for
presentation, reduced norm, involution and base change. Consume the native
presentation theory from QuadraticFormInvariants Layer 2. For an abstract central
simple `F`-algebra of dimension four, supply a presentation `D ≃ₐ[F] ℍ[F,a,b]` with `a,b≠0` and use
`QuaternionAlgebra.map_star_of_algEquiv`, `reducedTrace_eq_of_algEquiv` and
`normForm_eq_of_algEquiv` to prove independence of the chosen presentation.
Transport the involution, reduced trace and norm, and prove their base-change
comparisons using the native quaternion equivalences. This adapter, rather than
a second quaternion norm theory, is the target.

Under a splitting, identify reduced norm with the determinant of the `2 × 2`
matrix. The determinant of left multiplication on the four-dimensional algebra is
its **square**; its trace is twice the reduced trace (consume native
`QuaternionAlgebra.trace_mulLeft` in the presentation). When `F` is totally real
and `D` is totally definite, prove positivity of the reduced norm of nonzero
elements at every real embedding, and derive its division-algebra structure.
The algebraic comparisons must also work for the split presentation used in
the local models.

**The algebraic group `GL_1(D)`.** Construct the affine `F`-group `GL_1(D)` whose
points in a commutative `F`-algebra `R` are `(D ⊗[F] R)ˣ`, naturally in `R`, with
the reduced norm as a homomorphism to `G_m` and the norm-one group `D¹` as its
kernel. Prove that it is connected reductive, an inner form of `GL₂` split by
every splitting field of `D`, with centre `G_m` and derived group `D¹`; for
`D=M₂(F)` it is `GL₂`. Consume ReductiveGroups Layer 6 for reductivity and the
semisimple-algebra roadmap for the central simple inputs; AdelicAlgebraicGroups
§4.2 uses `D¹` with this norm. This is the group to which §§2.4–2.6 apply the
automorphic-form and locally-symmetric-space suppliers.

**Local integral models.** Construct local component maps and their units/matrix
versions. For a chosen quaternion order and compatible split maximal orders,
identify the integral units with `GL₂(𝒪_v)`. Establish the basis-independent
topological comparison needed for these maps and use existing number-field
completion results. No classification of all quaternion algebras or all their
orders is required.

**Checks.** For `ℍ[ℚ]`, the norm is the sum of four squares, its nonzero rational
values are positive, and its real base change is Hamilton's algebra. For a split
matrix algebra check `nrd(diag(a,b))=ab` and the regular determinant `(ab)²`.

### 0.2 Adelic levels and norm characters

**Adelic group.** Define `Dfx`, `unitsIncl` and `globalUnits` using native units
and tensor-product maps; prove injectivity, the local-component formulas and the
canonical topology comparison. Supply the local compactness, Hausdorffness and
totally disconnected properties needed by the level theory through the shared
adelic infrastructure. Identify `D_fˣ` with the finite adelic points
`GL_1(D)(𝔸_F^f)` of AdelicAlgebraicGroups §§1.1–1.2 as topological groups,
through the restricted product of the `D_vˣ` with respect to the unit groups of
a maximal order, and `globalUnits` with the diagonal image of the rational
points; likewise `(D⊗_ℚℝ)ˣ=GL_1(D)(F_∞)` and the full adelic group. These
comparisons are what AdelicAlgebraicGroups AA.5.3 and §§2.4–2.6 consume.

**Levels.** Define the maximal-order level and the congruence levels at specified
split places. In `GL₂(𝒪_v)`, use `U₀(π_v^t)={γ : c∈π_v^t𝒪_v}` and
`U₁(π_v^t)={γ : c∈π_v^t𝒪_v, d−1∈π_v^t𝒪_v}`; the latter fixes the last
row modulo `π_v^t` and imposes no additional condition on `a`. At `t=0` both
are the full integral group. Assemble `U₀(𝔫)` and `U₁(𝔫)` by local exponents.
Prove compactness and openness, finite index under level inclusion and the local
reduction-quotient descriptions. A wild level has its `p`-component in the monoid
on which the chosen coefficient action is defined. Classical polynomial
coefficients also allow full maximal-order level; analytic Tate coefficients
generally do not.

**Norm character.** Construct the finite idelic absolute norm of `nrd(g)` as a
positive rational number; show it is trivial on compact subgroups and compare
its value on global elements with the product of archimedean norms. Over `ℚ`,
definiteness gives
`c(g)=|nrd(g)|_f det(g_p) ∈ Kˣ`, with `c(Dˣ)=1` and `c(u)=det(u_p)`
for level units. For `η_v=diag(π_v,1)` supported at `v`, the general value
is `c(η_p)=π_p/p`; it is one with the standard rational uniformiser `π_p=p`.
For a prime `ℓ≠p`, `c(η_ℓ)=ℓ⁻¹`, independently of the unit in `π_ℓ`.
The theta–Hecke scalar `|nrd(η_p)|_f⁻ʳ=pʳ` is independent of the unit in
`π_p`. This particular global character is used only over `ℚ` in Layer 5.

### 0.3 Class sets and stabilisers

**Finite class set.** Define `classSet U = Dˣ \ D_fˣ / U` using `DoubleCoset`.
For a central division algebra `D` over a number field `F`, prove
`finite_classSet` for every open subgroup `U` by comparison with FLT's
`finiteDoubleCoset`; no total-reality assumption is needed for this comparison.
Totally definite quaternion algebras satisfy the division hypothesis by §0.1.
Make the carrier, embedding and module-topology identifications explicit.
Extract finite representatives, factorisations `g=γcᵢu`, and the refinement maps for level inclusions.

**Stabiliser finiteness (`DefiniteQuaternion.finite_stab`).** Assume `F` is
totally real and `D` is totally definite. For any **compact subgroup** `U`
and any `x : D_fˣ`, let `Γ_x=U∩x⁻¹Dˣx` and
`Z_x=Γ_x∩image(Fˣ)`. Prove that `Z_x` is central and normal in `Γ_x`, that
`Γ_x/Z_x` is finite, and that `Γ_x` is finite if `[F:ℚ]=1`. Compact openness is
not required for this theorem. Use total definiteness at every real embedding;
over a general totally real field the central units can be infinite. Conjugation
identifies this convention with `Dˣ∩xUx⁻¹`. Loeffler, Proposition 3.1.4,
supplies the compact-open argument modulo the centre. Prove that a compact
subgroup is contained in a compact open subgroup of this adelic group and
inject its central quotient into the larger one to obtain the stated compact
version. Over `ℚ`, compactness forces a central rational unit to have valuation
zero at every finite prime, hence to lie in `{±1}`.

**Checks.** Prove `hamilton_negative_norm`:
`¬ ∃ q : ℍ[F], Quaternion.normSq q = -1` for a totally real number field `F`.
Prove `stab_top`: at `U=⊤` the stabiliser is the conjugate of all global units;
it is infinite because it contains the diagonal `Fˣ`. This is a failure of the
compactness hypothesis, not an exception to the theorem. Also test the central
quotient at a maximal-order level over a real quadratic field.

These are the interfaces consumed by AdelicAlgebraicGroups AA.5.3. That roadmap
owns the resulting weighted class-number/volume comparison, including its
central-index factor. Do not reproduce that formula as another target here.

### 0.4 Local monoids and double-coset certificates

At a selected local field `L=F_v`, define the matrix monoid with
`a,b,c,d ∈ 𝒪_L`, `d ∈ 𝒪_Lˣ`, `c ∈ π^t𝒪_L`, `det γ ≠ 0`, for `t≥1`.
Prove closure, its action on `𝒪_L` by fractional linear transformations, and
its comparison with the norm-bound formulation `‖c‖≤ρ<1`. Include the
`Σ₀(t)` notation for this monoid and `Σ₁(t)` for its submonoid with
`d−1∈π^t𝒪_L`. On invertible integral matrices these give the respective
`U₀` and `U₁` conditions. Keep Jacobs's `Σ_α` (our `Σ₀(α)`) distinct from
this `Σ₁(t)` notation.

For a level with the usual local `U₀(π^t)` or `U₁(π^t)` condition, prove the
disjoint decomposition of `Uη_vU` into right cosets `Ux_α` of `U`
(representatives of the left quotient `U \ (Uη_vU)`), where
`x_α=((π,0),(π^t α,1))` and `α` runs over a chosen residue-field section.
Record the precise level hypotheses; it is not a formula for every compact
open subgroup contained in an Iwahori. Prove independence of the section and
the analogous good-prime decompositions used by `T_v` and central `S_v`.

**Checks.** There are `#k_v` terms for `U_v`, `#k_v+1` at an unramified good
prime for `T_v`, and one term for a normalising element. Keep `Ux_α` explicitly
in the notation to avoid conflicting names for left and right cosets.

### 0.5 Checks on the scope of the arithmetic interfaces

Instantiate the adelic carrier, local split matrices and level definitions for
`D=M₂(F)` over an imaginary quadratic field. This checks that their definitions
have no total-reality assumption. At maximal integral level the stabiliser at
one contains the distinct upper unipotent matrices `((1,n),(0,1))`, `n∈ℤ`.
Their images modulo scalar matrices are distinct, so this stabiliser is infinite
modulo diagonal central scalars. This example detects a missing definiteness
hypothesis in §0.3. The Bianchi form space itself is the automorphic
specialisation of §2.6, whose components are quotients of hyperbolic 3-space by
these infinite groups.

## Layer 1: weights and coefficient actions

These local constructions apply at the chosen split finite places of a
quaternion algebra over any number field. Global finite-image conditions on
central units are separate hypotheses for forming definite Banach modules.

### 1.1 Analytic weight data

Let `Σ_v` index embeddings `F_v ↪ K`. Work in the native restricted algebra
`R⟨z_σ : σ∈Σ_v⟩` supplied by RestrictedPowerSeries. The single-character
entry point takes a continuous automorphy character `n : 𝒪_vˣ → Rˣ` and
its analytic expansion. The general construction additionally takes a
continuous determinant character `ν₀ : 𝒪_vˣ → Rˣ`, extended to `F_vˣ`
by `ν(π_v^e u)=ν₀(u)`; the untwisted constructor sets `ν₀=1`.
Normalising `ν(π_v)=1` alone does not make `ν₀` trivial.
The wild level and the expansion radius are part of the analytic data.

**Single-character and pair conventions.** Over `ℚ`, provide the constructor
from Jacobs's single character `κ_J : ℤ_pˣ → Rˣ` by setting
`n(u)=κ_J(u)u⁻²` and `ν=1`. Its action is
`f|κ_J γ(z)=κ_J(cz+d)(cz+d)⁻² f((az+b)/(cz+d))`, with the character value
interpreted through its expansion. Thus `κ_J(u)=u^k ε(u)` has polynomial
degree `k−2` for `k≥2`, at a level where `ε` is constant on the analytic
discs. Our degree-`m` convention corresponds to `κ_J(u)=u^{m+2} ε(u)`.
Prove equality of these actions and hence of their form spaces and Hecke
operators. Source: Jacobs §1.5, Definition 1.27, equation (1.5.13).

The general pair `(n,ν₀)` can equivalently be packaged as **one character of
the product group** `χ : 𝒪_vˣ × 𝒪_vˣ → Rˣ`, with
`χ(x,y)=n(x)ν₀(y)` and inverse projections `n(x)=χ(x,1)`, `ν₀(y)=χ(1,y)`.
Prove these constructions inverse, including continuity. This is an encoding
of the same two pieces of data, not a reduction to a character of `𝒪_vˣ`.
Keep the determinant twist explicit in the general API; the Jacobs interface
requires only its single unit character. Compare Buzzard, *Eigenvarieties*
§§8–10, which uses the product-group character.

**Central action.** A scalar unit `uI` acts through `n(u)ν₀(u)²`.
At all selected places combine these characters with any fixed algebraic
coefficient factors. The resulting character on global central units must
have finite image for §2.3's finite-quotient argument; over a family require
a common finite quotient. Over a totally real field, the parallel condition
of §1.3 supplies this for algebraic coefficients. Setting the determinant twist to one does not retain all
nonparallel algebraic weights over a general totally real field.

Build coefficient actions in two compatible ways. The first takes bounded restricted
automorphy factors with their substitution cocycle. The second derives these
factors from characters and analytic expansions, proving the cocycle. This
allows explicit weights over nonreduced or integral coefficient rings without
an argument that tries to detect nilpotents by field-valued points.

For quantitative estimates carry `0≤η<1` and
`‖coeff_m j_κ(γ)‖≤η^{|m|}` in addition to unit-radius restrictedness. Keep
`η` separate from the level bound `ρ` on the lower-left entry. Such an estimate
gives restrictedness at every radius `r` with `rη<1`; it does **not** give it at
the endpoint `r=η⁻¹`.

Prove that continuous field-valued characters become analytic on sufficiently
small principal-unit subgroups. The depth depends on the character; uniform
family depths require the bounds in §4.3. Consume the shared character/logarithm
analysis and PFA §§4.6, 5.4–5.5's scalar expansion bounds. For a general `F_v`,
supply the arithmetic comparison between a
`ℤ_p`-basis and the `Σ_v` coordinates; the embedding matrix is invertible but
need not be an isometry. Shrink the polydisc when necessary. Use the shared
coefficient-recovery theorem to prove uniqueness of expansions, with its actual
hypotheses on the coefficient algebra, rather than treating scalar points as
automatically jointly injective for every ring.

**Checks.** Jacobs's `κ_J(u)=u²` gives `n=1`, with the constant polynomial
line as the weight-two classical coefficient module. On `diag(u,1)`, the
constant function transforms by `ν₀(u)`; this detects a nontrivial determinant
twist even though `cz+d=1`. Test the product-character dictionary and the
scalar-unit formula. Also test algebraic and finite-order characters; a
continuous character with the complete torsion-character component specified;
and a weight with values
in `K[ε]/(ε²)`. At `p=2` use the correct logarithmic principal-unit subgroup.
Verify a geometric series whose coefficients attain `η^m` fails the endpoint
restrictedness test.

### 1.2 Slash action and generating functions

Construct the action by bounded multiplication and analytic substitution:
`w_{γ,σ}=(σ(a)z_σ+σ(b))/(σ(c)z_σ+σ(d))` and
`f|γ=j_κ(γ)·f(w_γ)`. Prove preservation of the restricted algebra, boundedness,
the identity and right-action laws, and independence of equivalent expansion
data. On an integral norm model require the stated bounds on `j_κ` and `w_γ`
to obtain `‖slash γ‖≤1`. Compactness of a character's domain alone does not
imply this norm bound for an arbitrary Banach-algebra norm.

The column indexed by `r` is `j_κ(γ)∏_σ w_{γ,σ}^{r_σ}`. Establish the
generating-function identity
`∑_r (z^r|γ) X^r = j_κ(γ)∏_σ(1-X_σ w_{γ,σ})⁻¹` as a formal series in the
input variables, with restricted output-series coefficients. Derive its matrix
entries and their estimates using the shared series algebra. The kernel is a
description of this action, not a second definition of a bounded operator.

For `‖c‖≤ρ<1`, `‖det γ‖≤σ<1` and `ρ≤σ`, the nonconstant coefficients
of `w_γ` have the required geometric decay. Together with
`‖coeff_m j_κ(γ)‖≤η^{|m|}` and `η≤σ`, prove
`‖a_{m,r}(slash γ)‖≤σ^{|m|}`. State the corresponding product estimate with
one contraction factor per variable. Without a geometric bound on `j_κ`,
prove compactness by bounded multiplication composed with a strictly
contracting substitution; do not claim the same explicit row estimate.

### 1.3 Algebraic weights and normalisation

For `n_σ∈ℕ`, `v_σ∈ℤ`, define the classical polynomial module
`L_{n,v}=⊗_σ Sym^{n_σ}(K²)⊗det^{v_σ}`, in the polynomial convention whose
action is `∏_σ(c_σz_σ+d_σ)^{n_σ}(det γ_σ)^{v_σ}` times substitution.
Identify it with the coordinatewise degree-bounded polynomials and prove its
dimension `∏_σ(n_σ+1)`, stability and injection into analytic coefficients.
Allow a finite-order character constant on the discs specified by the level.

For the globally algebraic theory over a totally real field, require
`n_σ+2v_σ` to be parallel, or state the required finite-image condition on the
central unit action directly. Over a general number field retain the explicit
finite-image hypothesis whenever it is used, without asserting this parallel
criterion in that generality.
Write the dictionary to the source's weights explicitly:
`k_σ=n_σ+2`, `w_σ=v_σ+n_σ+1`. This is what ensures the required behaviour
on a finite-index subgroup of global units. Use native symmetric powers and
`Representation.symmetricPower`; specify the opposite-action/dual adapter
when comparing that representation with the right polynomial action.

The algebraic determinant character is `ν_alg(x)=∏_σ σ(x)^{v_σ}`. With
`ord_v(π_v)=1`, the normalised extension is
`ν_norm(x)=ν_alg(π_v^{-ord_v(x)}x)`. Prove
`ν_alg(x)=ν_alg(π_v)^{ord_v(x)}ν_norm(x)`. The two actions coincide on
level units; on a Hecke double coset of determinant valuation `e` their
operators differ by `ν_alg(π_v)^e`. Carry that scalar through the classical
inclusion, eigenvalues, Fredholm rescaling and slope shifts. State compatibility
under changing the chosen uniformiser.

**Checks.** At polynomial degree zero the classical coefficient space is a
line, while the analytic coefficient space is still infinite dimensional.
Test the determinant twist on `diag(π,1)`, a scalar unit and a uniformiser
change. Verify that an odd scalar action of `-1 ∈ Γ_x` kills that invariant
space in characteristic zero.

### 1.4 Several places and disc stages

Tensor the local constructions over all selected places and embeddings, with
finite algebraic factors at any places that are not varied analytically.
Import the completed tensor and `c₀` identifications; prove the arithmetic
actions agree under reindexing. Write `B_r` for the neighbourhood of `𝒪_v`
in the embedding-coordinate space obtained by taking the closed radius-`r`
polydiscs about its embedded points, and `A_{κ,r}` for its analytic functions
with the weight action. At radii `|π_v|^s` the discs are indexed by
`𝒪_v/π_v^s`; at `F_v=ℚ_p` their coordinates are `z=a+p^s w`. On these
disjoint discs use the shared finite product of Tate algebras, with the
explicit permutation of discs and the
rescaled local substitutions. Include changes of radius, refinement of discs
and compatibility of the weight actions with restriction.

## Layer 2: spaces of quaternionic forms

### 2.1 Abstract forms and evaluation

For a group `G`, a subgroup `Γ`, a monoid `Δ` containing `U`, and a right
`Δ`-module `A`, define the submodule of functions satisfying
`φ(γgu)=φ(g)|u`. Prove the slash action on left-`Γ`-invariant functions and
the level-fixed description. If `cᵢ` is a section of `Γ\G/U`, prove the
evaluation equivalence
`M(U,A) ≃ ∏_i A^{U∩cᵢ⁻¹Γcᵢ}`. Construct the inverse from factorizations
and prove independence of their choices using the stabiliser invariance.

For finite class sets and Banach coefficients put the supremum norm on the
invariant product and transfer it to forms. Prove completeness and boundedness
of changes of representatives; with an isometric `U` action these changes are
isometries. Include coefficient maps and level inclusion/trace maps with their
actual norm bounds. The abstract evaluation argument does not require finite
stabilisers. The algebraic definition and evaluation equivalence require no
number-field, total-reality or definiteness hypothesis.

### 2.2 Classical, analytic and overconvergent spaces

Specialising §2.1 to `G=D_fˣ`, `Γ=Dˣ` defines coefficient-valued functions
over any number field. For the classical and overconvergent automorphic
interpretations in this section assume `F` totally real and `D` totally definite.
Define classical forms with `L_{n,v}`, analytic forms `M(U,A_{κ,r})` at each
admissible radius, and the space of germs along the embedded `∏_v 𝒪_v` as the filtered colimit under restriction
`M(U,A_{κ,r}) → M(U,A_{κ,r′})` for `0<r′≤r` tending to zero coordinatewise.
Prove the restriction maps injective using the supplied coefficient-recovery
hypotheses before describing this colimit as a union. The term `r`-overconvergent
forms refers to the individual Banach stage, following Buzzard §10; always
specify this stage when using a norm or Fredholm determinant. Prove the polynomial
inclusion and its Hecke compatibility with §1.3's normalisation factor.

Prove the level/radius comparison in the normalised local coordinates:
`M(U∩U₀(π^t),A_{κ,r|π|^s}) ≃ M(U∩U₀(π^{t+s}),A_{κ,r})`
where `U` has full `GL₂(𝒪_v)` component at each selected place, `t≥1`,
`s≥0`, and the weight has the analytic thickening on the unit neighbourhood
of radius `r|π|^{s+t}` required for both actions. Use the analogous tuple
of bounds at several places. Include nebentypus and disc indices; prove
Hecke compatibility for the standard levels and operators of §3.1. This is
the bridge between locally polynomial coefficients on many discs and classical
forms at the corresponding deeper level.

### 2.3 Stabiliser actions and property (Pr)

Assume the class set is finite, as supplied by §0.3 in the definite application.
If every stabiliser acts trivially, evaluation gives the full finite block
model `C₀(classSet U × ℕ^Σ,R)`, with a finite algebraic index when needed.
Prove the dimension formula for classical forms in this case.

For totally definite `D`, use §0.3 to prove that an admissible weight's
stabiliser action factors through a finite group once its central action has
finite image. For globally algebraic weights obtain this from §1.3 and §0.3.
For families require a common
finite quotient on the whole family, not merely at each point. If each finite
image group `H_i` has invertible order in `R`, define the Reynolds projection
`E_i=|H_i|⁻¹∑_{h∈H_i} slash(h)`, prove it is a bounded idempotent with image
`A^{Γ_i}`, and assemble `E=∏E_i`. This gives property (Pr) by the shared
functional-analysis theorem. For an isometric action,
`‖E_i‖≤‖|H_i|⁻¹‖`; do not assume this bound is at most one.

**Checks.** Trivial stabilisers; a nontrivial finite stabiliser; an infinite
central stabiliser acting trivially; and failure of the averaging construction
when the image order is not a unit. With a one-element class set and trivial
stabiliser action, degree-zero classical coefficients give a one-dimensional
form space. This check assumes the stated class-set and action data; it does
not require computing the class number of a specific quaternion order.

### 2.4 Automorphic forms on `Dˣ` over any number field

Let `G=GL_1(D)` (§0.1) over an arbitrary number field `F`, `K_∞ ⊂ G(F_∞)` a
maximal compact subgroup (ALS.F.1), `A_∞` the split component and `𝔤`, `Z(𝔤)`
as in ALS.F.6. The space of automorphic forms on `Dˣ` is ALS.F.6's
`LocallySymmetric.AutomorphicForm` for this `G`, written `𝒜(Dˣ)`; through §0.2's
comparison it is a `(𝔤,K_∞) × D_fˣ`-module. Its constant terms, cusp forms,
uniform moderate growth and the discreteness of the cuspidal spectrum are that
roadmap's theorems. Nothing here redefines them. When `D` is a division
algebra, `G` has no proper rational parabolic subgroup, so every automorphic
form is cuspidal; when `D=M₂(F)`, cuspidality is the vanishing of the constant
term along the upper Borel.

**Type, level and central character.** Fix a number field `E` splitting
`Res_{F/ℚ}G`, so that `D ⊗_{F,τ} E ≃ M₂(E)` for every embedding `τ : F ↪ E`, and
an embedding `ι : E ↪ ℂ`. An archimedean type is an irreducible algebraic
representation `W=V_λ` of `Res_{F/ℚ}G` over `E` (ALS.F.7); through the
splittings, `V_λ=⊗_τ Sym^{a_τ−b_τ}(E²)⊗det^{b_τ}` for `λ_τ=(a_τ≥b_τ)`,
independently of the splittings up to isomorphism. Let `J_W ⊂ Z(𝔤)` be the
annihilator of `ι(W)`, `U ⊂ D_fˣ` a compact open subgroup, and
`ω : Fˣ\𝔸_Fˣ → ℂˣ` a continuous character whose archimedean component is the
central character of `ι(W)` on `F_∞ˣ`. Define

```text
𝒜_W(U,ω) = {f ∈ 𝒜(Dˣ) : f(zgu)=ω(z)f(g) for z∈𝔸_Fˣ, u∈U, and J_W^m f=0 for some m},
S_W(U,ω) = its cuspidal subspace, on which J_W itself acts by zero,
```

and for an irreducible representation `τ` of `K_∞` the `τ`-valued forms
`Hom_{K_∞}(τ, 𝒜_W(U,ω))` and `Hom_{K_∞}(τ, S_W(U,ω))`, realised as functions
`Φ : Dˣ\D_𝔸ˣ/U → τ^∨` with `Φ(gk)=k⁻¹Φ(g)` for `k∈K_∞`. Prove that for each
`m` the `τ`-valued forms annihilated by `J_W^m` form a finite-dimensional space
(ALS.F.6(i)), that `S_W(U,ω)` is an admissible `(𝔤,K_∞)`-module, and that

```text
S_W(U,ω) = ⊕_π m(π)·(π^∞)^U ⊗ π_∞,
```

a finite sum over the cuspidal automorphic representations `π` with central
character `ω` whose archimedean component has the infinitesimal character of
`ι(W)`, with `π_∞` its `(𝔤,K_∞)`-module and `m(π)` the cuspidal multiplicity
(ALS.F.6(iv) and ALS.F.7's Wigner lemma). The Hecke algebra `H(D_fˣ,U)` acts on
`U`-invariants by ALS.3.1 and preserves type, central character, `K_∞`-isotypic
parts and cuspidality; its dictionary with §3.1 is convention 9, and
AutomorphicFormsOnReductiveGroups §7.4's `inverseActionHeckeEquiv` is the
comparison to cite.

**Restriction to components.** For `g_1,…,g_h` representing `Dˣ\D_fˣ/U` and
`Γ_i=Dˣ∩g_iUg_i⁻¹` in `G(F_∞)`, restriction `f ↦ (g_∞ ↦ f(g_ig_∞))_i` identifies
`𝒜_W(U,ω)` with a direct sum of spaces of functions on `Γ_i\G(F_∞)` carrying the
transported central-character, growth, `K_∞`-finiteness and `Z(𝔤)` conditions,
compatibly with inverse reconstruction and the Hecke action. For `D=M₂(F)` this
is [GL2AutomorphicRepresentationsAndTransfer R16.1.6][GL2AutomorphicRepresentationsAndTransfer]'s
adapter, consumed; for a division algebra it is a target here, with the class
set of §0.3. For `D=M₂(F)` the class set is finite by AdelicAlgebraicGroups §3.4
(*class-number-finite*) and is `Fˣ\𝔸_{F,f}ˣ/det(U)` by its §4.5 bijection for
groups with simply connected derived group; FLT's division-algebra theorem does
not cover this case.

**Checks.** For totally definite `D` over `ℚ` and `W=ℂ`, `𝒜_ℂ(U,1)` is the space
of functions on the finite set `Dˣ\D_fˣ/U`, the trivial-coefficient `M(U,ℂ)`.
For `D=M₂(ℚ)`, the adelic lift of a holomorphic weight-`k` cusp form
(AutomorphicFormsOnReductiveGroups §7.2) lies in `S_W(U,ω)` for the `W` with
`W|_{SL₂}=Sym^{k−2}` and §7.2's determinant and central normalisations, in the
`K_∞`-type containing the `SO(2)`-weight `k`; the constant function `1` lies in
`𝒜_ℂ(GL₂(Ẑ),1)` and is not cuspidal. For an indefinite division algebra over
`ℚ`, `S_W=𝒜_W` and `X_U` is compact. Replacing the type `W` by `W^∨` inverts the
central character at infinity unless `W` is self-dual.

### 2.5 The definite comparison

Let `F` be totally real and `D` totally definite, split at the places `v|p`
where §1.3's coefficients are formed, and put `λ_σ=(n_σ+v_σ, v_σ)` for each real
embedding `σ`. Homogenising `f(z)` to `P(X,Y)=Y^{n_σ}f(X/Y)`, the right action of
§1.3 reads `(P|γ)(X,Y)=(det γ)^{v_σ}P(aX+bY, cX+dY)`, so `u ↦ (·)|u⁻¹` is the
contragredient of `Sym^{n_σ}(std)⊗det^{v_σ}` on polynomial functions. Hence the
right `GL₂`-module `L_{n,v}` is the algebraic representation `V_λ^∨`, restricted
to `U` through the splittings at `p`: this is the dual/right-action dictionary of
§1.3, stated once and used below. Fix a number field `E` splitting `D` at every
embedding of `F`, with an embedding `E ↪ K` compatible with the chosen
splittings and with `ι : E ↪ ℂ`.

With these identifications, §2.2's `M(U, L_{n,v})` is
AutomorphicFormsOnReductiveGroups §7.4's `LevelAlgebraicModularForm`
`S(U, V_λ^∨⊗K)`, its `T_η` is the operator of `[Uη⁻¹U]` there
(`inverseActionHeckeEquiv`), and with the algebraic rather than the normalised
determinant twist the operators differ by §1.3's scalar `ν_alg(π_v)^e`. Gross's
rational covariance model `F(γg)=ρ(γ)F(g)`, `F(gu)=F(g)` and its equivalence
`f(g)=ρ(g_p)⁻¹F(g)` with the level model are §7.4's; consume them.

**Theorem (definite automorphic realisation).** Prove a Hecke-equivariant
isomorphism

```text
M(U, L_{n,v}) ⊗_{K,ι} ℂ ≅ ⊕_ω Hom_{K_∞}(ι(V_λ), S_{V_λ}(U,ω))
                        ≅ ⊕_π m(π)·(π^∞)^U ⊗ Hom_{D_∞ˣ}(ι(V_λ), π_∞),
```

over the finitely many `ω` whose archimedean component is the central
character of `ι(V_λ)` and which are trivial on `𝔸_{F,f}ˣ∩U`, and over the
cuspidal `π` with `π_∞ ≅ ι(V_λ)` as representations of `D_∞ˣ=∏_σ ℍˣ`. Here
`K_∞=∏_σ ℍ¹` acts on `ι(V_λ)` through `⊗_σ Sym^{n_σ}(ℂ²)`, Tau Ceti's
`TauCeti.SU2.symPower`; `T_η` corresponds to `[Uη⁻¹U]` on `(π^∞)^U`; and every
form on `Dˣ` is cuspidal, so at `n=0` the norm characters `χ∘nrd` with `χ`
trivial on `nrd(U)` occur. Over `ℚ` the second isomorphism is §7.5's
`automorphicEquiv`, whose two hypotheses hold; consume it. For `[F:ℚ]>1` the
rational centre `Fˣ` is not discrete in `𝔸_{F,f}ˣ`, so decompose
`M(U, L_{n,v})` into the central-character summands of §7.6 (the carrier of
[HilbertModularVarietiesAndShimuraCurves][HilbertModularVarietiesAndShimuraCurves]
R18.3.3 as well), using §1.3's parallel-weight hypothesis for the finite central
image, and prove the realisation of each summand following Loeffler,
Proposition 3.8.1, from ALS.F.6(iv) for the compact-modulo-centre quotient; that
realisation is a target here. GL2AutomorphicRepresentationsAndTransfer R17.3.9
is the instance over `ℚ` with `D` ramified at `p`, where the coefficient action
is supplied at the division place, and HilbertModularVarietiesAndShimuraCurves
R18.3.20–R18.3.22 fix the dual and norm-twist conventions of the transfer; the
realisation here must agree with both on the common `E`-rational model, with
the same `V_λ^∨`, the same inverse cosets and §1.3's determinant scalar.

**Checks.** `(P|γ)` sends `X^n` to `(aX+bY)^n`, whereas `Sym^n(std)` sends
`e_1^n` to `(ae_1+ce_2)^n`; the two differ by the transpose, which is the
inverse up to `det` and the Weyl element, so `π_∞` is `ι(V_λ)` and not its dual.
Over a real quadratic field at maximal level `Fˣ∩U=𝒪_Fˣ` is infinite, so §7.5's
discreteness hypothesis fails and the central-character summands are needed,
while `n=0` is already parallel. With trivial stabiliser action over `ℚ`, the
dimension `h(n+1)` of §2.3 equals `Σ_π m(π)·dim(π^∞)^U`, each `π` with
`π_∞≅ι(V_λ)` contributing its finite part once.

### 2.6 Bianchi forms

Let `F` be imaginary quadratic with complex embeddings `τ, τ̄`, and `D=M₂(F)`,
so `G=GL₂`, `G(F_∞)=GL₂(ℂ)`, `K_∞=U(2)`, `A_∞=ℝ_{>0}` and `𝔤=𝔤𝔩₂(ℂ)⊗_ℝℂ`.
Identify the symmetric space `X^G=GL₂(ℂ)/ℂˣU(2)` (ALS.0.4; its dimension `3` is
that section's check) with KleinianGroups' upper half-space `H^3` by the orbit
map of the base point, equivariantly for `GL₂(ℂ)` acting through
`PGL₂(ℂ)=PSL₂(ℂ)`. For compact open `U ⊂ GL₂(𝔸_F^f)` the level space `X_U`
(ALS.0.6) is the Bianchi threefold `Y_U`; its components are `Γ_x\H^3` for
`Γ_x=GL₂(F)∩xUx⁻¹` (ALS.0.7), indexed by
`GL₂(F)\GL₂(𝔸_F^f)/U ≃ Fˣ\𝔸_{F,f}ˣ/det(U)` as in §2.4. These `Γ_x` are
conjugates of the infinite stabilisers of §0.5; they act properly
discontinuously with finite point stabilisers (ALS.0.8), and at `U=GL₂(Ô_F)`
and the trivial ideal class the image of `Γ_1=GL₂(𝒪_F)` in `PSL₂(ℂ)` contains
KleinianGroups' Bianchi group `PSL₂(𝒪_F)` with finite index. Finiteness of the
class set is AdelicAlgebraicGroups §3.4's.

**Weight `(k,k)`.** For `k≥0` let `V_{k,k}=Sym^k(ℂ²)⊗\overline{Sym^k(ℂ²)}`, the
`V_λ` of `Res_{F/ℚ}GL₂` with `λ_τ=λ_τ̄=(k,0)`, the second factor through `τ̄`;
its central character is `z ↦ (zz̄)^k`. Take the type `W=V_{k,k}^∨`, so that
`ω_∞(z)=(zz̄)^{−k}` and the coefficient system paired with is `V_{k,k}`, and the
`K_∞`-type `τ_k=Sym^{2k+2}(ℂ²)⊗det^{−(k+1)}` of `U(2)`, which restricts to
`Sym^{2k+2}` on `SU₂(ℂ)` and is trivial on the centre `U(1)`. Define the
**Bianchi cusp forms of weight `(k,k)`, level `U` and central character `ω`** as

```text
S_{k,k}(U,ω) = Hom_{K_∞}(τ_k, S_{V_{k,k}^∨}(U,ω)),
```

the `V_{2k+2}(ℂ)`-valued functions `Φ` on `GL₂(F)\GL₂(𝔸_F)/U` with
`Φ(zg)=ω(z)Φ(g)`, `Φ(gu)=Φ(g)ρ′(u)` for `u∈SU₂(ℂ)` and Williams's
antihomomorphism `ρ′`, annihilated by `J_{V_{k,k}^∨}` and cuspidal along the
upper Borel. Prove that `S_{k,k}(U,ω)` is finite dimensional with the
`H(GL₂(𝔸_F^f),U)` action of §2.4, and that

```text
S_{k,k}(U,ω) ≅ ⊕_π m(π)·(π^∞)^U,
```

over the cuspidal `π` with central character `ω` whose `π_∞` is the irreducible
principal series of `GL₂(ℂ)` with the infinitesimal character of `V_{k,k}^∨` and
minimal `K_∞`-type `τ_k`, which contains `τ_k` with multiplicity one. The other
irreducible `(𝔤,K_∞)`-module with this infinitesimal character is `V_{k,k}^∨`
itself, which is finite dimensional and so is not the archimedean component of
a cuspidal representation of `GL₂(𝔸_F)` (GL2AutomorphicRepresentationsAndTransfer
R16.4's Whittaker expansion). Consume AutomorphicFormsOnReductiveGroups §2.6 and
GL2AutomorphicRepresentationsAndTransfer R16.2.13 for the principal series of
`GL₂(ℂ)`, their `K_∞`-types and Casimir values. Cusp forms of type `V_λ^∨` with
`λ_τ=(a,b)`, `λ_τ̄=(a′,b′)` vanish unless `a−b=a′−b′` (Clozel's purity lemma,
as used in ALS.5b.8), so parallel weight is the only case.

**Comparison with Williams.** Williams, Definition 1.2, takes `U=Ω₁(𝔫)`, the
`SU₂(ℂ)`-type `V_{2k+2}(ℂ)`, archimedean central character `|z|^{−k}` and, in
place of `J_{V_{k,k}^∨}`, the single Casimir eigenvalue `∂Φ=(k²/2+k)Φ`, leaving
the finite central character free. Prove that his space is
`⊕_ω S_{k,k}(Ω₁(𝔫),ω)`, over the `ω` with that archimedean component that are
trivial on `𝔸_{F,f}ˣ∩Ω₁(𝔫)`, after the twist by the power of `|det|_𝔸`,
determined by `k` and his absolute-value convention, that matches the two
archimedean central normalisations; carry that twist through the Hecke
eigenvalues. On cusp forms of `K_∞`-type `τ_k` with this central character,
unitarity of `π_∞` up to a twist makes his eigenvalue condition equivalent to
the full infinitesimal character, since every other unitary principal series
containing `τ_k` has a different Casimir eigenvalue. His descent to
functions on `H^3` for each class representative is the restriction map of
§2.4.

**Cohomological comparison.** Let `U` be neat and `V_{k,k}` the local system of
ALS.1.1 on `X_U` attached to the rational representation `V_{k,k}` with trivial
`K_S`-action. Prove

```text
H^1_cusp(X_U, V_{k,k}) ≅ ⊕_ω S_{k,k}(U,ω),
```

that `H^2_cusp(X_U, V_{k,k})` carries the same multiplicity spaces, and that
`H^j_cusp(X_U, V_{k,k})=0` for `j≠1,2`; equivariantly for `H(G^S,U^S)` by
ALS.5b.5, and for the remaining double cosets of `H(GL₂(𝔸_F^f),U)` through
ALS.5b.1's compatibility with level maps and translations, a target here. This
is ALS.5b.5's decomposition
`H^*_cusp=⊕_π m(π)·H^*(𝔪_G,K_∞;π_∞⊗V_{k,k})⊗(π^∞)^U` together with the
archimedean computation, also a target here:
`dim H^j(𝔪_G,K_∞;π_∞⊗V_{k,k})=1` for `j=1,2` and `0` otherwise, for the
principal series `π_∞` above, with `(q₀,ℓ₀)=(1,1)` as in ALS.F.7(iii); the
relative cochains are ALS.F.5's and `Λ^1𝔭≅Λ^2𝔭` is the adjoint representation
`Sym²(ℂ²)` of `SU₂(ℂ)`. The cuspidal classes lie in the interior cohomology
`H^1_!` and inject into `H^1` (ALS.5b.5); do not replace `H^1_cusp` by `H^1` or
`H^1_c`. At non-neat level take the `Q`-invariants of a neat normal refinement,
as ALS.1.3 prescribes; in characteristic zero the derived invariants are
invariants. Sources: Harder (1975), (1987); Şengün §5, whose `S_{k+2}(Γ)` is the
weight-`(k,k)` space here; Williams §1.1.

**Checks.** At `k=0`, `τ_0=Sym²(ℂ²)⊗det⁻¹` is three dimensional and
`S_{0,0}(U,ω)` consists of the vector-valued harmonic forms of Şengün §5,
matching `H^1_cusp(X_U,ℂ)`. The twist by `|det|_𝔸` is trivial on `GL₂(F)` and on
`Ω₁(𝔫)`, so it preserves the level and rescales the eigenvalue of each
double coset by a power of its determinant's norm. Cuspidal cohomology is a
proper summand of `H^1(X_U,ℂ)` in general: restriction to the boundary tori of
the Borel–Serre compactification is nonzero on the Eisenstein classes
(ALS.5b.4). A nonparallel `λ` gives `S=0` although `V_λ` is a local system on
`X_U`; its cuspidal cohomology vanishes. The infinite stabilisers of §0.5 are
conjugates of the `Γ_x` here; no finite-stabiliser or averaging hypothesis of
§2.3 enters.

## Layer 3: Hecke operators and compactness

### 3.1 Action of the Hecke ring

On §2.1's abstract coefficient-module space, given a finite decomposition
`UηU=⊔_t Ux_t` contained in `Δ`, define `T_η φ=∑_t φ|x_t`. Prove it
preserves level forms and is independent of the representatives, then compare
composition with the imported abstract Hecke product. These algebraic results
require neither total reality nor definiteness. For the Banach model of §2.1,
assume a finite class set and bounded coefficient actions and prove boundedness.
Use the native product ordered by multiplication `δ ε`: with right actions, `S_ε∘S_δ=S_{δε}`, so its action is an
antihomomorphism into composition endomorphisms, equivalently a homomorphism
from the opposite Hecke ring. Prove this comparison with the native structure
constants. Test singleton cosets for two noncommuting normalising elements;
commuting good-prime operators alone cannot detect a reversed convention.

Define `U_v`, good-prime `T_v`, central `S_v` and diamond operators from their
double cosets. Prove their standard local relations and the commutation of
operators at distinct places by the shared Hecke-ring theory and the local
certificates. Define the commutative Hecke algebra used for eigenforms as the
subalgebra generated by the specified commuting operators. A theorem about it
must not assume the desired commutativity as input.

### 3.2 Certified matrices

A Hecke certificate consists of finite representatives `cᵢ`, `x_t` and actual
factorisations `cᵢx_t⁻¹=d(i,t)c_{σ(i,t)}u(i,t)`. Prove the formula
`(T_ηφ)(cᵢ)=∑_t φ(c_{σ(i,t)}) | (u(i,t)x_t)` and hence the block entry
`B_{ij}=∑_{t:σ(i,t)=j} slash(u(i,t)x_t)`.

Prove the transport identity on the invariant product. Different certificates
give the same operator on that product. They need not give the same extension
to arbitrary ambient block coordinates when stabilisers act nontrivially.
For a split invariant model use `BE` as the ambient extension, and prove that
its image lies in the invariant part. The forms operator and its determinant
must be independent of certificate, representatives and the chosen splitting.

### 3.3 Radius improvement and compact operators

For the totally definite form spaces of §§2.2–2.3, prove the norm bounds and
radius improvement for the standard `U_v` using §1.2's local formulas and §0.4's representatives. For a single analytic place,
factor through a stricter analytic restriction to prove complete continuity;
alternatively use the explicit row estimates of §1.2. At several analytic
places prove the same for `U_π=∏_{v} U_v`. Use `IsRowCompact` and its implication
to finite-image operator-norm approximation from CompactOperators §§0.1–0.2. Invoke the converse only under
its finite-lifting hypotheses; the ring case is not an unconditional equivalence.
Transport compactness through finite blocks and bounded invariant projections.

For quantitatively bounded weights prove
`‖B_{(i,m),(j,r)}‖≤∏_σ s_σ^{m_σ}` with every `s_σ<1` for the controlling
operator. If one analytic variable is uncontracted, this does not tend to zero
cofinitely. Include the control example `f(z₁,z₂)↦f(pz₁,z₂)`, whose restriction
to `K⟨z₂⟩` is the identity and which is not completely continuous. If the
other coefficient factors are finite dimensional, contraction in the remaining
analytic variables suffices.

**Checks.** For trivial weight in one variable, `diag(π,1)` acts by
`f(z)↦f(πz)` and has monomial diagonal `1,π,π²,…`. Verify its null-row
bound, and verify that a finite direct sum repeats these degree weights.
The two-variable counterexample above checks that every analytic factor must
be contracted.

## Layer 4: Fredholm theory for the forms spaces

### 4.1 Intrinsic determinant and finite-slope parts

For the compact controlling operator define `H_κ(T)=det(1-TU_π)` by the
shared determinant on property-(Pr) modules. Prove the comparison with the
block model and with `BE`, independence of all choices and radius independence
on overlapping admissible stages. The latter uses the actual intertwining
restriction/factorisation maps; a dense inclusion alone is not a proof.

Over a complete coefficient field, identify nonzero eigenvalues with reciprocal
zeros of `H_κ` in a chosen complete splitting extension. Apply the shared Riesz
and slope theory to produce finite-dimensional cutoff summands and, over
appropriate affinoid rings and separated factors, finite projective summands.
Show all commuting Hecke operators preserve them. With a Noetherian affinoid
coefficient algebra, their image Hecke algebra in the endomorphism algebra of
such a summand is finite as a module. Do not claim a globally free eigenbasis.

Over a complete algebraically closed field, show that every nonzero
finite-slope summand contains a simultaneous Hecke eigenvector and has finitely
many eigensystems. Every eigensystem occurring on forms with nonzero controlling
eigenvalue occurs in a finite cutoff summand. The zero eigenvalue is invisible
to the Fredholm series. Define the ordinary subspace by slope zero; identify
it with the slope-`≤0` part when the operator norm bound excludes negative slopes.

### 4.2 Coefficient bounds and classical factors

If the ambient rows are bounded by a decreasing sequence `b₀,b₁,…`, use the
principal-minor bound `‖coeff_n H_B‖≤∏_{j<n}b_j`. With trivial stabiliser
action, one variable, `h=#classSet U` and `b_j=s^{⌊j/h⌋}`, obtain
`v_p(coeff_n H_κ)≥(-log_p s)∑_{j<n}⌊j/h⌋`. For `d≥1` variables enumerate
multi-indices by total degree, repeating degree `m` exactly
`h·binomial(m+d-1,d-1)` times, or use the ordered anisotropic weights.
With no analytic variables the coefficient model is finite dimensional and the
finite determinant theorem applies directly.

For a general invariant projection of norm at most `C`, the extension `BE`
has row bounds `C b_j`; its determinant has bound
`C^n∏_{j<n}b_j`. The sharper bound requires a contractive projection or an
independent estimate on the invariant model. It does not follow from property
(Pr) alone. Translate these coefficient bounds through NewtonPolygons. Exact
attainment requires a verified dominant-minor or noncancellation argument;
unit entries or rescaled minors alone do not remove cancellation among tied
weights.

These are bounds on partial sums of ordered slopes, not termwise lower
bounds on individual slopes. In the one-variable contractive case with
`s=|π|`, deduce
`dim M_{≤h} ≤ max{n : v_p(π)∑_{j<n}⌊j/h_U⌋ ≤ nh}`,
where `h_U=#classSet U`; for `h≥0` a convenient bound is
`h_U(⌊2h/v_p(π)⌋+2)`. State this only with the uniform row hypotheses above,
and use the adjusted coefficient bound when the projection is not contractive.

For every stable finite-dimensional classical subspace identify its factor as
`det(1-TU_cl)`, equivalently `reflect d (charpoly U_cl)` with `d` its
dimension. Its degree is at most `d`, and equals `d` when `U_cl` is invertible.
Zero eigenvalues contribute no finite slopes. A finite classical determinant
is a factor of the full Fredholm series; it does not determine the entire
series when the complementary analytic module is infinite dimensional.

### 4.3 Scalar extension and families

For compatible bounded scalar extension prove compatibility of weight factors,
form spaces, matrices, determinants and separated finite-slope summands. Use
completed scalar extension for infinite-dimensional analytic modules, justified
by the `c₀` comparison and the finite invariant projections. Algebraic tensor
products can have only dense image for infinite extensions; for finite field
extensions prove the expected algebraic/completed comparison instead of
asserting that surjectivity always fails.

For an affinoid family of weights with a common admissible level and radius,
construct the Banach module of forms and the entire Fredholm series. Carry
the uniform analytic bounds and common finite stabiliser quotients needed for
property (Pr). Prove specialisation, compatibility on smaller affinoid domains
and preservation of nilpotent coefficients. Supply these data to the geometric
roadmaps; representing weight space or gluing a spectral variety is not a
milestone here.

For the universal unit character, construct ordinary analytic families on
coefficient domains with a specified norm bound `‖T‖≤b<1`, where
`T=κ(exp(q))−1`, `q=p` for odd `p` and `q=4` for `p=2`. Prove a uniform
version of PFA §§5.4–5.5 with depth and disc radius depending on `b` and the
stated coefficient-norm bounds. On closed subannuli also bound `p/T` as needed
for the coefficient map. Carry the strict logarithm/exponential convergence
inequalities through the substitution; pointwise bounds without uniform norm
control do not suffice, especially for nonreduced algebras. Restriction to a
smaller domain or a deeper disc stage must commute with the action, and its
Fredholm comparison must use the actual intertwining maps from §4.1.
There is no common ordinary analytic stage over all `p⁻¹<|T|<1`.
The full annular construction is the separate target in §4.4.

**Checks.** Scalar extension to a finite splitting field, a family over
`K⟨w⟩`, a first-order deformation over `K[ε]/(ε²)`, the zero form space,
and a finite classical operator with a zero eigenvalue.

For the local bounded-family check at `p=3`, take trivial determinant twist
and `n_w(u)=exp(w log u)` on `1+3ℤ₃`, extended trivially on `{±1}`,
over `K⟨w⟩`. Verify its expansion bounds on `Σ₁(2)` and specialization at
nonnegative integers `w=k`. Its Jacobs-labelled character is
`κ_{J,w}(u)=u²n_w(u)`, so it has classical weight `k+2` at `w=k`.
There `n_k(u)=u^k ω(u)^{-k}`, with `ω` the torsion character, and the finite
factor is trivial on the specified lower-right entries.
For a definite global application over `ℚ` with these local data, a class set
of size `h` and trivial stabiliser action, check the model `C₀(Fin h × ℕ,K)`
and classical dimension `h(k+1)`. With row bound `|3|^m`, the lower polygon
has slopes `⌊j/h⌋` for `h>0`; these are not termwise bounds on actual slopes.
This check uses the general interfaces and does not prescribe a particular
quaternion order or a computation of its class representatives.

### 4.4 Integral annular forms in weighted Mahler coordinates

Retain the full annular endpoint over `ℚ`, with `D` split at `p` and trivial
determinant twist. Let `H`, `R=H[1/T]` and the multiplicative-`T` gauge
`‖T‖=α∈(0,1)` be PFA §5.6's rings and norm. Include the finite torsion
factor by `H[Δ]`, `R[Δ]`, with the maximum coefficient norm; write `H_Δ`,
`R_Δ` for these. At `p=2` retain the group ring, without integral character
idempotents. PFA owns the rings, universal character, Mahler equivalence and
Amice analytic bases; the weight action and its estimates below belong here.

**Coefficient module.** Define `w(n)=⌊n/2⌋` and use the native model
`B=C₀(ℕ,R_Δ)`, with its supremum norm. Its function realization is

```text
ι(b)(z) = Σ_n T^{w(n)} b_n binom(z,n),       z∈ℤ_p.
```

Prove uniform convergence and continuity from `‖binom(z,n)‖≤1` in `H_Δ`,
and injectivity from finite differences and invertibility of `T`. Reuse PFA
§3.2's binomial functions and finite-difference identities. The structural map
`ℤ_p→H` is continuous and its image has norm at most one; it need not be
Lipschitz for the usual `p`-adic norm and an arbitrary `T`-gauge. Use those
actual bounds in the uniform-sum argument, rather than installing an
unavailable normed `ℤ_p`-module instance. Transport the norm to the image:
its integral lattice is the sequences `b_n∈H_Δ` tending to zero in the `T`-gauge. Completion is
for this coefficient norm, not the subspace supremum norm on continuous
functions. In particular, no claim that this image is closed in that weaker
norm is needed. Binomial values are integral continuous functions, so this
construction does not invert `p` or factorials in the coefficient ring.

This is a weighted Mahler model with room between its weight and the full
`T^n` divisibility estimate. [Liu–Wan–Xiao](https://arxiv.org/abs/1412.2584v4),
§5.4, motivates the weighting; here `⌊n/2⌋` is chosen to obtain both null
columns and an explicit **output-row** bound in the shared `C₀` convention.
Do not identify it with their endpoint `T^n` model or an ordinary Tate disc.

**Continuous-character action.** For `γ∈Σ₀(v_p(q))`, apply the universal
character to the actual unit `cz+d` at each `z∈ℤ_p`, and set
`f|γ(z)=κ_univ(cz+d) f((az+b)/(cz+d))`. First construct this on continuous
functions and prove the right-action identity there. If `P_{mn}(γ)` is the
`m`th Mahler coefficient of `κ_univ(cz+d) binom((az+b)/(cz+d),n)`, prove
by finite differences the two estimates

```text
P_{mn}(γ) ∈ T^{max(m−n,0)} H_Δ;
P_{mn}(γ) ∈ T^{max(m−⌊n/p⌋,0)} H_Δ   if a∈pℤ_p.
```

The inputs are LWX Proposition 3.14 and its `(p,T)` divisibility argument,
transported to PFA's ring. For `p=2` use `c∈4ℤ₂` and the ideal `(p,T)`,
not a claim that the full group-ring maximal ideal is generated by `T`.
The torsion component of `cz+d` is constant as `z` varies. These are
arithmetic proof targets, not hypotheses supplied by continuity of the weight.

The weighted matrix is `Q_{mn}=T^{w(n)−w(m)}P_{mn}`. From the first estimate
prove bounded entries and, for each fixed input `n`, convergence `Q_{mn}→0`
as `m→∞`; the exponent tends to infinity because `m−w(m)→∞`.
Use the shared bounded-matrix API to extend the action to `B`, prove that
`ι` intertwines it with the continuous-function action, and obtain the cocycle
by injectivity of `ι`. For a contracting matrix (`a∈pℤ_p`) prove

```text
w(n)−w(m)+max(m−⌊n/p⌋,0) ≥ m−w(m) = ⌈m/2⌉,
‖Q_{mn}‖ ≤ α^{⌈m/2⌉}.
```

The inequality uses `p≥2` and `⌊n/p⌋≤⌊n/2⌋`; it is independent of the
input column. Thus the rows are uniformly null. Merely observing decay in
the input index, or replacing analytic functions by all continuous functions,
is not a substitute for these two matrix conditions.

**Forms and Fredholm series.** At a fixed level with local `U₀(q)` condition
and trivial stabiliser action, apply §2.1 to `B`. For `h=#classSet U`, the
coefficient model is `C₀(Fin h × ℕ,R_Δ)`. Prove from the double-coset
certificates that every local summand for `U_p` satisfies `a∈pℤ_p`; the
row bound above passes through finite sums and block reindexing. Consume
CompactOperators to construct the intrinsic entire series `det(1-XU_p)`.
Its coefficients lie in `H_Δ`, and the rows in degree-first order have bound
`α^{⌈⌊j/h⌋/2⌉}`. Keep the zero-class-set case separate. Any extension to
nontrivial stabiliser actions must supply §2.3's actual bounded projection and
its norm loss; no finite group order is inverted in the trivial-action case.

For PFA's specializations `T↦t`, `p⁻¹<|t|<1`, and a specified torsion
character, compare with `C₀(ℕ,K)` carrying the weights `t^{w(n)}`. Choose
`α=|t|` to obtain a bounded coefficient map and invoke the shared completed
base-change comparison. For other gauges use the verified continuous map
and coefficient convergence directly; do not assume it is Lipschitz.
Compare this module with locally analytic disc stages using PFA's Amice
coordinates: for example it maps boundedly to stage `s` once
`v_p(t)/2 > 1/(p^s(p−1))`. Depths depend on `t`, or uniformly on an upper
weight bound `b<1`, and must also satisfy analytic admissibility for the weight.

Prove equality of the specialized Fredholm series with §4.3's analytic series
at the **same level and Hecke normalization**. In Mahler coordinates the
weighted and Amice matrices have the same finite principal determinants,
since their diagonal scaling factors cancel. Prove convergence on both sides
before passing to the limit. This does not assert a bounded inverse to an
infinite diagonal map or an isomorphism with one fixed analytic stage. For
bounded affinoid coefficient maps prove the corresponding comparison using
unit scaling factors and actual norm bounds, including nonreduced algebras;
compatibility is a series identity, not an inference from field-valued points.
Changing the auxiliary gauge must give the same coefficientwise determinant.

**High-conductor check.** At `p=3`, for every `h≥1` choose `m≥h` and the
character `ψ_m` trivial on `{±1}` with
`ψ_m(exp(3))=ζ_{3^m}` primitive. Its conductor is `3^{m+1}` and
`t_m=ζ_{3^m}−1` has norm `3^{−1/(2·3^{m−1})}`, tending to one. For
`γ_h=((1,0),(3^h,1))`, prove there is no ordinary restricted series on the
unit disc equal to `z↦ψ_m(1+3^h z)`: this function equals one on
`3^{m+1−h}ℤ₃`, but at `(exp(3^h)−1)/3^h` it is
`ζ_{3^m}^{3^{h−1}}≠1`. Apply the identity theorem from RestrictedPowerSeries.
The same check after `z=3^s u` rules out every fixed finite disc refinement.
Nevertheless the universal action of `γ_h` on the constant vector belongs to
`B` by the null-column estimate above, specializes to this continuous function,
and becomes analytic at a sufficiently deep stage depending on `m`.
Also verify the bounded-family overlap comparisons and the `p=2`, `q=4`
variant. These checks retain the full annular target without claiming a common
ordinary analytic radius at unbounded conductor.

## Layer 5: theta and small-slope classicality over ℚ

This layer takes `F=ℚ`, `D` definite and split at `p`, and classical-shape
weights with polynomial degree `k≥0`. Put `r=k+1`. The finite-order part is constant on
the discs determined by the wild level. The target weight has degree parameter
`-k-2`, with the same finite character and normalised determinant factor.
General totally real fields need additional global normalisation and partial
BGG operators; splitting a single completion as `ℚ_p` does not supply them.

### 5.1 Derivatives and Bol's identity

Import the bounded derivative on the native Tate algebra and its iterates:
`D^r z^m=(m)_r z^{m-r}`, with norm at most one on the unit disc. Its kernel
in characteristic zero is the polynomials of degree at most `k`. On a disc
`z=a+p^s w`, carry the scale `p^{-sr}`; the kernel on a union of discs is
the space of **locally** polynomial functions. For `r>0` the derivative on
the closed unit-disc Tate algebra has dense range but is not surjective; the
inverse factorial diagonal is unbounded.

Prove the local Bol identity, with `N=az+b`, `L=cz+d`, `d≠0`:
`D^r(N^{j+r} L^{-(j+1)})=(ad-bc)^r (j+r)_r N^j L^{-(j+r+1)}`.
Together with the polynomial columns this gives
`D^r(f|κγ)=det(γ)^r (D^r f)|κ′γ`
when the two automorphy factors are exactly `u_γ L^k` and
`u_γ L^{-k-2}` for the **same constant** `u_γ`. Extend from polynomials to
restricted series by continuity. Generic differentiation belongs to
RestrictedPowerSeries; this weight-equivariance identity belongs here.

**Checks.** At `r=1`, differentiating an additional nonconstant factor
`1+cz` at `f=1` gives `c`, whereas a formula involving only `D(f)` gives zero.
This prevents an erroneous Bol statement for arbitrary locally analytic
characters. Include the identity matrix and polynomial columns killed by `D^r`.

### 5.2 Theta on forms and Hecke compatibility

Using §0.2's rational character define
`(Θ^r φ)(g)=c(g)^{-r}D^r(φ(g))`.
Prove it is a bounded map of the indicated spaces of forms and that
`Θ^r T_η=|nrd(η)|_f^{-r} T′_η Θ^r`.
In particular the scalars for `U_p`, `T_ℓ` and `S_ℓ` are `p^r`, `ℓ^r`
and `ℓ^{2r}` respectively. In representative coordinates the theta map is
`diag(c(cᵢ)^{-r})·D^r`, not simply the unweighted block derivative unless
those constants have been normalised to one. Carry these constants in every
matrix intertwining statement.

Its kernel on a single-disc stage is the classical polynomial-valued subspace.
On multiple discs identify it with locally polynomial-valued forms and then
use §2.2's level/radius comparison to identify the classical level. State the
dimension using the invariant product; the formula `h(k+1)` (or
`h·p^s(k+1)` on `p^s` discs) requires trivial stabiliser action.

### 5.3 Determinant identity and classicality

At a single-disc level with trivial stabiliser action, let `M=M(U,A_κ)` and
`W=M_cl` be its finite-dimensional, `U_p`-stable polynomial subspace. Splitting
off the polynomial coordinates gives a bounded Banach-module decomposition
`M=W⊕N`. In these coordinates write

```text
U_p = ((U_cl, B), (0, V)),
H_κ(T) = det(1-TU_cl) · H_V(T).
```

Here `V` is the induced operator on `M/W`, represented on `N`; the complement
`N` need not be `U_p`-stable. The displayed identity is the block-triangular
multiplicativity of Fredholm determinants supplied by CompactOperators §1.6,
with one finite-dimensional diagonal block. Check the bounded coordinate
projections and compactness of the induced operator before applying it.

On the complementary coordinates, theta is a shift followed by the nonzero
factorial diagonal and the representative constants from §5.2. The intertwining
identity gives `D V = p^r U_p′ D` after reindexing, where `D` is that diagonal
map. Apply CompactOperators §1.4's diagonal-intertwining comparison: cancel the
nonzero diagonal factors in each finite principal determinant and pass to the
convergent Fredholm series. Thus `H_V(T)=H_κ′(p^rT)`, giving

```text
H_κ(T) = det(1-TU_p|M_cl) · H_κ′(p^rT).
```

This argument requires no bounded inverse to `D` and no surjectivity of theta.
On disc stages use the level/radius comparison with the appropriate classical
level.

For all levels where the two coefficient actions are defined and the target
`U_p` has norm at most one, prove small-slope classicality directly from theta:
if `(U_p-λ)^N f=0`, `λ≠0`, and `v_p(λ)<r`, then `Θ^r f=0`.
Indeed `U′_p-λ/p^r` is invertible by the Neumann-series criterion. This also
proves equality of the classical and overconvergent slope-`≤h` summands for
`h<r`, without requiring trivial stabilisers or the determinant factorisation.
Identify the classical level as in §5.2 and translate other determinant
normalisations using §1.3 before stating their cutoffs.

**Checks.** Polynomial degree zero has cutoff one; rescaling the operator
shifts the cutoff; and the strict inequality is retained at the boundary.
No converse bound on the slopes of all classical forms, no critical-slope
classification and no Jacquet–Langlands comparison are claimed.

## Completion checks and downstream use

Completion requires the native-carrier class-set and stabiliser theorems,
bounded weight actions and classical normalisation comparison, the invariant
evaluation model, the automorphic specialisation of §2.4 with its finite
dimensionality and Hecke dictionary, the definite realisation of §2.5 with its
dual and determinant dictionaries, the Bianchi forms of §2.6 with both of their
comparisons, actual Hecke relations and certified matrices, compactness
for the fully contracting operator, intrinsic Fredholm/base-change theorems,
the weighted annular model, its high-conductor and analytic comparison checks,
and the rational theta/classicality results. Check that the general adelic,
local-action, evaluation and algebraic Hecke interfaces carry only the hypotheses
they use, and that the definite analytic applications discharge their additional
finiteness and bounded-projection requirements. All norm, topology, finite-image
and coefficient-ring hypotheses must be visible in the interfaces. Production
proofs must contain no `sorry` or replacement axioms, and candidate imports must
be checked transitively.

General eigenvariety construction, Atkin–Lehner slope symmetries,
Jacquet–Langlands, comparison with Hilbert modular forms, general
reductive-group automorphic representations, holomorphic realisations at real
split places, overconvergent or `p`-adic families of Bianchi forms, Bianchi
modular symbols, and several-variable BGG classicality are outside this roadmap.
Detailed class-set enumerations and operator computations for individual
quaternion orders are also outside its required scope. The output here is the
forms/Hecke/Fredholm package and the automorphic and Bianchi specialisations
those developments can consume.

## References

- R. Liu, D. Wan and L. Xiao, [*The eigencurve over the boundary of weight space*](https://arxiv.org/abs/1412.2584v4),
  Proposition 3.4 (continuous-character evaluation), Proposition 3.14
  (Mahler matrix estimates), §5.4 (weighted integral models), and
  Proposition 2.17 (comparison of characteristic series). Example 5.2 and
  Remark 5.3 explain the limitations of unweighted continuous coefficients.
- K. Buzzard, [*Eigenvarieties*](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf),
  §§8–13: analytic coefficients, quaternionic forms, level/radius comparison and
  the compact controlling operator (especially Lemma 12.2).
- K. Buzzard, [*On p-adic families of automorphic forms*](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/GL1.pdf),
  §§4–7, especially Proposition 4: the rational quaternionic construction and
  theta argument, with the polynomial-degree shift made explicit above.
- D. Jacobs, [*Slopes of Compact Hecke Operators*](https://www.ma.imperial.ac.uk/~buzzard/maths/research/notes/jacobs_phd.pdf), Imperial College PhD thesis
  (2003), §§1.3–1.4 and §1.5, Definition 1.27 and equation (1.5.13):
  the single-character action and the weight convention.
- D. Loeffler, [*Overconvergent algebraic automorphic forms*](https://arxiv.org/abs/0901.2279v3),
  Assumption 3.1.3, Proposition 3.1.4 and §3.3: compactness modulo the
  centre at infinity, stabilisers and coefficient modules for definite forms;
  Definition 3.3.2 and Proposition 3.8.1: module-valued forms and their
  decomposition into automorphic representations.
- B. H. Gross, *Algebraic modular forms*, Israel J. Math. 113 (1999), 61–93:
  the rational covariance model and its automorphic realisation, consumed
  through AutomorphicFormsOnReductiveGroups §§7.4–7.5.
- C. Williams, [*P-adic L-functions of Bianchi modular forms*](https://arxiv.org/abs/1404.2100),
  Proc. London Math. Soc. 114 (2017), §1.1, Definitions 1.1–1.2 and Theorem 1.3:
  the adelic definition of weight-`(k,k)` Bianchi cusp forms and their descent
  to hyperbolic 3-space.
- G. Harder, *On the cohomology of SL(2,𝒪)*, in *Lie groups and their
  representations* (Budapest, 1971), 1975, 139–150, and *Eisenstein cohomology
  of arithmetic groups. The case GL₂*, Invent. Math. 89 (1987), 37–118: the
  Eichler–Shimura–Harder isomorphism and the archimedean cohomology of the
  Bianchi principal series.
- M. H. Şengün, [*Arithmetic aspects of Bianchi groups*](https://arxiv.org/abs/1204.6697),
  §§3 and 5: the statement `H^1_cusp(Γ, V_{k,k}(ℂ)) ≃ S_{k+2}(Γ)` and the weight
  dictionary.
- J. Voight, [*Quaternion algebras*](https://jvoight.github.io/quat.html),
  §27.6: ideal classes, finite adelic quotients and Fujisaki's lemma,
  especially Main Theorem 27.6.14(b).
- [FLT, `DivisionAlgebra/Finiteness.lean`](https://github.com/ImperialCollegeLondon/FLT/blob/f6c6a2fe9796d6d89cd2a0d24e8a453729d881ff/FLT/DivisionAlgebra/Finiteness.lean):
  the existing general division-algebra finiteness implementation to compare
  and port, rather than duplicate.

## Existing Lean work

The [WilliamCoram/PhD sources][PhDSources], pinned to
`eefb3d91f34b27d0bc7822140fa85fecae029884`, are secondary implementation
references, not the specification or build dependencies. Coordinate integration
with the author and audit each theorem's hypotheses and transitive assumptions.
In particular, a supplied `HasFiniteClassSets` hypothesis must be discharged by
the class-set theorem, rather than counted as its proof.

| Source subtree | Interface to compare |
| --- | --- |
| `PhD/TauCeti/Code/OverconvergentForms/{Quaternion,Adelic,Level,Weight}` | Arithmetic carriers, levels, local splittings and weight actions (Layers 0–1). |
| `PhD/Main/QMF` | Right-action forms, evaluation, Hecke and theta interfaces (Layers 1–5). |
| `PhD/Main/LWX` | Further arithmetic matrix estimates; generic functional-analysis and Fredholm libraries are consumed from their suppliers. |

FLT's division-algebra implementation is pinned in the references above. Its general
finiteness proof is a source for the library theorem and its quaternionic adapter
in §0.3; it is not installed as a dependency of this prototype.

[RestrictedPowerSeries]: https://github.com/WilliamCoram/TauCetiRoadmap/blob/fae4b92f3233ec656fb01ae590c2bac0abd5eb42/TauCetiRoadmap/RestrictedPowerSeries/README.md
[PadicFunctionalAnalysis]: https://github.com/WilliamCoram/TauCetiRoadmap/blob/f255de3d9ad6c27bc603f65e604108ee024c4400/TauCetiRoadmap/PadicFunctionalAnalysis/README.md
[CompactOperators]: https://github.com/WilliamCoram/TauCetiRoadmap/blob/724243bd565643c1367ea557271b8de4b572c8ec/TauCetiRoadmap/CompactOperators/README.md
[NewtonPolygons]: https://github.com/WilliamCoram/TauCetiRoadmap/blob/5164eb00764fb2ead6baadcc5cb69ff73507c8b5/TauCetiRoadmap/NewtonPolygons/README.md
[ArithmeticLocallySymmetricSpaces]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/7dca7ea300718839ee8030c95c010fe6c3414ec1/TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md
[AutomorphicFormsOnReductiveGroups]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/c00e22037db05714e6d9c274eece0c1b47c930be/TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md
[KleinianGroups]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/18e52e8169609ca42d1ab5a65bcf82c04264a7d6/TauCetiRoadmap/KleinianGroups/README.md
[GL2AutomorphicRepresentationsAndTransfer]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/69bcab779acf5f63acd89379f4c4b9fa4f947c02/TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md
[HilbertModularVarietiesAndShimuraCurves]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/893083daaaf2c0eece1322a7ed0a04571313ed45/TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md
[PhDSources]: https://github.com/WilliamCoram/PhD/tree/eefb3d91f34b27d0bc7822140fa85fecae029884
