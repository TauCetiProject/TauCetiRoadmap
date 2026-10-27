# Quantum enveloping algebras: full root data, integral PBW, and Frobenius

## Scope and placement

This roadmap develops generic quantized enveloping algebras, their integral
forms, and finite-type root-of-unity algebra maps. It complements
`QuantumGroups`: Q8 supplies the complex rank-one algebra `U_q(sl₂)` with
which QEA1 compares each simple root, not a higher-rank presentation or
specialization theorem. `Suggested.lean` states the QEA1 headline theorems
(Hopf structure, triangular decomposition, full-`Y` torus) on the
free-algebra relation quotient; the milestone contracts below are
definitive. This algebraic roadmap does not replace the
compact C*-algebra programme.

The dependency order is fixed:

1. a general Kac–Moody/root-data realization supplies the actual lattices and
   Cartan pairing;
2. this owner constructs the generic quantum algebra, Hopf structure,
   triangular decomposition and positive/negative pairing;
3. the Kac–Moody module owner consumes those maps for generic integrable
   modules, crystals and the path comparison;
4. finite-type integral PBW/specialization and root-of-unity Frobenius are
   separate QEA phases, with root-of-unity module results consuming the
   resulting algebra maps.

The generic algebra stage cannot assume the later module/crystal comparison.
The module/crystal owner cannot be required to prove QEA's algebra
presentation. In particular, it must check crystal-lattice stability for the
derived coproduct on `eᵢ=Kᵢ⁻¹Eᵢ` and `fᵢ=FᵢKᵢ`, or provide an explicit
parameter/toral rescaling or tensor-factor reversal. Do not infer stability
of an unrescaled tensor product lattice from a different coproduct convention. A finite Weyl-group longest element is used only in the finite-
type PBW/root-vector phase. Generic symmetrizable Kac–Moody algebra uses the
finite-rank Cartan datum and its real-root reflection action; it does not
pretend to have a global `w₀` or a finite positive-root PBW list.

The algebraic inputs are KacMoody, KM0, for the full realization and RepresentationTheory/RootSystems, Layer 3, for abstract Coxeter combinatorics. QuantumGroups, Q8 item 1, supplies the rank-one presentation and Hopf structure compared in QEA1. The finite classical comparisons use RepresentationTheory/LieHighestWeight, Layers 3–6, and ReductiveGroups, Layer 9A; their finite hypotheses do not restrict the generic algebra. The path and divisor boundary uses SchubertGeometry, S4 and S7. These are construction contracts; the order above selects their independent supplier clauses before any downstream application.

## QEA0. Actual datum and conventions

Take a finite index type `I`, a symmetrizable generalized Cartan matrix
`A = (aᵢⱼ)`, with the convention

`aᵢⱼ = ⟨αⱼ, hᵢ⟩`.

Specify positive integers `dᵢ` satisfying `dᵢ aᵢⱼ = dⱼ aⱼᵢ`, a free weight
lattice `X`, a free cocharacter lattice `Y`, a perfect integral pairing
`⟨-, -⟩ : X × Y → ℤ`, and simple roots `αᵢ ∈ X` and simple coroots
`hᵢ ∈ Y` realizing `A`. Retain the full `X,Y` root datum, including central
and isogeny data. Do not silently replace `Y` by the coroot lattice or `X` by
the root lattice, and do not assume a direct-sum splitting of a central
lattice. The early KM owner must provide the general realization and maps;
finite RootSystems data supplies finite root geometry, not a singular Cartan
realization.

For a formal parameter `v`, put `K = ℚ(v)`, `vᵢ = v^{dᵢ}`, and use symmetric
quantum integers

`[m]ᵢ = (vᵢ^m − vᵢ^(−m))/(vᵢ − vᵢ^(−1))`,

with `[m]ᵢ!` and quantum binomials defined in `K`. In nonsimply-laced type,
every divided power, quantum binomial and braid coefficient uses the
corresponding `vᵢ`; `aᵢⱼ` and `aⱼᵢ` are never interchanged by an ADE-only
shortcut. All module weights live in the supplied `X`.

The finite-type root-of-unity phase uses an explicitly fixed odd integer
`ℓ ≥ 3` with `gcd(ℓ,dᵢ)=1` for every `i`, a primitive `ℓ`th root `ζ`, and
`R = ℤ[ζ]`. Thus every `ζᵢ = ζ^{dᵢ}` has order `ℓ`. The even-order case is a
separate theorem with its own cyclotomic ring, modified root datum and
small-order exceptions; it is not inferred from the odd case. For generic
results `v` is indeterminate. No analytic or unit-circle specialization is
implicit.

The QEA1 presentation is written over an arbitrary field `k` with a parameter
`q∈k`, `qᵢ=q^{dᵢ}`; `U_v(A,X,Y)` is the case `k=ℚ(v)`, `q=v`. Its Hopf
structure and divided-power Serre relations are stated under `q≠0` and the
genericity hypothesis that no `qᵢ` is a root of unity, which makes every
`[r]ᵢ!` nonzero in `k`. Evaluation `v↦q` is a ring map `ℚ(v)→k` only when `q`
is transcendental over the prime field, so a statement over `ℚ(v)` is not
transported to an algebraic generic `q` by scalar extension: it is proved over
`(k,q)` directly, or over `ℤ[v,v⁻¹]` (QEA3) and then base changed.

## QEA1. Generic Drinfeld–Jimbo algebra and Hopf structure

For the given datum construct `U_v(A,X,Y)` as the quotient of the free
associative `K`-algebra on `Eᵢ,Fᵢ` and the toral symbols `K_μ` (`μ ∈ Y`) by
actual relations. The torus satisfies `K_0=1`, `K_μ K_ν=K_(μ+ν)`, and

`K_μ Eᵢ K_(−μ) = v^⟨αᵢ,μ⟩ Eᵢ`,
`K_μ Fᵢ K_(−μ) = v^(−⟨αᵢ,μ⟩) Fᵢ`.

Set `Kᵢ := K_(dᵢ hᵢ)`. The simple commutator is

`Eᵢ Fⱼ − Fⱼ Eᵢ = δᵢⱼ (Kᵢ − Kᵢ⁻¹)/(vᵢ − vᵢ⁻¹)`.

For `i ≠ j`, impose the divided-power quantum Serre relations

`Σ_(r+s=1−aᵢⱼ) (−1)^r Eᵢ^(r) Eⱼ Eᵢ^(s) = 0`,
`Σ_(r+s=1−aᵢⱼ) (−1)^r Fᵢ^(r) Fⱼ Fᵢ^(s) = 0`,

where the divided powers use `[r]ᵢ!`. Prove the universal property for
homomorphisms into an arbitrary `K`-algebra and identify the simple-root
relations with the actual KM Cartan convention.

Rank-one comparison with QuantumGroups, Q8 item 1. Take `k=ℂ` and `q∈ℂ`
nonzero and not a root of unity, the setting of Q8, and fix `i∈I`. Q8's
algebra with parameter `qᵢ=q^{dᵢ}` (generators `E,F,K,K⁻¹`, `KE=qᵢ²EK`,
`EF−FE=(K−K⁻¹)/(qᵢ−qᵢ⁻¹)`) maps to the QEA1 algebra over `(ℂ,q)` by
`E↦Eᵢ`, `F↦Fᵢ`, `K↦K_(dᵢhᵢ)`, `K⁻¹↦K_(−dᵢhᵢ)`. Prove this is a
well-defined injective Hopf algebra map (the relations hold because
`⟨αᵢ,dᵢhᵢ⟩=2dᵢ`; the coproducts agree since Q8 pins `ΔE=E⊗1+K⊗E`,
`ΔF=F⊗K⁻¹+1⊗F`), with image the subalgebra generated by `Eᵢ,Fᵢ,K_(±dᵢhᵢ)`.
The rank-one torus is `K_(ℤdᵢhᵢ)` only; every other `K_y`, `y∈Y`, stays
outside the image, and no splitting of `Y` along `ℤhᵢ` is assumed. The
comparison is made over `(ℂ,q)`, not by extending scalars from `ℚ(v)`.

Fix the `QuantumGroups` Q8 Hopf convention throughout:

`Δ(K_μ)=K_μ⊗K_μ`,
`Δ(Eᵢ)=Eᵢ⊗1 + Kᵢ⊗Eᵢ`,
`Δ(Fᵢ)=Fᵢ⊗Kᵢ⁻¹ + 1⊗Fᵢ`,
`ε(K_μ)=1`, `ε(Eᵢ)=ε(Fᵢ)=0`,
`S(K_μ)=K_(−μ)`, `S(Eᵢ)=−Kᵢ⁻¹Eᵢ`, `S(Fᵢ)=−FᵢKᵢ`.

Verify each relation and every Hopf identity on the quotient. Derive the
coproduct, counit and antipode formulas for all divided powers and toral
binomials. With this convention they are, for `n≥0`,

`Δ(Eᵢ^(n)) = Σ_(a+b=n) vᵢ^(ab) Eᵢ^(a)Kᵢ^b ⊗ Eᵢ^(b)`,
`Δ(Fᵢ^(n)) = Σ_(a+b=n) vᵢ^(ab) Fᵢ^(a) ⊗ Fᵢ^(b)Kᵢ^(−a)`,
`S(Eᵢ^(n)) = (−1)^n vᵢ^(n(n−1)) Kᵢ^(−n)Eᵢ^(n)`,
`S(Fᵢ^(n)) = (−1)^n vᵢ^(−n(n−1)) Fᵢ^(n)Kᵢ^n`,

obtained from `(Kᵢ⊗Eᵢ)(Eᵢ⊗1)=vᵢ²(Eᵢ⊗1)(Kᵢ⊗Eᵢ)`,
`(Fᵢ⊗Kᵢ⁻¹)(1⊗Fᵢ)=vᵢ²(1⊗Fᵢ)(Fᵢ⊗Kᵢ⁻¹)` and
`Eᵢ Kᵢ⁻¹=vᵢ²Kᵢ⁻¹Eᵢ`. Check at `n=2`: expanding `(Eᵢ⊗1+Kᵢ⊗Eᵢ)²` gives the
middle term `(1+vᵢ²)EᵢKᵢ⊗Eᵢ = vᵢ[2]ᵢ EᵢKᵢ⊗Eᵢ`, so the `a=b=1` coefficient
of `Δ(Eᵢ^(2))` is `vᵢ`, not `1` and not `vᵢ⁻¹` (the values for the
opposite factor order). Prove the antipode is bijective and state its
inverse. For the module/crystal boundary expose the normalized root operators
`eᵢ=Kᵢ⁻¹Eᵢ`, `fᵢ=FᵢKᵢ`; derive
`Δ(eᵢ)=eᵢ⊗Kᵢ⁻¹+1⊗eᵢ` and
`Δ(fᵢ)=fᵢ⊗1+Kᵢ⊗fᵢ`. The downstream KM module owner consumes these operators
and proves the actual Kashiwara-lattice transport. There is one Hopf
structure, the one fixed here. Generic modules, tensor products and duals consume this Hopf API.

Define positive and negative halves `U_v^+` and `U_v^-` as the actual
q-Serre quotients of the free algebras. Prove their embeddings into `U_v`,
the triangular multiplication isomorphism

`U_v^- ⊗_K K[Y] ⊗_K U_v^+  ≃  U_v`,

and the root-lattice grading.

`Suggested.lean` states these over an arbitrary field `k` with parameter `q`,
under `q≠0` and the hypothesis that every `[n]ᵢ!` is nonzero (no `qᵢ` a root
of unity). The datum is `CartanDatum`, the algebra is `U`, the `RingQuot` of
the free algebra by `Relation`, and the coproduct and counit are the algebra
maps `comulAlgHom` and `counitAlgHom` with the generator values above. The
coalgebra laws are `comul_coassoc`, `counit_comul_left` and
`counit_comul_right`, which make `bialgebra` a Mathlib `Bialgebra`;
`exists_antipode` gives a two-sided convolution inverse of the identity that
is bijective and takes the antipode values above on `Eᵢ`, `Fᵢ` and `K_y`.
`triangular_bijective` states the triangular decomposition with `U^-`,
`U^0`, `U^+` the subalgebras generated by the `Fᵢ`, the `K_y` and the `Eᵢ`,
and `Ktorus_linearIndependent` states that the `K_y`, `y∈Y`, are linearly
independent, so that `U^0` is the group algebra of the whole lattice `Y`. Let `Q_A=⊕ᵢℤαᵢ` and define `χ(αᵢ,αⱼ)=v^(dᵢaᵢⱼ)`, extended
bilinearly. Give `U_v^+` the braided tensor multiplication
`(a⊗b)(c⊗d)=χ(|b|,|c|)ac⊗bd` and braided coproduct map
`r₊:U_v^+→U_v^+⊗_χU_v^+` with `r₊(Eᵢ)=Eᵢ⊗1+1⊗Eᵢ`; give `U_v^-` the
standard negative braided tensor multiplication
`(a⊗b)(c⊗d)=χ(|b|,|c|)⁻¹ac⊗bd` and braided coproduct map
`r₋:U_v^-→U_v^-⊗_(χ⁻¹)U_v^-` with `r₋(Fᵢ)=Fᵢ⊗1+1⊗Fᵢ`. Here
`deg(Eᵢ)=αᵢ`, `deg(Fᵢ)=−αᵢ`, and `κ(αᵢ)=dᵢhᵢ`. Prove each map descends
through its q-Serre ideal and satisfies braided coassociativity and the
counit identities. Construct the braided antipodes as convolution inverses;
for the negative half require
`S₋(1)=1`, `S₋(Fᵢ)=−Fᵢ`,
`S₋(ab)=χ(|a|,|b|)⁻¹S₋(b)S₋(a)`, and
`m(S₋⊗id)r₋=ηε=m(id⊗S₋)r₋`; state and verify the corresponding χ-braided
positive identities. These are maps on the nilpotent halves, whose
codomains contain no toral symbols. Reconstruct the ordinary Borel
coproducts by
`Δ_B₊(x)=Σx₁K_(κ(|x₂|))⊗x₂` from `r₊(x)=Σx₁⊗x₂`, and
`Δ_B₋(y)=Σy₁⊗K_(κ(|y₁|))y₂` from `r₋(y)=Σy₁⊗y₂`. The negative torus
factor is before `y₂`; this bosonization gives the QEA1 raw `Fᵢ` coproduct.

Define the positive/negative nilpotent pairing `p` on the actual q-Serre
quotients, with `p(Eᵢ,Fⱼ)=δᵢⱼcᵢ` and `cᵢ=(vᵢ−vᵢ⁻¹)⁻¹`. For homogeneous
terms, the Sweedler components below mean `r₊` and `r₋`, respectively:
`p(xx′,y)=Σp(x,y₁)p(x′,y₂)` and
`p(x,yy′)=χ(|y|,|y′|)⁻¹Σp(x₁,y′)p(x₂,y)`. Extend bilinearly, make `p`
zero unless the degrees are opposite, and use the counit unit values. Verify
descent through both Serre ideals and prove nondegeneracy under the hypotheses
actually used. In rank one these formulas give
`p(Eᵢ²,Fᵢ²)=(1+vᵢ⁻²)cᵢ²`, which checks the negative χ⁻¹ convention.

For the Borel pairing use the positive-first, negative-second Hopf algebras
`B₊=U_v^+⋊K[Y]` and `B₋=U_v^-⋊K[Y]` with the actual coproducts fixed above
and the torus coproduct. Write `⟨−,−⟩:B₊×B₋→K′`, where `K′` is the extension
used for `β_t` below. Fix the skew equations, for `a,a′∈B₊`, `b,b′∈B₋`, as
`⟨aa′,b⟩=Σ⟨a,b₁⟩⟨a′,b₂⟩` and
`⟨a,bb′⟩=Σ⟨a₁,b′⟩⟨a₂,b⟩`, with unit rules
`⟨1,b⟩=ε(b)` and `⟨a,1⟩=ε(a)`. Set
`⟨Eᵢ,Fⱼ⟩=δᵢⱼcᵢ`, `⟨Eᵢ,K_y⟩=0`, `⟨K_y,Fᵢ⟩=0`, and
`⟨K_y^+,K_z^-⟩=β_t(y,z)`; extend by these equations. Verify well-definedness,
Serre-ideal compatibility and the mixed generator identities. Use the double
cross rule
`Σ⟨a₁,b₁⟩a₂b₂=Σ⟨a₂,b₂⟩b₁a₁`. With these conventions the `Eᵢ,Fⱼ` cross
relation is exactly
`EᵢFⱼ−FⱼEᵢ=δᵢⱼ(Kᵢ−Kᵢ⁻¹)/(vᵢ−vᵢ⁻¹)`; the toral conjugations must also recover
`K_yEᵢK_(−y)=v^⟨αᵢ,y⟩Eᵢ` and
`K_yFᵢK_(−y)=v^(−⟨αᵢ,y⟩)Fᵢ`. In particular
`⟨K_(dᵢhᵢ)^+,K_y^-⟩=⟨K_y^+,K_(dᵢhᵢ)^-⟩=v^⟨αᵢ,y⟩`.

Construct the toral bicharacter instead of treating it as datum. Put
`H_Q=span_Q{hᵢ}⊂Y⊗Q`. The early Kac–Moody realization supplies independent
`hᵢ`. Define a symmetric rational form on `H_Q×(Y⊗Q)` by
`b(dᵢhᵢ,y)=⟨αᵢ,y⟩`. It is consistent on `H_Q×H_Q`, since
`⟨αᵢ,dⱼhⱼ⟩=dⱼaⱼᵢ=dᵢaᵢⱼ=⟨αⱼ,dᵢhᵢ⟩`. Extend it symmetrically to
`Y⊗Q`; the extension is part of the construction and may be degenerate.
Choose `N>0` clearing all denominators of `b`, adjoin `t` with `t^N=v`, and
over `K'=Q(t)` set `β_t(y,z)=t^(N b(y,z))`. Then `β_t` is a bicharacter on
the whole lattice and
`β_t(dᵢhᵢ,y)=v^⟨αᵢ,y⟩`, with the same value in the reversed order. Compute
its radical `R_b={y∈Y | b(y,z)=0 for every z∈Y}`. The group algebra
generated by `K_r`, `r∈R_b`, is central; also retain every root-annihilating
torus element `K_c` with `⟨αᵢ,c⟩=0` for every `i`. Do not divide out any
of these central torus generators or assert full toral nondegeneracy.

Form the two Borel carriers over `K'` with this pairing. Define their
torus-amalgamated double by identifying the two copies of `K_y` for every
`y∈Y`, retaining all central `K_y` generators, and imposing the displayed
mixed relations. Give the explicit generator map to the full-`Y` quotient
`U_v(A,X,Y)⊗_K K'`, sending each positive or negative simple generator to
`Eᵢ` or `Fᵢ` and both toral copies to `K_y`. Prove it is an isomorphism by
checking the defining relations in both directions and using the triangular
factorization; in particular, do not infer the comparison merely from a
nondegeneracy assertion. Show that the defining cross-relations descend to
`K=Q(v)` and give the inverse comparison with the original full-`Y`
presentation. Prove nondegeneracy of the braided pairing on the nilpotent
halves under the hypotheses actually used, and state separately what radical
remains on the Borel torus. State completion only where an infinite sum is
used. These constructions apply to finite-rank symmetrizable data without a
finite `w₀`; they supply the algebraic input consumed by the later generic
module theory.

For an arbitrary symmetrizable datum, this phase does not enumerate every
positive root or assert a finite ordered-root PBW basis. The finite-type
root-vector phase below is a genuine specialization with extra hypotheses.

## QEA2. Finite-type braid operators and root vectors

Assume the supplied root datum is finite type, with finite Weyl group `W` and
longest element `w₀`. Fix the following Lusztig braid-operator variant. Write
`Kᵢ=K_(dᵢhᵢ)` and `vᵢ=v^{dᵢ}`. The simple-root and toral formulas are

`Tᵢ(Eᵢ)=−FᵢKᵢ`, `Tᵢ(Fᵢ)=−Kᵢ⁻¹Eᵢ`,
`Tᵢ(K_μ)=K_(sᵢ μ)`.

For `j ≠ i`, use the following factor order and signs:

`Tᵢ(Eⱼ)=Σ_(r=0)^(−aᵢⱼ) (−1)^(r−aᵢⱼ) vᵢ^(−r)
 Eᵢ^(−aᵢⱼ−r) Eⱼ Eᵢ^(r)`,

`Tᵢ(Fⱼ)=Σ_(r=0)^(−aᵢⱼ) (−1)^(r−aᵢⱼ) vᵢ^r
 Fᵢ^(r) Fⱼ Fᵢ^(−aᵢⱼ−r)`.

Prove these formulas preserve every defining relation; give the explicit
inverse-generator formulas for this same variant and prove both composites
are identities. Prove the braid relations with length determined by
`aᵢⱼaⱼᵢ` (including lengths 2, 3, 4, 6) and no isolated-entry shortcut. On
the torus prove the formula is the reflection on the actual `Y` lattice.
The displayed consequence
`Tᵢ(Kⱼ)=KⱼKᵢ^(−aᵢⱼ)` holds in every symmetrizable type: with
`aᵢⱼ=⟨αⱼ,hᵢ⟩`,
`sᵢ(dⱼhⱼ)=dⱼhⱼ−dⱼaⱼᵢhᵢ=dⱼhⱼ−dᵢaᵢⱼhᵢ` by symmetrizability.
Derive it from `Tᵢ(K_μ)=K_(sᵢμ)`; retain the general formula on arbitrary
`K_μ` and do not interchange `aᵢⱼ` with `aⱼᵢ` or omit the `d` factors.

For a reduced expression `w₀=s_(i₁)…s_(i_N)`, define the ordered positive
roots `β_k=s_(i₁)…s_(i_(k−1))(α_(i_k))` and root vectors
`E_(β_k)=T_(i₁)…T_(i_(k−1))(E_(i_k))`, `F_(β_k)` analogously. Define divided
root powers inside `U_v` by the corresponding `v_(β_k)` factorials. Prove
independence of the braid action, root-vector membership in the integral
form, the straightening relations and the basis below. The *ordered basis*
depends on the chosen reduced word; prove integral transition maps between
reduced-word bases, not literal equality of their ordered monomials. Include
the two `A₂` reduced words `121` and `212` as a check of root order and braid
normalization.

## QEA3. Full-Y integral extension and finite-type PBW

Let `A=ℤ[v,v⁻¹]`. Define `U_A` as the `A`-subalgebra of the actual
`U_v(A,X,Y)` generated by all `Eᵢ^(m)`, `Fᵢ^(m)`, `K_μ` for `μ∈Y`, and
the toral quantum binomials for the chosen integral torus. The simple-coroot symbols are

`[Kᵢ;0 choose m] = Π_(s=1)^m
 (Kᵢ vᵢ^(−s+1) − Kᵢ⁻¹ vᵢ^(s−1))/(vᵢ^s − vᵢ^(−s))`.
For each `y∈Y`, also include the full-lattice binomials
`[K_y;0 choose m]_v` with the same formula using `K_y` and `v`. This full-Y
extension is deliberate: it retains central toral directions and is not
silently identified with the smaller standard semisimple toral form. Prove
the integral toral straightening and basis-change identities, so the
construction is independent of the chosen `ℤ`-basis of `Y` and does not
require a splitting of the central or coroot sublattice.

Choose a `ℤ`-basis `y₁,…,y_r` of the full free lattice `Y`, and define the
full-lattice toral form using the group elements `K_y` and quantum binomials
`[K_y;0 choose n]` in these basis directions. Prove that its `A`-basis is
`K_(Σ_j ε_j y_j) · ∏_j [K_(y_j);0 choose n_j]`, with
`ε_j∈{0,1}` and `n_j∈ℕ`; prove spanning, linear independence and integral
change-of-basis formulas for every other basis of `Y`. Prove that each simple
coroot binomial `[Kᵢ;0 choose m]` and every required full-`Y` binomial lies in
this form, and that adjoining them does not enlarge it. This construction
retains central directions and does not split off a central lattice. It is a
coordinate construction whose basis-change theorem is part of the target,
not a claim that the chosen coordinates are canonical. Use
`ε∈{0,1}`. A family with `ε=±1` in place of `ε∈{0,1}` fails already over the generic
one-dimensional torus: write `C_n(K)=[K;0 choose n]`. For `n>0`,
`C_n(1)=C_n(−1)=0` because its numerator contains `K−K⁻¹`; for `n=0`,
`K(1)=K⁻¹(1)=1` and `K(−1)=K⁻¹(−1)=−1`. Every linear combination of
`K C_n(K)` and `K⁻¹ C_n(K)` therefore has values satisfying
`f(−1)=−f(1)`, while the constant `1` does not. Thus that family does not
span the generic toral form. The `ε∈{0,1}` basis above still requires its
own spanning, independence and basis-change proof.

With a proved toral basis `B_Y`, prove that the products

`F_(β₁)^(a₁)…F_(β_N)^(a_N) · t ·
 E_(β₁)^(b₁)…E_(β_N)^(b_N)`

for `a_k,b_k∈ℕ` and `t∈B_Y` form an `A`-basis of `U_A`. Prove integral
straightening and multiplication, for example

`E_α^(a) E_α^(b) = [a+b choose a]_(v_α) E_α^(a+b)`,

and the corresponding divided-power opposite-root and different-root
commutation formulas. Keep every coefficient in `A`; identify and retain
primes in nonsimply-laced coefficients rather than invert them to simplify a
formula. Prove the integral Hopf structure preserves `U_A`; base change its
free `A`-basis and Hopf maps to every commutative `A`-algebra without
redefining a specialized divided power by division by a vanishing factorial.

At `v=1`, prove the quotient with `K_μ=1` for all `μ` identifies with the
full-`Y` classical Kostant form from ReductiveGroups 9A, including each
`binom(H_y,m)`. The semisimple presentation uses only simple-Cartan binomials; the full-`Y`
extension and its comparison to ReductiveGroups 9A are part of this target. Compare the full `X,Y` root datum maps under central
isogenies. A rational Lie-algebra isomorphism alone does not identify
integral forms. The `ε∈{0,1}` choice above is part of the basis theorem.

## QEA4. Integral highest-weight lattices and the generic-module boundary

For finite type and dominant `λ∈X`, construct the generic finite-dimensional
type-1 highest-weight module and a highest vector `v_λ`. Define
`V_A(λ)=U_A·v_λ`; prove it is a finite free `A`-lattice, exhibit a basis and
prove stability under every divided power and toral binomial. Prove base
change gives an action of `U_R` for every commutative `A`-algebra `R`.

The generic type-1 highest-weight classification, character equality and
integrable module/crystal comparison are downstream KM module-owner work.
QEA supplies the algebra, Hopf, root operators, divided powers and lattice
maps; it does not make its generic presentation depend on that later
classification. The characteristic-zero `v=1` comparison consumes
ReductiveGroups 9A and LieHighestWeight's finite-dimensional highest-weight
modules. Do not infer simplicity after an arbitrary specialization from
generic simplicity or from the `v=1` comparison.

## QEA5. Odd-order quantum Frobenius for finite type

Assume finite type, `ℓ≥3` odd and coprime to every `dᵢ`, and fix a primitive
`ℓ`th root `ζ` together with the map `A→R=ℤ[ζ]`, `v↦ζ`. Put
`U_ζ=U_A⊗_A R`. Construct the classical target `U_ℤ(g)⊗_ℤ R` using the
full-`Y` Kostant form, and construct a Hopf algebra homomorphism

`Fr : U_ζ → U_ℤ(g)⊗R`.

On the pinned generators it has

`Fr(Eᵢ^(m)) = Xᵢ^(m/ℓ)` and
`Fr(Fᵢ^(m)) = Yᵢ^(m/ℓ)` when `ℓ | m`, and zero otherwise;
`Fr(K_μ)=1`;
`Fr([Kᵢ;0 choose m]) = binom(H_(hᵢ),m/ℓ)` when `ℓ | m`, and zero
otherwise, with the `vᵢ`-binomial normalization. For each `y∈Y`, also prove
the matching formula for its full-lattice toral binomial in the `H_y`
direction, with the formula derived from the chosen full-`Y` toral basis.
Prove well-definedness
on every defining relation, coproduct/counit/antipode compatibility and
compatibility with the chosen central-isogeny maps. Do not define these
specialized operators by dividing by `[m]!` after specialization.

Construct the positive and negative divided-power maps separately on their
actual nilpotent domains. Do not call either one a unital section of all
`U_ℤ(g)` unless a separate construction proves it. Any positive Frobenius map on Cartan binomials has its own stated domain:
a positive nilpotent algebra does not contain toral generators.

### Even order: the modified Frobenius map

Let `ℓ≥2` be even, let `A=ℤ[v,v⁻¹]`, and specialize through
`A_ℓ=A/(Φ_(2ℓ)(v))` with image `ζ` of order `2ℓ`, so `ζ^ℓ=−1`. Start with
the finite-type root datum already fixed in QEA0: finite free `X,Y` with
perfect pairing, roots `αᵢ`, coroots `hᵢ`, Cartan entries
`aᵢⱼ=⟨αⱼ,hᵢ⟩`, and positive integral symmetrizers `dᵢ`. Put

`ℓᵢ = min {m>0 : m dᵢ ∈ ℓℤ} = ℓ/gcd(ℓ,dᵢ)`,

`X* = {λ∈X : ⟨λ,hᵢ⟩∈ℓᵢℤ for every i}`, and `Y*=Hom(X*,ℤ)` with its
evaluation pairing. Use the actual inclusion `X* ↪ X` and restriction
`Y → Y*`. Define `αᵢ* = ℓᵢ αᵢ ∈ X*`, define
`hᵢ*(λ)=⟨λ,hᵢ⟩/ℓᵢ` on `X*`, and hence
`aᵢⱼ* = ℓⱼ aᵢⱼ/ℓᵢ` and `dᵢ* = ℓᵢ² dᵢ`. Prove these are integral and
satisfy the modified Cartan and symmetrizer identities. The target parameter
is `ζᵢ* = ζ^(dᵢ ℓᵢ²) ∈ {1,−1}`. Do not identify the target with the ordinary
classical enveloping algebra when one of these parameters is `−1`.

Build the modified algebra from the actual algebra, not from a list of
generators. Over `K=ℚ(v)`, let `1_λ` (`λ∈X`) be the projection onto the
`λ`-weight space, as an operator on `X`-weight modules of `U_v(A,X,Y)` (on
which `K_y` acts on weight `λ` by `v^⟨λ,y⟩`), and put
`dot U(X,Y)=⊕_(λ∈X) U_v 1_λ`; it is a non-unital, locally unital
`K`-algebra with orthogonal idempotents `1_λ`. Define `dot U_A(X,Y)` as its
`A`-subalgebra generated by all `Eᵢ^(n)1_λ` and `Fᵢ^(n)1_λ`, `n≥0`
(McGerty2006 §2, lines 120–157, after Lusztig 23.2). Prove that
`dot U_A(X,Y)=⊕_λ U_A 1_λ` for the QEA3 form `U_A`, that it is a free
`A`-module, that `K⊗_A dot U_A(X,Y)→dot U(X,Y)` is an isomorphism, and put
`dot U_R(X,Y)=R⊗_A dot U_A(X,Y)` for every commutative `A`-algebra `R`.

Let `U_A^+` and `U_A^-` be the `A`-subalgebras of `U_v^+` and `U_v^-`
generated by all `Eᵢ^(n)`, respectively all `Fᵢ^(n)`, with the whole algebra
structure they inherit, and `R U^±=R⊗_A U_A^±`; these are free over `A` by
the QEA3 PBW basis. Prove the presentation (McGerty2006 Lemma 2.2, line 161,
from Lusztig 31.1.3): for every `A`-algebra `R`, `dot U_R(X,Y)` is generated
by the elements `u⁺1_λu⁻` and `u⁻1_λu⁺` with `u^±∈R U^±` and `λ∈X`, subject
to the following relations.

- `dot U_R` is a left module for `R U^+` and for `R U^-`. Hence every
  relation of the integral halves holds, not only the generic quantum
  Serre relations with one undivided `Eⱼ` or `Fⱼ`.
- `(u1_λ)(1_μu′)=δ_(λ,μ)u1_λu′`, and `Eᵢ^(n)1_λ=1_(λ+nαᵢ)Eᵢ^(n)1_λ`,
  `Fᵢ^(n)1_λ=1_(λ−nαᵢ)Fᵢ^(n)1_λ`.
- For `i≠j`: `Eᵢ^(a)1_λFⱼ^(b)=Fⱼ^(b)1_(λ+aαᵢ+bαⱼ)Eᵢ^(a)`.
- For `i=j`:
  `Eᵢ^(a)1_λFᵢ^(b) = Σ_(t=0)^min(a,b) [⟨λ,hᵢ⟩+a+b choose t]ᵢ Fᵢ^(b−t)1_(λ+(a+b−t)αᵢ)Eᵢ^(a−t)`,
  and the corresponding formula for `Fᵢ^(a)1_λEᵢ^(b)`.

The relations hold for every `R` because `U_A^±` are free over `A`; the
specialized halves `R U^±` are the base changes of the integral halves, not
the quotients of free algebras by the generic Serre relations. At an even
order the generic relations do not generate the integral ones: in normalized
`A₁×A₁` with `ℓ=2` and `ζ=i`, `F₁^(2)F₂^(2)=F₂^(2)F₁^(2)` holds in `U_A^-`
(it holds in `U_v^-`, which contains `U_A^-`) and hence in `R U^-`, but it
follows from `F₁F₂=F₂F₁` only after dividing by `[2]₁![2]₂!=(v+v⁻¹)²`,
whose image `(i+i⁻¹)²` is `0`. A presentation with only the
generic Serre families, same-root products and the mixed relations has a
module over `ℂ⟨x,y⟩` in which odd divided powers act by zero and the second
divided powers of `F₁,F₂` act by left multiplication by `x` and `y`; there
`F₁^(2)F₂^(2)−F₂^(2)F₁^(2)` sends `1` to `xy−yx≠0`.

Prove the toral multiplier laws on this algebra. For
`y∈Y`, the source multiplier `K_y` acts on `1_λ` by
`ζ^⟨λ,y⟩`; its full-lattice toral binomial `C_y(c,n)` acts by the signed
symmetric-Gaussian value `[⟨λ,y⟩+c choose n]_ζ` (for every `c∈ℤ`,
`n∈ℕ`, with the declared integral normalization). For `λ∈X*` set
`y*=y|_(X*)∈Y*`. On that same actual label prove the explicit target laws
`K*_(y*)1_λ=ζ^⟨λ,y*⟩1_λ` and
`C*_(y*)(c,n)1_λ=[⟨λ,y*⟩+c choose n]_ζ1_λ`. Thus the source and target
multiplier scalars agree by restriction and evaluation on `λ`; the target
Gaussian here is evaluated at the original `ζ`. Do not replace `λ` by `λ/ℓ`
or import the odd-order unmodified full-`Y` scaling formula without a proof
for this modified lattice.

For each finite subset `S⊂X`, the sum `Σ_(λ∈S)1_λ` is a local unit on
finitely many elements supported at those source and target weights. There
is no global identity when `X` is infinite. Construct the target
`dot U*_(A_ℓ)(X*,Y*)` by the same construction for the star datum: the
modified form of the star datum's `U_v`, its `A`-subalgebra generated by the
divided powers, and its base change, with the presentation above over the
star datum's own integral halves; it has its own star-weight
idempotents and is not an ordinary unital Hopf algebra.

Assume the exact Lusztig hypotheses

`ℓᵢ ≥ 1−aᵢⱼ whenever i≠j and ℓⱼ≥2`, and the Cartan diagram has no odd
cycle.

Construct the surjective non-unital algebra homomorphism

`Fr : dot U_(A_ℓ)(X,Y) → dot U*_(A_ℓ)(X*,Y*)`

on generators by

`Fr(Eᵢ^(n)1_λ) = eᵢ^(n/ℓᵢ)1_λ` and
`Fr(Fᵢ^(n)1_λ) = fᵢ^(n/ℓᵢ)1_λ`

when `λ∈X*` and `ℓᵢ | n`, and by zero otherwise. At `n=0`, this sends
`1_λ` to the target `1_λ` for `λ∈X*`, and to zero for `λ∉X*`. Prove the map
is well-defined on the presentation, respects the finite-support local-unit
actions, is surjective, and pulls every target `X*`-weight module back to a
source `X`-weight module supported on `X*`. Prove the full-`Y` multiplier
intertwining on every `1_λ` using the scalar laws above; do not infer a
unital Hopf map from this modified-algebra homomorphism.

For every normalized simply-laced finite-type datum (`dᵢ=1`), these
conditions hold for every even `ℓ≥2`: `ℓᵢ=ℓ`, `ζᵢ*=ζ^(ℓ²)=1`, and the target
is the classical modified enveloping algebra for the actual lattice
`(X*,Y*)`. This does not identify `(X*,Y*)` with an independently chosen
simply-connected lattice. For other positive symmetrizer normalizations,
retain the general hypotheses above; for example, in type `A₁` with `d₁=2`
and `ℓ=2`, `ℓ₁=1` and `ζ₁*=−1`, so the ordinary classical-target conclusion
does not follow from the type name alone. For non-simply-laced data, state
and prove the displayed order hypotheses rather than asserting all even
orders. They fail for `B₂` and `G₂` at `ℓ=2`, so this theorem makes no
Frobenius claim in those cases.

As a regression, the ordinary unmodified rule `Fr(Kᵢ)=1` cannot accompany
the divided-power rule `Fr(Eⱼ^(ℓ))=Xⱼ` in adjacent normalized simply-laced
type `A₂`: when `ζ^ℓ=−1` and `aᵢⱼ=−1`, conjugation gives
`Kᵢ Eⱼ^(ℓ) Kᵢ⁻¹ = −Eⱼ^(ℓ)`, whereas the proposed classical image is fixed
by `Fr(Kᵢ)=1`. This obstruction is to that ordinary unmodified map; the
modified-algebra map above uses the star weight idempotents.

## QEA6. Root-of-unity modules, heads and Frobenius pullback

Separate four objects in every statement: the integral Weyl lattice, its
specialized Weyl module, its simple head, and the Frobenius pullback of a
classical module. After an explicit embedding `R→ℂ`, construct the
finite-dimensional type-1 modules and prove the root-of-unity assertions with
the stated `ℓ` hypotheses. For a classical simple `L(λ)`, the Frobenius
pullback `Fr^*L(λ)` has ordinary `Eᵢ,Fᵢ` acting by zero for `ℓ>1`, and
`Eᵢ^(ℓ),Fᵢ^(ℓ)` acting as `Xᵢ,Yᵢ`; its highest weight in the quantum weight
lattice is `ℓλ`. Prove

`Fr^* L(λ) ≅ L_ζ(ℓλ)`,

where `L_ζ(ℓλ)` denotes the simple highest-weight module, and separately
construct the surjection from the quantum Weyl module
`Δ_ζ(ℓλ) → L_ζ(ℓλ)`. Dualize using the pinned antipode and dual convention.

For the quantum-Lucas formula allow every integer upper argument
`m∈ℤ` and lower argument `r∈ℕ`. Define the symmetric Gaussian binomial for
signed `m` by its Laurent-polynomial extension from
`∏_(j=1)^r [m−j+1]_v/[j]_v`. Write the Euclidean decompositions
`m=m₀+ℓm₁`, `r=r₀+ℓr₁`, with `0≤m₀,r₀<ℓ`, `m₁∈ℤ` and `r₁∈ℕ`. Prove

`[m choose r]_ζ = [m₀ choose r₀]_ζ · binom(m₁,r₁)`,

where the ordinary binomial for negative integer upper argument is its
integer-valued polynomial value. In particular
`[−ℓ choose ℓ]_ζ=binom(−1,1)=−1`. This signed formula is the one used for
toral eigenvalues on all integral weights; the nonnegative-upper case is
included.

Derive toral quantum-binomial eigenvalues on actual highest-weight vectors
from this formula. Do not conclude that a nonzero integer
`⟨λ,hᵢ⟩` makes `Fᵢv_λ` a highest vector: test every positive divided power
on that vector. Give the explicit rank-one counterexamples and nonsimple
specialized Weyl modules, with the simple head identified separately.

The finite-type Steinberg tensor-product theorem is a distinct target, stated
first for the simply-connected semisimple root datum where every dominant
weight has the required `λ₀+ℓλ₁` decomposition, `0≤⟨λ₀,hᵢ⟩<ℓ`. Prove
`L_ζ(λ₀+ℓλ₁) ≅ L_ζ(λ₀)⊗Fr^*L(λ₁)` and then state any extension to other
root data only with its actual lattice hypotheses. This is not required to
construct the Frobenius algebra homomorphism.

## QEA7. Frobenius contraction and nilpotent restrictions

For a type-1 `U_ζ`-module `M`, require an internal algebraic direct-sum
`X`-weight decomposition `M=⊕_(μ∈X)M_μ` with the actual `K_y` character
`K_y m=ζ^⟨μ,y⟩m` for every `y∈Y` and `m∈M_μ`. The integral label is part of
the structure even when distinct weights have the same root-of-unity
character. Require also the full toral divided-binomial character laws, for
every `μ∈X`, `y∈Y`, `n∈ℕ` and `m∈M_μ`,
`[K_y;0 choose n]m = [⟨μ,y⟩ choose n]_ζ m`, using the signed-upper Gaussian
specialization fixed in QEA6. For each simple coroot require the separate
`vᵢ`-normalized law
`[Kᵢ;0 choose n]m = [⟨μ,hᵢ⟩ choose n]_(ζᵢ)m`. The divided-root shift laws
are `Eᵢ^(r)M_μ⊆M_(μ+rαᵢ)` and
`Fᵢ^(r)M_μ⊆M_(μ−rαᵢ)` for all `r≥0`; toral operators preserve each weight
space. These are hypotheses on the full divided-power action, not consequences
of the `K_y` eigenvalues: on the counit module `K_y=1` and the positive toral
divided binomials vanish, so it cannot be relabelled as a nonzero weight `ℓν`
when that label would require a nonzero binomial eigenvalue. Define

`M^(ℓ) = ⊕_(ν∈X) M_(ℓν)`

with new weight `ν` on the summand formerly indexed by `ℓν`. For every
`m≥0`, define the classical divided root operators `Xᵢ^(m)` and `Yᵢ^(m)` by
the restrictions of `Eᵢ^(ℓm)` and `Fᵢ^(ℓm)` to this selected weight sum; in
particular the ordinary generators use exponent `ℓ`. On `M_(ℓν)`, every
full-lattice divided Cartan operator in direction `y∈Y` is the specialization
of `[K_y;0 choose ℓm]` and must act by `binom(⟨ν,y⟩,m)`. The simple-coroot
operator is the corresponding `vᵢ`-normalized binomial and acts by
`binom(⟨ν,hᵢ⟩,m)`. Prove each divided operator preserves the selected sum,
all full-`Y` Kostant relations hold, and the construction is functorial for
maps preserving the weight decomposition and divided-power action. The specialized toral-binomial formula, including its normalization,
is part of the theorem; ordinary `K_y` eigenvalues alone do not specify the
Cartan action.
This is a projected-weight construction; it does not assume a splitting
`U(g)→U_ζ`.

Comparisons. A classical module here is a `U_ℤ(g)⊗R`-module `V` (full-`Y`
Kostant form) with an algebraic direct-sum decomposition `V=⊕_(ν∈X)V_ν` on
which `Xᵢ^(m)V_ν⊆V_(ν+mαᵢ)`, `Yᵢ^(m)V_ν⊆V_(ν−mαᵢ)` and `binom(H_y,m)` acts
on `V_ν` by `binom(⟨ν,y⟩,m)`. Its pullback `Fr^*V` through the QEA5 map is
given the weight decomposition `(Fr^*V)_(ℓν)=V_ν`; it satisfies the
hypotheses above by quantum Lucas (`[ℓ⟨ν,y⟩ choose n]_ζ` is
`binom(⟨ν,y⟩,n/ℓ)` when `ℓ|n` and `0` otherwise). Tensor products use the
QEA3 coproduct on `U_ζ`, whose divided-power form is the QEA1 formula
`Δ(Eᵢ^(n))=Σ_(a+b=n)vᵢ^(ab)Eᵢ^(a)Kᵢ^b⊗Eᵢ^(b)` specialized at `ζ`, and the
classical coproduct `Δ(Xᵢ^(m))=Σ_(a+b=m)Xᵢ^(a)⊗Xᵢ^(b)` on `U_ℤ(g)⊗R`; the
tensor product of two modules with the hypotheses above has them again, with
`(M⊗N)_λ=⊕_(μ+μ′=λ)M_μ⊗N_(μ′)`. Prove, for type-1 `U_ζ`-modules `M` with the
structure above and classical modules `V`, the following isomorphisms of
`U_ℤ(g)⊗R`-modules, natural in `M` and `V`, each the identity on the
underlying weight spaces (Gros–Kaneda, GrosKaneda2013 Lemma 6.8, line 1845,
whose weight-space computation does not use their finite generation
hypothesis):

- `(Fr^*V)^(ℓ) = V`;
- `(M⊗Fr^*V)^(ℓ) ≅ M^(ℓ)⊗V`, on `(M⊗Fr^*V)_(ℓκ)=⊕_ν M_(ℓ(κ−ν))⊗V_ν`;
- `(Fr^*V⊗M)^(ℓ) ≅ V⊗M^(ℓ)`, on `(Fr^*V⊗M)_(ℓκ)=⊕_ν V_ν⊗M_(ℓ(κ−ν))`.

In the second, `Eᵢ^(ℓm)` acts on `M_(ℓκ′)⊗V_ν` through the terms with `ℓ|b`
only (the others act by zero on `Fr^*V`), hence `ℓ|a`, and there
`vᵢ^(ab)↦ζᵢ^(ab)=1` and `Kᵢ^b` acts on `M_(ℓκ′)` by `1`; the third is the
same computation with `Kᵢ^b` acting on `Fr^*V` by `Fr(Kᵢ^b)=1`. The toral
binomials agree by Vandermonde's identity
`binom(⟨κ,y⟩,m)=Σ_(a+b=m)binom(⟨κ−ν,y⟩,a)binom(⟨ν,y⟩,b)`.

Contraction is not monoidal on arbitrary type-1 modules, and no isomorphism
`(M⊗N)^(ℓ)≅M^(ℓ)⊗N^(ℓ)` is claimed: in simply connected `A₁` with `ℓ=3`,
`M=N=L_ζ(ω)` has weights `±ω∉3X`, so `M^(3)=N^(3)=0`, while `(M⊗N)_0` is
two-dimensional and `0∈3X`, so `(M⊗N)^(3)≠0`.

Duals: for finite-dimensional `M` take the contragredient dual `M*`, with
`(x·f)(m)=f(S(x)m)` for the QEA1 antipode specialized at `ζ`, and
`(M*)_μ=(M_(−μ))*`. Prove `(M*)^(ℓ) ≅ (M^(ℓ))*`, natural in `M`, where the
right side is the contragredient dual for the classical antipode
`S(Xᵢ^(m))=(−1)^mXᵢ^(m)`, `S(Yᵢ^(m))=(−1)^mYᵢ^(m)`,
`S(binom(H_y,m))=binom(−H_y,m)`. On the selected weights
`S(Eᵢ^(ℓm))=(−1)^(ℓm)ζᵢ^(ℓm(ℓm−1))Kᵢ^(−ℓm)Eᵢ^(ℓm)` acts as
`(−1)^mEᵢ^(ℓm)`, because `ℓ` is odd and `ζ^ℓ=1`. No dual comparison is
stated for infinite-dimensional `M`, whose full algebraic dual need not be a
direct sum of weight spaces.

Keep the positive and negative unprojected divided-power restrictions as
separate `U(n⁺)` and `U(n⁻)` actions. The positive and negative unprojected restrictions are actions of their
respective nilpotent algebras; they do not make every original weight summand
a module for the full classical enveloping algebra.

## QEA8. Examples and geometry boundary

Construct the quantum plane `K⟨x,y⟩/(xy−v yx)`, with `K`-basis `y^j x^k`
(`j,k≥0`) and the grading by total degree, as a module algebra over rank-one
`U_v(sl₂)` (`I={1}`, `d₁=1`, `K=K_(h₁)`, `x` of weight `ω`, `y` of weight
`−ω`) by

`K(y^j x^k) = v^(k−j) y^j x^k`,
`E(y^j x^k) = [j]_v y^(j−1) x^(k+1)`,
`F(y^j x^k) = [k]_v y^(j+1) x^(k−1)`,

where the right side is `0` when `j=0` (for `E`) or `k=0` (for `F`). The
module-algebra laws are those of the QEA1 coproduct:
`K(ab)=K(a)K(b)`, `E(ab)=E(a)b+K(a)E(b)`, `F(ab)=F(a)K⁻¹(b)+aF(b)`. Prove
that these formulas define a `U_v` action compatible with multiplication, that
the degree-`n` part is the simple module of highest weight `nω` with highest
vector `x^n`, and that at `v=1` it is the action `E=x∂_y`, `F=y∂_x` on binary
forms of degree `n`.

**Checks.**

- `E(y)=x`, `F(x)=y`, `E(x)=F(y)=0`, `K(x)=v x`, `K(y)=v⁻¹y`; on degree one
  `(EF−FE)x=x=((K−K⁻¹)/(v−v⁻¹))x` and `(EF−FE)y=−y`.
- The defining relation is preserved: `E(xy)=K(x)E(y)=v x²` and
  `E(yx)=E(y)x=x²`, so `E(xy−v yx)=0`; `F(xy)=F(x)K⁻¹(y)=v y²` and
  `F(yx)=yF(x)=y²`, so `F(xy−v yx)=0`. With the opposite rule
  `E(ab)=E(a)K(b)+aE(b)` one gets `E(xy−v yx)=x²−v²x²≠0`, so the factor
  order of the QEA1 coproduct is what makes the action well defined.
- Iterating the module-algebra law gives `E(y^j)=[j]_v y^(j−1)x`, e.g.
  `E(y²)=xy+v⁻¹yx=(v+v⁻¹)yx`, which pins the symmetric quantum integer
  rather than `1+v²+…+v^(2j−2)`.

The Chevalley/Pieri divisor formula is a geometric statement owned by the
finite SchubertGeometry layer with its codimension-one predecessor,
normalized extremal section and coroot-coefficient inputs. QEA provides no
quantum flag variety, quantum cohomology ring, or quantum Schubert product.
Any such development requires its own geometric carrier, coefficient ring,
deformation parameter and comparison maps before it can consume QEA. Kac–Moody flag/ind-scheme geometry
is not inferred from the finite-type formula.
## References

- McGerty2006: Kevin McGerty, *Hall algebras and quantum Frobenius*, arXiv
  math/0601150. The even-order modified Frobenius contract uses its §2
  (arXiv v1), including the modified root datum and small-order hypotheses;
  the normalized simply-laced case is included, and failure of those
  sufficient hypotheses asserts no nonexistence theorem. The definition of
  the modified form and its integral form (lines 120–157) and the
  presentation of its specializations through the integral halves
  (Lemma 2.2, line 161, which refers to Lusztig's book, 31.1.3) are cited
  from arXiv v4.
- GrosKaneda2013: Michel Gros and Masaharu Kaneda, *Un scindage du morphisme
  de Frobenius quantique*, arXiv 1302.2437 (v2), §6.7 and Lemma 6.8
  (line 1845): the tensor-product compatibility of Frobenius contraction with
  a Frobenius pullback.
